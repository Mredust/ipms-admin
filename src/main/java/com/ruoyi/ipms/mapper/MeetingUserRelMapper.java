package com.ruoyi.ipms.mapper;

import java.util.List;
import com.ruoyi.ipms.domain.MeetingUserRel;

/**
 * 会议-参会人员关联Mapper接口
 * 
 * @author Mredust
 * @date 2026-02-07
 */
public interface MeetingUserRelMapper 
{
    /**
     * 查询会议-参会人员关联
     * 
     * @param id 会议-参会人员关联主键
     * @return 会议-参会人员关联
     */
    public MeetingUserRel selectMeetingUserRelById(Long id);

    /**
     * 查询会议-参会人员关联列表
     * 
     * @param meetingUserRel 会议-参会人员关联
     * @return 会议-参会人员关联集合
     */
    public List<MeetingUserRel> selectMeetingUserRelList(MeetingUserRel meetingUserRel);

    /**
     * 新增会议-参会人员关联
     * 
     * @param meetingUserRel 会议-参会人员关联
     * @return 结果
     */
    public int insertMeetingUserRel(MeetingUserRel meetingUserRel);

    /**
     * 修改会议-参会人员关联
     * 
     * @param meetingUserRel 会议-参会人员关联
     * @return 结果
     */
    public int updateMeetingUserRel(MeetingUserRel meetingUserRel);

    /**
     * 删除会议-参会人员关联
     * 
     * @param id 会议-参会人员关联主键
     * @return 结果
     */
    public int deleteMeetingUserRelById(Long id);

    /**
     * 批量删除会议-参会人员关联
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMeetingUserRelByIds(Long[] ids);
}
