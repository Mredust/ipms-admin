package com.ruoyi.ipms.mapper;

import java.util.List;
import com.ruoyi.ipms.domain.MeetingMaterial;

/**
 * 会议资料Mapper接口
 * 
 * @author Mredust
 * @date 2026-02-06
 */
public interface MeetingMaterialMapper 
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
     * 删除会议资料
     * 
     * @param id 会议资料主键
     * @return 结果
     */
    public int deleteMeetingMaterialById(Long id);

    /**
     * 批量删除会议资料
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMeetingMaterialByIds(Long[] ids);
}
