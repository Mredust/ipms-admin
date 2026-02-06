package com.ruoyi.ipms.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ipms.mapper.MeetingMaterialMapper;
import com.ruoyi.ipms.domain.MeetingMaterial;
import com.ruoyi.ipms.service.IMeetingMaterialService;

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
        return meetingMaterialMapper.insertMeetingMaterial(meetingMaterial);
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
        return meetingMaterialMapper.deleteMeetingMaterialByIds(ids);
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
        return meetingMaterialMapper.deleteMeetingMaterialById(id);
    }
}
