package com.ruoyi.ipms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ipms.mapper.MeetingSloganMapper;
import com.ruoyi.ipms.domain.MeetingSlogan;
import com.ruoyi.ipms.service.IMeetingSloganService;

/**
 * 会议标语Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-07
 */
@Service
public class MeetingSloganServiceImpl implements IMeetingSloganService 
{
    @Autowired
    private MeetingSloganMapper meetingSloganMapper;

    /**
     * 查询会议标语
     * 
     * @param id 会议标语主键
     * @return 会议标语
     */
    @Override
    public MeetingSlogan selectMeetingSloganById(Long id)
    {
        return meetingSloganMapper.selectMeetingSloganById(id);
    }

    /**
     * 查询会议标语列表
     * 
     * @param meetingSlogan 会议标语
     * @return 会议标语
     */
    @Override
    public List<MeetingSlogan> selectMeetingSloganList(MeetingSlogan meetingSlogan)
    {
        return meetingSloganMapper.selectMeetingSloganList(meetingSlogan);
    }

    /**
     * 新增会议标语
     * 
     * @param meetingSlogan 会议标语
     * @return 结果
     */
    @Override
    public int insertMeetingSlogan(MeetingSlogan meetingSlogan)
    {
        return meetingSloganMapper.insertMeetingSlogan(meetingSlogan);
    }

    /**
     * 修改会议标语
     * 
     * @param meetingSlogan 会议标语
     * @return 结果
     */
    @Override
    public int updateMeetingSlogan(MeetingSlogan meetingSlogan)
    {
        return meetingSloganMapper.updateMeetingSlogan(meetingSlogan);
    }

    /**
     * 批量删除会议标语
     * 
     * @param ids 需要删除的会议标语主键
     * @return 结果
     */
    @Override
    public int deleteMeetingSloganByIds(Long[] ids)
    {
        return meetingSloganMapper.deleteMeetingSloganByIds(ids);
    }

    /**
     * 删除会议标语信息
     * 
     * @param id 会议标语主键
     * @return 结果
     */
    @Override
    public int deleteMeetingSloganById(Long id)
    {
        return meetingSloganMapper.deleteMeetingSloganById(id);
    }
}
