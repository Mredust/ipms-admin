package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.MeetingRoom;

/**
 * 会议室Mapper接口
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public interface MeetingRoomMapper 
{
    /**
     * 查询会议室
     * 
     * @param id 会议室主键
     * @return 会议室
     */
    public MeetingRoom selectMeetingRoomById(Long id);

    /**
     * 查询会议室列表
     * 
     * @param meetingRoom 会议室
     * @return 会议室集合
     */
    public List<MeetingRoom> selectMeetingRoomList(MeetingRoom meetingRoom);

    /**
     * 新增会议室
     * 
     * @param meetingRoom 会议室
     * @return 结果
     */
    public int insertMeetingRoom(MeetingRoom meetingRoom);

    /**
     * 修改会议室
     * 
     * @param meetingRoom 会议室
     * @return 结果
     */
    public int updateMeetingRoom(MeetingRoom meetingRoom);

    /**
     * 删除会议室
     * 
     * @param id 会议室主键
     * @return 结果
     */
    public int deleteMeetingRoomById(Long id);

    /**
     * 批量删除会议室
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMeetingRoomByIds(Long[] ids);
}
