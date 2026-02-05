package com.ruoyi.ipms.service;

import java.util.List;
import com.ruoyi.ipms.domain.MeetingFeature;

/**
 * 会议功能Service接口
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public interface IMeetingFeatureService 
{
    /**
     * 查询会议功能
     * 
     * @param id 会议功能主键
     * @return 会议功能
     */
    public MeetingFeature selectMeetingFeatureById(Long id);

    /**
     * 查询会议功能列表
     * 
     * @param meetingFeature 会议功能
     * @return 会议功能集合
     */
    public List<MeetingFeature> selectMeetingFeatureList(MeetingFeature meetingFeature);

    /**
     * 新增会议功能
     * 
     * @param meetingFeature 会议功能
     * @return 结果
     */
    public int insertMeetingFeature(MeetingFeature meetingFeature);

    /**
     * 修改会议功能
     * 
     * @param meetingFeature 会议功能
     * @return 结果
     */
    public int updateMeetingFeature(MeetingFeature meetingFeature);

    /**
     * 批量删除会议功能
     * 
     * @param ids 需要删除的会议功能主键集合
     * @return 结果
     */
    public int deleteMeetingFeatureByIds(Long[] ids);

    /**
     * 删除会议功能信息
     * 
     * @param id 会议功能主键
     * @return 结果
     */
    public int deleteMeetingFeatureById(Long id);
}
