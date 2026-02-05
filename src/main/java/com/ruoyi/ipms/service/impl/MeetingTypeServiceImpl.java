package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MeetingTypeMapper;
import com.ruoyi.system.domain.MeetingType;
import com.ruoyi.system.service.IMeetingTypeService;

/**
 * 会议类型Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@Service
public class MeetingTypeServiceImpl implements IMeetingTypeService 
{
    @Autowired
    private MeetingTypeMapper meetingTypeMapper;

    /**
     * 查询会议类型
     * 
     * @param id 会议类型主键
     * @return 会议类型
     */
    @Override
    public MeetingType selectMeetingTypeById(Long id)
    {
        return meetingTypeMapper.selectMeetingTypeById(id);
    }

    /**
     * 查询会议类型列表
     * 
     * @param meetingType 会议类型
     * @return 会议类型
     */
    @Override
    public List<MeetingType> selectMeetingTypeList(MeetingType meetingType)
    {
        return meetingTypeMapper.selectMeetingTypeList(meetingType);
    }

    /**
     * 新增会议类型
     * 
     * @param meetingType 会议类型
     * @return 结果
     */
    @Override
    public int insertMeetingType(MeetingType meetingType)
    {
        meetingType.setCreateTime(DateUtils.getNowDate());
        return meetingTypeMapper.insertMeetingType(meetingType);
    }

    /**
     * 修改会议类型
     * 
     * @param meetingType 会议类型
     * @return 结果
     */
    @Override
    public int updateMeetingType(MeetingType meetingType)
    {
        meetingType.setUpdateTime(DateUtils.getNowDate());
        return meetingTypeMapper.updateMeetingType(meetingType);
    }

    /**
     * 批量删除会议类型
     * 
     * @param ids 需要删除的会议类型主键
     * @return 结果
     */
    @Override
    public int deleteMeetingTypeByIds(Long[] ids)
    {
        return meetingTypeMapper.deleteMeetingTypeByIds(ids);
    }

    /**
     * 删除会议类型信息
     * 
     * @param id 会议类型主键
     * @return 结果
     */
    @Override
    public int deleteMeetingTypeById(Long id)
    {
        return meetingTypeMapper.deleteMeetingTypeById(id);
    }
}
