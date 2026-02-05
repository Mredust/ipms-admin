package com.ruoyi.ipms.mapper;

import java.util.List;
import com.ruoyi.ipms.domain.MeetingType;

/**
 * 会议类型Mapper接口
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public interface MeetingTypeMapper 
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
     * 删除会议类型
     * 
     * @param id 会议类型主键
     * @return 结果
     */
    public int deleteMeetingTypeById(Long id);

    /**
     * 批量删除会议类型
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMeetingTypeByIds(Long[] ids);
}
