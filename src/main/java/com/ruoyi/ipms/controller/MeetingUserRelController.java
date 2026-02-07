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
import com.ruoyi.ipms.domain.MeetingUserRel;
import com.ruoyi.ipms.service.IMeetingUserRelService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 会议-参会人员关联Controller
 * 
 * @author Mredust
 * @date 2026-02-07
 */
@RestController
@RequestMapping("/ipms/rel")
public class MeetingUserRelController extends BaseController
{
    @Autowired
    private IMeetingUserRelService meetingUserRelService;

    /**
     * 查询会议-参会人员关联列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:rel:list')")
    @GetMapping("/list")
    public TableDataInfo list(MeetingUserRel meetingUserRel)
    {
        startPage();
        List<MeetingUserRel> list = meetingUserRelService.selectMeetingUserRelList(meetingUserRel);
        return getDataTable(list);
    }

    /**
     * 导出会议-参会人员关联列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:rel:export')")
    @Log(title = "会议-参会人员关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MeetingUserRel meetingUserRel)
    {
        List<MeetingUserRel> list = meetingUserRelService.selectMeetingUserRelList(meetingUserRel);
        ExcelUtil<MeetingUserRel> util = new ExcelUtil<MeetingUserRel>(MeetingUserRel.class);
        util.exportExcel(response, list, "会议-参会人员关联数据");
    }

    /**
     * 获取会议-参会人员关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('ipms:rel:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(meetingUserRelService.selectMeetingUserRelById(id));
    }

    /**
     * 新增会议-参会人员关联
     */
    @PreAuthorize("@ss.hasPermi('ipms:rel:add')")
    @Log(title = "会议-参会人员关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MeetingUserRel meetingUserRel)
    {
        return toAjax(meetingUserRelService.insertMeetingUserRel(meetingUserRel));
    }

    /**
     * 修改会议-参会人员关联
     */
    @PreAuthorize("@ss.hasPermi('ipms:rel:edit')")
    @Log(title = "会议-参会人员关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MeetingUserRel meetingUserRel)
    {
        return toAjax(meetingUserRelService.updateMeetingUserRel(meetingUserRel));
    }

    /**
     * 删除会议-参会人员关联
     */
    @PreAuthorize("@ss.hasPermi('ipms:rel:remove')")
    @Log(title = "会议-参会人员关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(meetingUserRelService.deleteMeetingUserRelByIds(ids));
    }
}
