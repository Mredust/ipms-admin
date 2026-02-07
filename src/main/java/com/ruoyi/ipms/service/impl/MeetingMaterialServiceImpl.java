package com.ruoyi.ipms.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ipms.mapper.MeetingMaterialMapper;
import com.ruoyi.ipms.domain.MeetingMaterial;
import com.ruoyi.ipms.service.IMeetingMaterialService;
import com.ruoyi.ipms.domain.Meeting;
import com.ruoyi.ipms.mapper.MeetingMapper;
import com.ruoyi.ipms.service.IMeetingAgendaService;

/**
 * 会议资料Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-06
 */
@Service
public class MeetingMaterialServiceImpl implements IMeetingMaterialService 
{
    @Autowired
    private MeetingMaterialMapper meetingMaterialMapper;

    @Autowired
    private MeetingMapper meetingMapper;

    @Autowired
    private IMeetingAgendaService meetingAgendaService;

    /**
     * 查询会议资料
     * 
     * @param id 会议资料主键
     * @return 会议资料
     */
    @Override
    public MeetingMaterial selectMeetingMaterialById(Long id)
    {
        return meetingMaterialMapper.selectMeetingMaterialById(id);
    }

    /**
     * 查询会议资料列表
     * 
     * @param meetingMaterial 会议资料
     * @return 会议资料
     */
    @Override
    public List<MeetingMaterial> selectMeetingMaterialList(MeetingMaterial meetingMaterial)
    {
        return meetingMaterialMapper.selectMeetingMaterialList(meetingMaterial);
    }

    /**
     * 新增会议资料
     * 
     * @param meetingMaterial 会议资料
     * @return 结果
     */
    @Override
    public int insertMeetingMaterial(MeetingMaterial meetingMaterial)
    {
        meetingMaterial.setCreateTime(DateUtils.getNowDate());
        int rows = meetingMaterialMapper.insertMeetingMaterial(meetingMaterial);
        appendAgendaAttachment(meetingMaterial);
        return rows;
    }

    /**
     * 修改会议资料
     * 
     * @param meetingMaterial 会议资料
     * @return 结果
     */
    @Override
    public int updateMeetingMaterial(MeetingMaterial meetingMaterial)
    {
        return meetingMaterialMapper.updateMeetingMaterial(meetingMaterial);
    }

    /**
     * 批量删除会议资料
     * 
     * @param ids 需要删除的会议资料主键
     * @return 结果
     */
    @Override
    public int deleteMeetingMaterialByIds(Long[] ids)
    {
        if (ids == null || ids.length == 0)
        {
            return 0;
        }
        List<MeetingMaterial> materials = new ArrayList<>();
        for (Long id : ids)
        {
            MeetingMaterial material = meetingMaterialMapper.selectMeetingMaterialById(id);
            if (material != null)
            {
                materials.add(material);
            }
        }
        int rows = meetingMaterialMapper.deleteMeetingMaterialByIds(ids);
        if (rows > 0)
        {
            materials.forEach(this::removeAgendaAttachment);
        }
        return rows;
    }

    /**
     * 删除会议资料信息
     * 
     * @param id 会议资料主键
     * @return 结果
     */
    @Override
    public int deleteMeetingMaterialById(Long id)
    {
        MeetingMaterial material = meetingMaterialMapper.selectMeetingMaterialById(id);
        int rows = meetingMaterialMapper.deleteMeetingMaterialById(id);
        if (rows > 0)
        {
            removeAgendaAttachment(material);
        }
        return rows;
    }

    private void appendAgendaAttachment(MeetingMaterial material)
    {
        if (material == null || material.getMeetingId() == null || material.getAgendaId() == null)
        {
            return;
        }
        Meeting meeting = meetingMapper.selectMeetingById(material.getMeetingId());
        if (meeting == null || meeting.getAgendaId() == null)
        {
            return;
        }
        meetingAgendaService.appendAgendaAttachment(meeting.getAgendaId(), material.getAgendaId(), material.getId());
    }

    private void removeAgendaAttachment(MeetingMaterial material)
    {
        if (material == null || material.getMeetingId() == null || material.getAgendaId() == null)
        {
            return;
        }
        Meeting meeting = meetingMapper.selectMeetingById(material.getMeetingId());
        if (meeting == null || meeting.getAgendaId() == null)
        {
            return;
        }
        meetingAgendaService.removeAgendaAttachment(meeting.getAgendaId(), material.getAgendaId(), material.getId());
    }
}
