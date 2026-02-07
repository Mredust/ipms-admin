package com.ruoyi.ipms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ipms.mapper.MeetingAgendaMapper;
import com.ruoyi.ipms.domain.MeetingAgenda;
import com.ruoyi.ipms.service.IMeetingAgendaService;

/**
 * 会议议程Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-07
 */
@Service
public class MeetingAgendaServiceImpl implements IMeetingAgendaService 
{
    @Autowired
    private MeetingAgendaMapper meetingAgendaMapper;

    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 查询会议议程
     * 
     * @param id 会议议程主键
     * @return 会议议程
     */
    @Override
    public MeetingAgenda selectMeetingAgendaById(Long id)
    {
        return meetingAgendaMapper.selectMeetingAgendaById(id);
    }

    /**
     * 查询会议议程列表
     * 
     * @param meetingAgenda 会议议程
     * @return 会议议程
     */
    @Override
    public List<MeetingAgenda> selectMeetingAgendaList(MeetingAgenda meetingAgenda)
    {
        return meetingAgendaMapper.selectMeetingAgendaList(meetingAgenda);
    }

    /**
     * 新增会议议程
     * 
     * @param meetingAgenda 会议议程
     * @return 结果
     */
    @Override
    public int insertMeetingAgenda(MeetingAgenda meetingAgenda)
    {
        return meetingAgendaMapper.insertMeetingAgenda(meetingAgenda);
    }

    /**
     * 修改会议议程
     * 
     * @param meetingAgenda 会议议程
     * @return 结果
     */
    @Override
    public int updateMeetingAgenda(MeetingAgenda meetingAgenda)
    {
        return meetingAgendaMapper.updateMeetingAgenda(meetingAgenda);
    }

    @Override
    public boolean appendAgendaAttachment(Long agendaId, Long topicNo, Long materialId)
    {
        return updateAgendaAttachment(agendaId, topicNo, materialId, false);
    }

    @Override
    public boolean removeAgendaAttachment(Long agendaId, Long topicNo, Long materialId)
    {
        return updateAgendaAttachment(agendaId, topicNo, materialId, true);
    }

    /**
     * 批量删除会议议程
     * 
     * @param ids 需要删除的会议议程主键
     * @return 结果
     */
    @Override
    public int deleteMeetingAgendaByIds(Long[] ids)
    {
        return meetingAgendaMapper.deleteMeetingAgendaByIds(ids);
    }

    /**
     * 删除会议议程信息
     * 
     * @param id 会议议程主键
     * @return 结果
     */
    @Override
    public int deleteMeetingAgendaById(Long id)
    {
        return meetingAgendaMapper.deleteMeetingAgendaById(id);
    }

    private boolean updateAgendaAttachment(Long agendaId, Long topicNo, Long materialId, boolean remove)
    {
        if (agendaId == null || topicNo == null || materialId == null)
        {
            return false;
        }
        MeetingAgenda agenda = meetingAgendaMapper.selectMeetingAgendaById(agendaId);
        if (agenda == null || StringUtils.isEmpty(agenda.getTextJson()))
        {
            return false;
        }
        List<Map<String, Object>> rows = parseAgendaRows(agenda.getTextJson());
        if (rows.isEmpty())
        {
            return false;
        }
        boolean changed = false;
        for (int i = 0; i < rows.size(); i++)
        {
            Map<String, Object> row = rows.get(i);
            Long rowTopicNo = parseTopicNo(row, i);
            if (rowTopicNo == null || !rowTopicNo.equals(topicNo))
            {
                continue;
            }
            List<Long> attachmentIds = parseIdList(row.get("attachmentIds"));
            if (attachmentIds.isEmpty() && row.get("attachment_ids") != null)
            {
                attachmentIds = parseIdList(row.get("attachment_ids"));
            }
            if (remove)
            {
                changed = attachmentIds.remove(materialId) || changed;
            }
            else if (!attachmentIds.contains(materialId))
            {
                attachmentIds.add(materialId);
                changed = true;
            }
            row.put("attachmentIds", attachmentIds);
            break;
        }
        if (changed)
        {
            try
            {
                agenda.setTextJson(objectMapper.writeValueAsString(rows));
                meetingAgendaMapper.updateMeetingAgenda(agenda);
            }
            catch (Exception ignored)
            {
                return false;
            }
        }
        return changed;
    }

    private List<Map<String, Object>> parseAgendaRows(String textJson)
    {
        if (StringUtils.isEmpty(textJson))
        {
            return new ArrayList<>();
        }
        try
        {
            Object raw = objectMapper.readValue(textJson, Object.class);
            if (raw instanceof List)
            {
                return (List<Map<String, Object>>) raw;
            }
            if (raw instanceof Map)
            {
                Object rows = ((Map<?, ?>) raw).get("rows");
                if (rows instanceof List)
                {
                    return (List<Map<String, Object>>) rows;
                }
            }
        }
        catch (Exception ignored)
        {
        }
        try
        {
            return objectMapper.readValue(textJson, new TypeReference<List<Map<String, Object>>>() {});
        }
        catch (Exception ignored)
        {
            return new ArrayList<>();
        }
    }

    private Long parseTopicNo(Map<String, Object> row, int index)
    {
        if (row == null)
        {
            return index + 1L;
        }
        Object raw = row.get("topicNo");
        if (raw == null)
        {
            raw = row.get("topic");
        }
        if (raw == null)
        {
            raw = row.get("topicNoValue");
        }
        Long parsed = parseLong(raw);
        return parsed != null ? parsed : index + 1L;
    }

    private List<Long> parseIdList(Object value)
    {
        List<Long> ids = new ArrayList<>();
        if (value == null)
        {
            return ids;
        }
        if (value instanceof List)
        {
            List<?> rawList = (List<?>) value;
            for (Object item : rawList)
            {
                Long parsed = parseLong(item);
                if (parsed != null)
                {
                    ids.add(parsed);
                }
            }
            return ids;
        }
        if (value instanceof Number)
        {
            ids.add(((Number) value).longValue());
            return ids;
        }
        if (value instanceof String)
        {
            String text = (String) value;
            if (StringUtils.isEmpty(text))
            {
                return ids;
            }
            try
            {
                List<Object> raw = objectMapper.readValue(text, new TypeReference<List<Object>>() {});
                for (Object item : raw)
                {
                    Long parsed = parseLong(item);
                    if (parsed != null)
                    {
                        ids.add(parsed);
                    }
                }
                return ids;
            }
            catch (Exception ignored)
            {
            }
            String[] parts = text.split("[,，]");
            for (String part : parts)
            {
                Long parsed = parseLong(part);
                if (parsed != null)
                {
                    ids.add(parsed);
                }
            }
        }
        return ids;
    }

    private Long parseLong(Object value)
    {
        if (value == null)
        {
            return null;
        }
        if (value instanceof Number)
        {
            return ((Number) value).longValue();
        }
        String text = String.valueOf(value).trim();
        if (StringUtils.isEmpty(text))
        {
            return null;
        }
        try
        {
            return Long.parseLong(text);
        }
        catch (NumberFormatException e)
        {
            return null;
        }
    }
}
