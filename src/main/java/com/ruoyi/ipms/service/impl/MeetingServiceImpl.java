package com.ruoyi.ipms.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.ipms.mapper.MeetingMapper;
import com.ruoyi.ipms.domain.Meeting;
import com.ruoyi.ipms.service.IMeetingService;
import com.ruoyi.ipms.domain.MeetingSlogan;
import com.ruoyi.ipms.service.IMeetingSloganService;
import com.ruoyi.ipms.domain.MeetingAgenda;
import com.ruoyi.ipms.service.IMeetingAgendaService;

/**
 * 会议Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@Service
public class MeetingServiceImpl implements IMeetingService 
{
    @Autowired
    private MeetingMapper meetingMapper;

    @Autowired
    private IMeetingSloganService meetingSloganService;

    @Autowired
    private IMeetingAgendaService meetingAgendaService;

    /**
     * 查询会议
     * 
     * @param id 会议主键
     * @return 会议
     */
    @Override
    public Meeting selectMeetingById(Long id)
    {
        return meetingMapper.selectMeetingById(id);
    }

    /**
     * 查询会议列表
     * 
     * @param meeting 会议
     * @return 会议
     */
    @Override
    public List<Meeting> selectMeetingList(Meeting meeting)
    {
        return meetingMapper.selectMeetingList(meeting);
    }

    /**
     * 新增会议
     * 
     * @param meeting 会议
     * @return 结果
     */
    @Override
    @Transactional
    public int insertMeeting(Meeting meeting)
    {
        meeting.setCreateTime(DateUtils.getNowDate());
        if (meeting.getSloganId() == null)
        {
            MeetingSlogan slogan = new MeetingSlogan();
            slogan.setWelcomeText("欢迎您莅临此次会议");
            slogan.setMainTitleFont("方正小标宋简体");
            slogan.setMainTitleColor("#ffffff");
            slogan.setMainTitleSize("8em");
            slogan.setOtherFont("方正小标宋简体");
            slogan.setOtherColor("#ffffff");
            slogan.setOtherSize("2em");
            meetingSloganService.insertMeetingSlogan(slogan);
            meeting.setSloganId(slogan.getId());
        }
        if (meeting.getAgendaId() == null)
        {
            MeetingAgenda agenda = new MeetingAgenda();
            agenda.setTextJson("[]");
            meetingAgendaService.insertMeetingAgenda(agenda);
            meeting.setAgendaId(agenda.getId());
        }
        return meetingMapper.insertMeeting(meeting);
    }

    /**
     * 修改会议
     * 
     * @param meeting 会议
     * @return 结果
     */
    @Override
    public int updateMeeting(Meeting meeting)
    {
        meeting.setUpdateTime(DateUtils.getNowDate());
        return meetingMapper.updateMeeting(meeting);
    }

    /**
     * 批量删除会议
     * 
     * @param ids 需要删除的会议主键
     * @return 结果
     */
    @Override
    public int deleteMeetingByIds(Long[] ids)
    {
        return meetingMapper.deleteMeetingByIds(ids);
    }

    /**
     * 删除会议信息
     * 
     * @param id 会议主键
     * @return 结果
     */
    @Override
    public int deleteMeetingById(Long id)
    {
        return meetingMapper.deleteMeetingById(id);
    }
}
