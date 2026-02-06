package com.ruoyi.ipms.service;

import java.util.List;
import com.ruoyi.ipms.domain.MeetingMaterial;

/**
 * 会议资料Service接口
 * 
 * @author Mredust
 * @date 2026-02-06
 */
public interface IMeetingMaterialService 
{
    /**
     * 查询会议资料
     * 
     * @param id 会议资料主键
     * @return 会议资料
     */
    public MeetingMaterial selectMeetingMaterialById(Long id);

    /**
     * 查询会议资料列表
     * 
     * @param meetingMaterial 会议资料
     * @return 会议资料集合
     */
    public List<MeetingMaterial> selectMeetingMaterialList(MeetingMaterial meetingMaterial);

    /**
     * 新增会议资料
     * 
     * @param meetingMaterial 会议资料
     * @return 结果
     */
    public int insertMeetingMaterial(MeetingMaterial meetingMaterial);

    /**
     * 修改会议资料
     * 
     * @param meetingMaterial 会议资料
     * @return 结果
     */
    public int updateMeetingMaterial(MeetingMaterial meetingMaterial);

    /**
     * 批量删除会议资料
     * 
     * @param ids 需要删除的会议资料主键集合
     * @return 结果
     */
    public int deleteMeetingMaterialByIds(Long[] ids);

    /**
     * 删除会议资料信息
     * 
     * @param id 会议资料主键
     * @return 结果
     */
    public int deleteMeetingMaterialById(Long id);
}
