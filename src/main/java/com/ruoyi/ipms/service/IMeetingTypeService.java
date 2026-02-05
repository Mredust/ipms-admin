package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.MeetingType;

/**
 * 会议类型Service接口
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public interface IMeetingTypeService 
{
    /**
     * 查询会议类型
     * 
     * @param id 会议类型主键
     * @return 会议类型
     */
    public MeetingType selectMeetingTypeById(Long id);

    /**
     * 查询会议类型列表
     * 
     * @param meetingType 会议类型
     * @return 会议类型集合
     */
    public List<MeetingType> selectMeetingTypeList(MeetingType meetingType);

    /**
     * 新增会议类型
     * 
     * @param meetingType 会议类型
     * @return 结果
     */
    public int insertMeetingType(MeetingType meetingType);

    /**
     * 修改会议类型
     * 
     * @param meetingType 会议类型
     * @return 结果
     */
    public int updateMeetingType(MeetingType meetingType);

    /**
     * 批量删除会议类型
     * 
     * @param ids 需要删除的会议类型主键集合
     * @return 结果
     */
    public int deleteMeetingTypeByIds(Long[] ids);

    /**
     * 删除会议类型信息
     * 
     * @param id 会议类型主键
     * @return 结果
     */
    public int deleteMeetingTypeById(Long id);
}
