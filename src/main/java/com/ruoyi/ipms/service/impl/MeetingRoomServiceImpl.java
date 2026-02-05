package com.ruoyi.ipms.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ipms.mapper.MeetingRoomMapper;
import com.ruoyi.ipms.domain.MeetingRoom;
import com.ruoyi.ipms.service.IMeetingRoomService;

/**
 * 会议室Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@Service
public class MeetingRoomServiceImpl implements IMeetingRoomService 
{
    @Autowired
    private MeetingRoomMapper meetingRoomMapper;

    /**
     * 查询会议室
     * 
     * @param id 会议室主键
     * @return 会议室
     */
    @Override
    public MeetingRoom selectMeetingRoomById(Long id)
    {
        return meetingRoomMapper.selectMeetingRoomById(id);
    }

    /**
     * 查询会议室列表
     * 
     * @param meetingRoom 会议室
     * @return 会议室
     */
    @Override
    public List<MeetingRoom> selectMeetingRoomList(MeetingRoom meetingRoom)
    {
        return meetingRoomMapper.selectMeetingRoomList(meetingRoom);
    }

    /**
     * 新增会议室
     * 
     * @param meetingRoom 会议室
     * @return 结果
     */
    @Override
    public int insertMeetingRoom(MeetingRoom meetingRoom)
    {
        meetingRoom.setCreateTime(DateUtils.getNowDate());
        return meetingRoomMapper.insertMeetingRoom(meetingRoom);
    }

    /**
     * 修改会议室
     * 
     * @param meetingRoom 会议室
     * @return 结果
     */
    @Override
    public int updateMeetingRoom(MeetingRoom meetingRoom)
    {
        meetingRoom.setUpdateTime(DateUtils.getNowDate());
        return meetingRoomMapper.updateMeetingRoom(meetingRoom);
    }

    /**
     * 批量删除会议室
     * 
     * @param ids 需要删除的会议室主键
     * @return 结果
     */
    @Override
    public int deleteMeetingRoomByIds(Long[] ids)
    {
        return meetingRoomMapper.deleteMeetingRoomByIds(ids);
    }

    /**
     * 删除会议室信息
     * 
     * @param id 会议室主键
     * @return 结果
     */
    @Override
    public int deleteMeetingRoomById(Long id)
    {
        return meetingRoomMapper.deleteMeetingRoomById(id);
    }
}
