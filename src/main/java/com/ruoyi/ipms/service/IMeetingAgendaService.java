package com.ruoyi.ipms.service;

import java.util.List;
import com.ruoyi.ipms.domain.MeetingAgenda;

/**
 * 会议议程Service接口
 * 
 * @author Mredust
 * @date 2026-02-07
 */
public interface IMeetingAgendaService 
{
    /**
     * 查询会议议程
     * 
     * @param id 会议议程主键
     * @return 会议议程
     */
    public MeetingAgenda selectMeetingAgendaById(Long id);

    /**
     * 查询会议议程列表
     * 
     * @param meetingAgenda 会议议程
     * @return 会议议程集合
     */
    public List<MeetingAgenda> selectMeetingAgendaList(MeetingAgenda meetingAgenda);

    /**
     * 新增会议议程
     * 
     * @param meetingAgenda 会议议程
     * @return 结果
     */
    public int insertMeetingAgenda(MeetingAgenda meetingAgenda);

    /**
     * 修改会议议程
     * 
     * @param meetingAgenda 会议议程
     * @return 结果
     */
    public int updateMeetingAgenda(MeetingAgenda meetingAgenda);

    /**
     * 追加议程附件
     *
     * @param agendaId 议程ID
     * @param topicNo 议题编号
     * @param materialId 附件ID
     * @return 是否更新成功
     */
    public boolean appendAgendaAttachment(Long agendaId, Long topicNo, Long materialId);

    /**
     * 移除议程附件
     *
     * @param agendaId 议程ID
     * @param topicNo 议题编号
     * @param materialId 附件ID
     * @return 是否更新成功
     */
    public boolean removeAgendaAttachment(Long agendaId, Long topicNo, Long materialId);

    /**
     * 批量删除会议议程
     * 
     * @param ids 需要删除的会议议程主键集合
     * @return 结果
     */
    public int deleteMeetingAgendaByIds(Long[] ids);

    /**
     * 删除会议议程信息
     * 
     * @param id 会议议程主键
     * @return 结果
     */
    public int deleteMeetingAgendaById(Long id);
}
