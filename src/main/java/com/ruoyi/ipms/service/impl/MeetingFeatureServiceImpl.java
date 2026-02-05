package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ipms.mapper.MeetingFeatureMapper;
import com.ruoyi.ipms.domain.MeetingFeature;
import com.ruoyi.ipms.service.IMeetingFeatureService;

/**
 * 会议功能Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@Service
public class MeetingFeatureServiceImpl implements IMeetingFeatureService 
{
    @Autowired
    private MeetingFeatureMapper meetingFeatureMapper;

    /**
     * 查询会议功能
     * 
     * @param id 会议功能主键
     * @return 会议功能
     */
    @Override
    public MeetingFeature selectMeetingFeatureById(Long id)
    {
        return meetingFeatureMapper.selectMeetingFeatureById(id);
    }

    /**
     * 查询会议功能列表
     * 
     * @param meetingFeature 会议功能
     * @return 会议功能
     */
    @Override
    public List<MeetingFeature> selectMeetingFeatureList(MeetingFeature meetingFeature)
    {
        return meetingFeatureMapper.selectMeetingFeatureList(meetingFeature);
    }

    /**
     * 新增会议功能
     * 
     * @param meetingFeature 会议功能
     * @return 结果
     */
    @Override
    public int insertMeetingFeature(MeetingFeature meetingFeature)
    {
        meetingFeature.setCreateTime(DateUtils.getNowDate());
        return meetingFeatureMapper.insertMeetingFeature(meetingFeature);
    }

    /**
     * 修改会议功能
     * 
     * @param meetingFeature 会议功能
     * @return 结果
     */
    @Override
    public int updateMeetingFeature(MeetingFeature meetingFeature)
    {
        meetingFeature.setUpdateTime(DateUtils.getNowDate());
        return meetingFeatureMapper.updateMeetingFeature(meetingFeature);
    }

    /**
     * 批量删除会议功能
     * 
     * @param ids 需要删除的会议功能主键
     * @return 结果
     */
    @Override
    public int deleteMeetingFeatureByIds(Long[] ids)
    {
        return meetingFeatureMapper.deleteMeetingFeatureByIds(ids);
    }

    /**
     * 删除会议功能信息
     * 
     * @param id 会议功能主键
     * @return 结果
     */
    @Override
    public int deleteMeetingFeatureById(Long id)
    {
        return meetingFeatureMapper.deleteMeetingFeatureById(id);
    }
}
