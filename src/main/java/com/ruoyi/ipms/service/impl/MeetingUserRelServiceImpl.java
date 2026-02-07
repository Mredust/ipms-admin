package com.ruoyi.ipms.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ipms.mapper.MeetingUserRelMapper;
import com.ruoyi.ipms.domain.MeetingUserRel;
import com.ruoyi.ipms.service.IMeetingUserRelService;

/**
 * 会议-参会人员关联Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-07
 */
@Service
public class MeetingUserRelServiceImpl implements IMeetingUserRelService 
{
    @Autowired
    private MeetingUserRelMapper meetingUserRelMapper;

    /**
     * 查询会议-参会人员关联
     * 
     * @param id 会议-参会人员关联主键
     * @return 会议-参会人员关联
     */
    @Override
    public MeetingUserRel selectMeetingUserRelById(Long id)
    {
        return meetingUserRelMapper.selectMeetingUserRelById(id);
    }

    /**
     * 查询会议-参会人员关联列表
     * 
     * @param meetingUserRel 会议-参会人员关联
     * @return 会议-参会人员关联
     */
    @Override
    public List<MeetingUserRel> selectMeetingUserRelList(MeetingUserRel meetingUserRel)
    {
        return meetingUserRelMapper.selectMeetingUserRelList(meetingUserRel);
    }

    /**
     * 新增会议-参会人员关联
     * 
     * @param meetingUserRel 会议-参会人员关联
     * @return 结果
     */
    @Override
    public int insertMeetingUserRel(MeetingUserRel meetingUserRel)
    {
        return meetingUserRelMapper.insertMeetingUserRel(meetingUserRel);
    }

    /**
     * 修改会议-参会人员关联
     * 
     * @param meetingUserRel 会议-参会人员关联
     * @return 结果
     */
    @Override
    public int updateMeetingUserRel(MeetingUserRel meetingUserRel)
    {
        return meetingUserRelMapper.updateMeetingUserRel(meetingUserRel);
    }

    /**
     * 批量删除会议-参会人员关联
     * 
     * @param ids 需要删除的会议-参会人员关联主键
     * @return 结果
     */
    @Override
    public int deleteMeetingUserRelByIds(Long[] ids)
    {
        return meetingUserRelMapper.deleteMeetingUserRelByIds(ids);
    }

    /**
     * 删除会议-参会人员关联信息
     * 
     * @param id 会议-参会人员关联主键
     * @return 结果
     */
    @Override
    public int deleteMeetingUserRelById(Long id)
    {
        return meetingUserRelMapper.deleteMeetingUserRelById(id);
    }
}
