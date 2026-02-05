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
import com.ruoyi.system.domain.MeetingRoom;
import com.ruoyi.system.service.IMeetingRoomService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 会议室Controller
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@RestController
@RequestMapping("/ipms/room")
public class MeetingRoomController extends BaseController
{
    @Autowired
    private IMeetingRoomService meetingRoomService;

    /**
     * 查询会议室列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:room:list')")
    @GetMapping("/list")
    public TableDataInfo list(MeetingRoom meetingRoom)
    {
        startPage();
        List<MeetingRoom> list = meetingRoomService.selectMeetingRoomList(meetingRoom);
        return getDataTable(list);
    }

    /**
     * 导出会议室列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:room:export')")
    @Log(title = "会议室", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MeetingRoom meetingRoom)
    {
        List<MeetingRoom> list = meetingRoomService.selectMeetingRoomList(meetingRoom);
        ExcelUtil<MeetingRoom> util = new ExcelUtil<MeetingRoom>(MeetingRoom.class);
        util.exportExcel(response, list, "会议室数据");
    }

    /**
     * 获取会议室详细信息
     */
    @PreAuthorize("@ss.hasPermi('ipms:room:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(meetingRoomService.selectMeetingRoomById(id));
    }

    /**
     * 新增会议室
     */
    @PreAuthorize("@ss.hasPermi('ipms:room:add')")
    @Log(title = "会议室", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MeetingRoom meetingRoom)
    {
        return toAjax(meetingRoomService.insertMeetingRoom(meetingRoom));
    }

    /**
     * 修改会议室
     */
    @PreAuthorize("@ss.hasPermi('ipms:room:edit')")
    @Log(title = "会议室", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MeetingRoom meetingRoom)
    {
        return toAjax(meetingRoomService.updateMeetingRoom(meetingRoom));
    }

    /**
     * 删除会议室
     */
    @PreAuthorize("@ss.hasPermi('ipms:room:remove')")
    @Log(title = "会议室", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(meetingRoomService.deleteMeetingRoomByIds(ids));
    }
}
