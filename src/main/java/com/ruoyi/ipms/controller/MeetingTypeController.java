package com.ruoyi.system.controller;

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
import com.ruoyi.system.domain.MeetingType;
import com.ruoyi.system.service.IMeetingTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 会议类型Controller
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@RestController
@RequestMapping("/ipms/type")
public class MeetingTypeController extends BaseController
{
    @Autowired
    private IMeetingTypeService meetingTypeService;

    /**
     * 查询会议类型列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:type:list')")
    @GetMapping("/list")
    public TableDataInfo list(MeetingType meetingType)
    {
        startPage();
        List<MeetingType> list = meetingTypeService.selectMeetingTypeList(meetingType);
        return getDataTable(list);
    }

    /**
     * 导出会议类型列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:type:export')")
    @Log(title = "会议类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MeetingType meetingType)
    {
        List<MeetingType> list = meetingTypeService.selectMeetingTypeList(meetingType);
        ExcelUtil<MeetingType> util = new ExcelUtil<MeetingType>(MeetingType.class);
        util.exportExcel(response, list, "会议类型数据");
    }

    /**
     * 获取会议类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('ipms:type:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(meetingTypeService.selectMeetingTypeById(id));
    }

    /**
     * 新增会议类型
     */
    @PreAuthorize("@ss.hasPermi('ipms:type:add')")
    @Log(title = "会议类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MeetingType meetingType)
    {
        return toAjax(meetingTypeService.insertMeetingType(meetingType));
    }

    /**
     * 修改会议类型
     */
    @PreAuthorize("@ss.hasPermi('ipms:type:edit')")
    @Log(title = "会议类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MeetingType meetingType)
    {
        return toAjax(meetingTypeService.updateMeetingType(meetingType));
    }

    /**
     * 删除会议类型
     */
    @PreAuthorize("@ss.hasPermi('ipms:type:remove')")
    @Log(title = "会议类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(meetingTypeService.deleteMeetingTypeByIds(ids));
    }
}
