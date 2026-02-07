package com.ruoyi.ipms.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.ipms.domain.MeetingSlogan;
import com.ruoyi.ipms.service.IMeetingSloganService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 会议标语Controller
 * 
 * @author Mredust
 * @date 2026-02-07
 */
@RestController
@RequestMapping("/ipms/slogan")
public class MeetingSloganController extends BaseController
{
    @Autowired
    private IMeetingSloganService meetingSloganService;

    /**
     * 查询会议标语列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:slogan:list')")
    @GetMapping("/list")
    public TableDataInfo list(MeetingSlogan meetingSlogan)
    {
        startPage();
        List<MeetingSlogan> list = meetingSloganService.selectMeetingSloganList(meetingSlogan);
        return getDataTable(list);
    }

    /**
     * 导出会议标语列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:slogan:export')")
    @Log(title = "会议标语", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MeetingSlogan meetingSlogan)
    {
        List<MeetingSlogan> list = meetingSloganService.selectMeetingSloganList(meetingSlogan);
        ExcelUtil<MeetingSlogan> util = new ExcelUtil<MeetingSlogan>(MeetingSlogan.class);
        util.exportExcel(response, list, "会议标语数据");
    }

    /**
     * 获取会议标语详细信息
     */
    @PreAuthorize("@ss.hasPermi('ipms:slogan:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(meetingSloganService.selectMeetingSloganById(id));
    }

    /**
     * 新增会议标语
     */
    @PreAuthorize("@ss.hasPermi('ipms:slogan:add')")
    @Log(title = "会议标语", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MeetingSlogan meetingSlogan)
    {
        return toAjax(meetingSloganService.insertMeetingSlogan(meetingSlogan));
    }

    /**
     * 修改会议标语
     */
    @PreAuthorize("@ss.hasPermi('ipms:slogan:edit')")
    @Log(title = "会议标语", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MeetingSlogan meetingSlogan)
    {
        return toAjax(meetingSloganService.updateMeetingSlogan(meetingSlogan));
    }

    /**
     * 删除会议标语
     */
    @PreAuthorize("@ss.hasPermi('ipms:slogan:remove')")
    @Log(title = "会议标语", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(meetingSloganService.deleteMeetingSloganByIds(ids));
    }
}
