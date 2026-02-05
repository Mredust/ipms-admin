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
import com.ruoyi.ipms.domain.MeetingFeature;
import com.ruoyi.ipms.service.IMeetingFeatureService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 会议功能Controller
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@RestController
@RequestMapping("/ipms/feature")
public class MeetingFeatureController extends BaseController
{
    @Autowired
    private IMeetingFeatureService meetingFeatureService;

    /**
     * 查询会议功能列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:feature:list')")
    @GetMapping("/list")
    public TableDataInfo list(MeetingFeature meetingFeature)
    {
        startPage();
        List<MeetingFeature> list = meetingFeatureService.selectMeetingFeatureList(meetingFeature);
        return getDataTable(list);
    }

    /**
     * 导出会议功能列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:feature:export')")
    @Log(title = "会议功能", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MeetingFeature meetingFeature)
    {
        List<MeetingFeature> list = meetingFeatureService.selectMeetingFeatureList(meetingFeature);
        ExcelUtil<MeetingFeature> util = new ExcelUtil<MeetingFeature>(MeetingFeature.class);
        util.exportExcel(response, list, "会议功能数据");
    }

    /**
     * 获取会议功能详细信息
     */
    @PreAuthorize("@ss.hasPermi('ipms:feature:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(meetingFeatureService.selectMeetingFeatureById(id));
    }

    /**
     * 新增会议功能
     */
    @PreAuthorize("@ss.hasPermi('ipms:feature:add')")
    @Log(title = "会议功能", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MeetingFeature meetingFeature)
    {
        return toAjax(meetingFeatureService.insertMeetingFeature(meetingFeature));
    }

    /**
     * 修改会议功能
     */
    @PreAuthorize("@ss.hasPermi('ipms:feature:edit')")
    @Log(title = "会议功能", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MeetingFeature meetingFeature)
    {
        return toAjax(meetingFeatureService.updateMeetingFeature(meetingFeature));
    }

    /**
     * 删除会议功能
     */
    @PreAuthorize("@ss.hasPermi('ipms:feature:remove')")
    @Log(title = "会议功能", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(meetingFeatureService.deleteMeetingFeatureByIds(ids));
    }
}
