package com.ruoyi.ipms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.ipms.domain.Meeting;
import com.ruoyi.ipms.domain.MeetingAgenda;
import com.ruoyi.ipms.domain.MeetingMaterial;
import com.ruoyi.ipms.service.IMeetingService;
import com.ruoyi.ipms.service.IMeetingAgendaService;
import com.ruoyi.ipms.service.IMeetingMaterialService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUtils;

/**
 * 会议Controller
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@RestController
@RequestMapping("/ipms/meeting")
public class MeetingController extends BaseController
{
    @Autowired
    private IMeetingService meetingService;

    @Autowired
    private IMeetingAgendaService meetingAgendaService;

    @Autowired
    private IMeetingMaterialService meetingMaterialService;

    /**
     * 查询会议列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:meeting:list')")
    @GetMapping("/list")
    public TableDataInfo list(Meeting meeting)
    {
        startPage();
        List<Meeting> list = meetingService.selectMeetingList(meeting);
        return getDataTable(list);
    }

    /**
     * 导出会议列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:meeting:export')")
    @Log(title = "会议", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Meeting meeting)
    {
        List<Meeting> list = meetingService.selectMeetingList(meeting);
        ExcelUtil<Meeting> util = new ExcelUtil<Meeting>(Meeting.class);
        util.exportExcel(response, list, "会议数据");
    }

    /**
     * 获取会议详细信息
     */
    @PreAuthorize("@ss.hasPermi('ipms:meeting:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(meetingService.selectMeetingById(id));
    }

    /**
     * 新增会议
     */
    @PreAuthorize("@ss.hasPermi('ipms:meeting:add')")
    @Log(title = "会议", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Meeting meeting)
    {
        return toAjax(meetingService.insertMeeting(meeting));
    }

    /**
     * 修改会议
     */
    @PreAuthorize("@ss.hasPermi('ipms:meeting:edit')")
    @Log(title = "会议", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Meeting meeting)
    {
        return toAjax(meetingService.updateMeeting(meeting));
    }

    /**
     * 删除会议
     */
    @PreAuthorize("@ss.hasPermi('ipms:meeting:remove')")
    @Log(title = "会议", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(meetingService.deleteMeetingByIds(ids));
    }

    /**
     * 下载会议议程文件（主文件+附件）
     */
    @PreAuthorize("@ss.hasPermi('ipms:meeting:query')")
    @GetMapping("/agenda/download/{id}")
    public void downloadAgenda(@PathVariable("id") Long id, HttpServletResponse response) throws IOException
    {
        Meeting meeting = meetingService.selectMeetingById(id);
        if (meeting == null)
        {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "会议不存在");
            return;
        }
        String meetingName = StringUtils.isNotEmpty(meeting.getMeetingName()) ? meeting.getMeetingName() : "会议";
        String zipName = meetingName + "-议程文件.zip";
        response.setContentType("application/zip");
        FileUtils.setAttachmentResponseHeader(response, zipName);

        Set<String> added = new HashSet<>();
        ZipOutputStream zip = new ZipOutputStream(response.getOutputStream());
        try
        {
            // 主文件
            if (meeting.getAgendaId() != null)
            {
                MeetingAgenda agenda = meetingAgendaService.selectMeetingAgendaById(meeting.getAgendaId());
                if (agenda != null && StringUtils.isNotEmpty(agenda.getTextJson()))
                {
                    List<java.util.Map<String, Object>> rows = new ArrayList<>();
                    try
                    {
                        rows = new ObjectMapper()
                            .readValue(agenda.getTextJson(), new TypeReference<List<java.util.Map<String, Object>>>() {});
                    }
                    catch (Exception ignored)
                    {
                        rows = new ArrayList<>();
                    }
                    for (java.util.Map<String, Object> row : rows)
                    {
                        String mainFile = toStringValue(row.get("mainFile"));
                        if (StringUtils.isEmpty(mainFile))
                        {
                            mainFile = toStringValue(row.get("main_file"));
                        }
                        if (StringUtils.isNotEmpty(mainFile))
                        {
                            addFileToZip(mainFile, zip, added);
                        }
                    }
                }
            }
            // 附件
            MeetingMaterial query = new MeetingMaterial();
            query.setMeetingId(id);
            List<MeetingMaterial> materials = meetingMaterialService.selectMeetingMaterialList(query);
            for (MeetingMaterial material : materials)
            {
                if (material != null && StringUtils.isNotEmpty(material.getFileName()))
                {
                    addFileToZip(material.getFileName(), zip, added);
                }
            }
            zip.finish();
        }
        finally
        {
            zip.close();
        }
    }

    private void addFileToZip(String filePath, ZipOutputStream zip, Set<String> added) throws IOException
    {
        String absolutePath = resolveAbsolutePath(filePath);
        if (StringUtils.isEmpty(absolutePath))
        {
            return;
        }
        File file = new File(absolutePath);
        if (!file.exists() || !file.isFile())
        {
            return;
        }
        String entryName = FileUtils.getName(filePath);
        if (!added.add(entryName))
        {
            entryName = System.currentTimeMillis() + "_" + entryName;
            if (!added.add(entryName))
            {
                return;
            }
        }
        zip.putNextEntry(new ZipEntry(entryName));
        try (FileInputStream input = new FileInputStream(file))
        {
            byte[] buffer = new byte[4096];
            int len;
            while ((len = input.read(buffer)) > 0)
            {
                zip.write(buffer, 0, len);
            }
        }
        zip.closeEntry();
    }

    private String resolveAbsolutePath(String filePath)
    {
        if (StringUtils.isEmpty(filePath))
        {
            return "";
        }
        if (StringUtils.startsWith(filePath, "http"))
        {
            return "";
        }
        String relativePath = filePath;
        if (StringUtils.startsWith(filePath, Constants.RESOURCE_PREFIX))
        {
            relativePath = StringUtils.substringAfter(filePath, Constants.RESOURCE_PREFIX);
        }
        if (StringUtils.startsWith(relativePath, "/") || StringUtils.startsWith(relativePath, "\\"))
        {
            relativePath = relativePath.substring(1);
        }
        if (StringUtils.isEmpty(relativePath))
        {
            return "";
        }
        return RuoYiConfig.getProfile() + File.separator + relativePath;
    }

    private String toStringValue(Object value)
    {
        return value == null ? "" : String.valueOf(value);
    }
}
