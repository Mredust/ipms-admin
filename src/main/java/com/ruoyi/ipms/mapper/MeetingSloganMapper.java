package com.ruoyi.ipms.mapper;

import java.util.List;
import com.ruoyi.ipms.domain.MeetingSlogan;

/**
 * 会议标语Mapper接口
 * 
 * @author Mredust
 * @date 2026-02-07
 */
public interface MeetingSloganMapper 
{
    /**
     * 查询会议标语
     * 
     * @param id 会议标语主键
     * @return 会议标语
     */
    public MeetingSlogan selectMeetingSloganById(Long id);

    /**
     * 查询会议标语列表
     * 
     * @param meetingSlogan 会议标语
     * @return 会议标语集合
     */
    public List<MeetingSlogan> selectMeetingSloganList(MeetingSlogan meetingSlogan);

    /**
     * 新增会议标语
     * 
     * @param meetingSlogan 会议标语
     * @return 结果
     */
    public int insertMeetingSlogan(MeetingSlogan meetingSlogan);

    /**
     * 修改会议标语
     * 
     * @param meetingSlogan 会议标语
     * @return 结果
     */
    public int updateMeetingSlogan(MeetingSlogan meetingSlogan);

    /**
     * 删除会议标语
     * 
     * @param id 会议标语主键
     * @return 结果
     */
    public int deleteMeetingSloganById(Long id);

    /**
     * 批量删除会议标语
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMeetingSloganByIds(Long[] ids);
}
