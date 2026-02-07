package com.ruoyi.ipms.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.config.ServerConfig;
import com.ruoyi.ipms.domain.MeetingMaterial;
import com.ruoyi.ipms.service.IMeetingMaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

/**
 * 会议资料Controller
 *
 * @author Mredust
 * @date 2026-02-06
 */
@RestController
@RequestMapping("/ipms/material")
public class MeetingMaterialController extends BaseController {
    @Autowired
    private IMeetingMaterialService meetingMaterialService;

    @Autowired
    private ServerConfig serverConfig;

    /**
     * 查询会议资料列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:material:list')")
    @GetMapping("/list")
    public TableDataInfo list(MeetingMaterial meetingMaterial) {
        startPage();
        List<MeetingMaterial> list = meetingMaterialService.selectMeetingMaterialList(meetingMaterial);
        return getDataTable(list);
    }

    /**
     * 导出会议资料列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:material:export')")
    @Log(title = "会议资料", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MeetingMaterial meetingMaterial) {
        List<MeetingMaterial> list = meetingMaterialService.selectMeetingMaterialList(meetingMaterial);
        ExcelUtil<MeetingMaterial> util = new ExcelUtil<MeetingMaterial>(MeetingMaterial.class);
        util.exportExcel(response, list, "会议资料数据");
    }

    /**
     * 获取会议资料详细信息
     */
    @PreAuthorize("@ss.hasPermi('ipms:material:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(meetingMaterialService.selectMeetingMaterialById(id));
    }

    /**
     * 新增会议资料
     */
    @PreAuthorize("@ss.hasPermi('ipms:material:add')")
    @Log(title = "会议资料", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestParam("file") MultipartFile file,
                          @RequestParam(value = "meetingId", required = false) Long meetingId,
                          @RequestParam(value = "agendaId", required = false) Long agendaId) {
        return saveMaterial(file, null, meetingId, agendaId);
    }

    /**
     * 修改会议资料
     */
    @PreAuthorize("@ss.hasPermi('ipms:material:edit')")
    @Log(title = "会议资料", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestParam("id") Long id,
                           @RequestParam("file") MultipartFile file,
                           @RequestParam(value = "meetingId", required = false) Long meetingId,
                           @RequestParam(value = "agendaId", required = false) Long agendaId) {
        return saveMaterial(file, id, meetingId, agendaId);
    }

    /**
     * 删除会议资料
     */
    @PreAuthorize("@ss.hasPermi('ipms:material:remove')")
    @Log(title = "会议资料", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(meetingMaterialService.deleteMeetingMaterialByIds(ids));
    }

    private AjaxResult saveMaterial(MultipartFile file, Long id, Long meetingId, Long agendaId) {
        if (file == null) {
            return AjaxResult.error("上传文件不能为空");
        }
        try {
            String uploadPath = RuoYiConfig.getUploadPath();
            String storedFile = FileUploadUtils.upload(uploadPath, file);
            String originalName = file.getOriginalFilename();

            MeetingMaterial material = new MeetingMaterial();
            material.setId(id);
            material.setFileName(StringUtils.isNotEmpty(originalName) ? originalName : FileUtils.getName(storedFile));
            material.setFileType(resolveFileType(originalName));
            material.setFileSize(calcFileSizeKb(file.getSize()));
            material.setFileSort(0L);
            material.setOpenDownload(serverConfig.getUrl() + storedFile);
            material.setMeetingId(meetingId);
            material.setAgendaId(agendaId);

            int rows = (id == null)
                    ? meetingMaterialService.insertMeetingMaterial(material)
                    : meetingMaterialService.updateMeetingMaterial(material);
            AjaxResult ajax = toAjax(rows);
            ajax.put("data", material);
            return ajax;
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    private String resolveFileType(String fileName) {
        if (StringUtils.isEmpty(fileName) || !fileName.contains(".")) {
            return "";
        }
        return StringUtils.substringAfterLast(fileName, ".").toLowerCase();
    }

    private BigDecimal calcFileSizeKb(long size) {
        return BigDecimal.valueOf(size).divide(BigDecimal.valueOf(1024), 2, RoundingMode.HALF_UP);
    }

}
