package com.ruoyi.ipms.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.ipms.domain.Meeting;
import com.ruoyi.ipms.domain.Vote;
import com.ruoyi.ipms.mapper.MeetingMapper;
import com.ruoyi.ipms.mapper.VoteMapper;
import com.ruoyi.ipms.service.IVoteService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 投票Service业务层处理
 *
 * @author Mredust
 * @date 2026-02-05
 */
@Service
public class VoteServiceImpl implements IVoteService {
    @Autowired
    private VoteMapper voteMapper;

    @Autowired
    private MeetingMapper meetingMapper;

    /**
     * 查询投票
     *
     * @param id 投票主键
     * @return 投票
     */
    @Override
    public Vote selectVoteById(Long id) {
        return voteMapper.selectVoteById(id);
    }

    /**
     * 查询投票列表
     *
     * @param vote 投票
     * @return 投票
     */
    @Override
    public List<Vote> selectVoteList(Vote vote) {
        return voteMapper.selectVoteList(vote);
    }

    /**
     * 根据ID列表查询投票
     *
     * @param ids 投票ID列表
     * @return 投票集合
     */
    @Override
    public List<Vote> selectVoteByIds(List<Long> ids) {
        return voteMapper.selectVoteByIds(ids);
    }

    /**
     * 新增投票
     *
     * @param vote 投票
     * @return 结果
     */
    @Override
    public int insertVote(Vote vote) {
        vote.setCreateTime(DateUtils.getNowDate());
        prepareVoteRes(vote);
        int rows = voteMapper.insertVote(vote);
        if (rows > 0) {
            appendMeetingVoteId(vote.getMeetingId(), vote.getId());
        }
        return rows;
    }

    /**
     * 修改投票
     *
     * @param vote 投票
     * @return 结果
     */
    @Override
    public int updateVote(Vote vote) {
        vote.setUpdateTime(DateUtils.getNowDate());
        prepareVoteRes(vote);
        return voteMapper.updateVote(vote);
    }

    /**
     * 批量删除投票
     *
     * @param ids 需要删除的投票主键
     * @return 结果
     */
    @Override
    public int deleteVoteByIds(Long[] ids) {
        Map<Long, List<Long>> meetingVoteMap = new HashMap<>();
        for (Long id : ids) {
            Vote vote = voteMapper.selectVoteById(id);
            if (vote != null && vote.getMeetingId() != null) {
                meetingVoteMap.computeIfAbsent(vote.getMeetingId(), key -> new ArrayList<>()).add(vote.getId());
            } else if (vote != null) {
                List<Long> meetingIds = meetingMapper.selectMeetingIdsByVoteId(vote.getId());
                if (meetingIds != null) {
                    for (Long meetingId : meetingIds) {
                        meetingVoteMap.computeIfAbsent(meetingId, key -> new ArrayList<>()).add(vote.getId());
                    }
                }
            }
        }
        int rows = voteMapper.deleteVoteByIds(ids);
        if (rows > 0 && !meetingVoteMap.isEmpty()) {
            meetingVoteMap.forEach(this::removeMeetingVoteIds);
        }
        return rows;
    }

    /**
     * 删除投票信息
     *
     * @param id 投票主键
     * @return 结果
     */
    @Override
    public int deleteVoteById(Long id) {
        Vote vote = voteMapper.selectVoteById(id);
        int rows = voteMapper.deleteVoteById(id);
        if (rows > 0 && vote != null) {
            List<Long> ids = new ArrayList<>();
            ids.add(vote.getId());
            if (vote.getMeetingId() != null) {
                removeMeetingVoteIds(vote.getMeetingId(), ids);
            } else {
                List<Long> meetingIds = meetingMapper.selectMeetingIdsByVoteId(vote.getId());
                if (meetingIds != null) {
                    for (Long meetingId : meetingIds) {
                        removeMeetingVoteIds(meetingId, ids);
                    }
                }
            }
        }
        return rows;
    }

    private void appendMeetingVoteId(Long meetingId, Long voteId) {
        if (meetingId == null || voteId == null) {
            return;
        }
        Meeting meeting = meetingMapper.selectMeetingById(meetingId);
        if (meeting == null) {
            return;
        }
        String voteIds = meeting.getVoteIds();
        List<String> list = new ArrayList<>();
        if (StringUtils.isNotEmpty(voteIds)) {
            String[] parts = voteIds.split(",");
            for (String part : parts) {
                if (StringUtils.isNotEmpty(part)) {
                    list.add(part.trim());
                }
            }
        }
        String idStr = String.valueOf(voteId);
        if (!list.contains(idStr)) {
            list.add(idStr);
        }
        meeting.setVoteIds(String.join(",", list));
        meetingMapper.updateMeeting(meeting);
    }

    private void removeMeetingVoteIds(Long meetingId, List<Long> removeIds) {
        if (meetingId == null || removeIds == null || removeIds.isEmpty()) {
            return;
        }
        Meeting meeting = meetingMapper.selectMeetingById(meetingId);
        if (meeting == null || StringUtils.isEmpty(meeting.getVoteIds())) {
            return;
        }
        String[] parts = meeting.getVoteIds().split(",");
        List<String> remaining = new ArrayList<>();
        for (String part : parts) {
            if (StringUtils.isEmpty(part)) {
                continue;
            }
            boolean shouldRemove = false;
            for (Long removeId : removeIds) {
                if (part.trim().equals(String.valueOf(removeId))) {
                    shouldRemove = true;
                    break;
                }
            }
            if (!shouldRemove) {
                remaining.add(part.trim());
            }
        }
        Meeting update = new Meeting();
        update.setId(meetingId);
        update.setVoteIds(String.join(",", remaining));
        meetingMapper.updateMeeting(update);
    }

    private void prepareVoteRes(Vote vote) {
        if (vote == null) {
            return;
        }
        String mode = StringUtils.trimToEmpty(vote.getVoteMode());
        String voteRes = vote.getVoteRes();
        LinkedHashMap<String, Integer> result = new LinkedHashMap<>();
        Map<String, Integer> existing = parseVoteRes(voteRes);
        if (isModeOne(mode)) {
            result.put("赞成", existing != null ? existing.getOrDefault("赞成", 0) : 0);
            result.put("反对", existing != null ? existing.getOrDefault("反对", 0) : 0);
            result.put("弃权", existing != null ? existing.getOrDefault("弃权", 0) : 0);
        } else if (isModeTwo(mode)) {
            result.put("赞成", existing != null ? existing.getOrDefault("赞成", 0) : 0);
            result.put("反对", existing != null ? existing.getOrDefault("反对", 0) : 0);
        } else {
            if (existing != null) {
                result.putAll(existing);
            }
        }
        if (result.isEmpty() && StringUtils.isEmpty(voteRes)) {
            vote.setVoteRes("{}");
            return;
        }
        try {
            vote.setVoteRes(new ObjectMapper().writeValueAsString(result));
        } catch (Exception e) {
            // fallback to raw
        }
    }

    private Map<String, Integer> parseVoteRes(String voteRes) {
        if (StringUtils.isEmpty(voteRes)) {
            return null;
        }
        ObjectMapper mapper = new ObjectMapper();
        try {
            Map<String, Object> raw = mapper.readValue(voteRes, new TypeReference<Map<String, Object>>() {});
            LinkedHashMap<String, Integer> result = new LinkedHashMap<>();
            for (Map.Entry<String, Object> entry : raw.entrySet()) {
                Object value = entry.getValue();
                int count = 0;
                if (value instanceof Number) {
                    count = ((Number) value).intValue();
                } else if (value != null) {
                    try {
                        count = Integer.parseInt(String.valueOf(value));
                    } catch (Exception ignored) {
                        count = 0;
                    }
                }
                result.put(entry.getKey(), count);
            }
            return result;
        } catch (Exception e) {
            // try parse as list of options
            try {
                List<String> options = mapper.readValue(voteRes, new TypeReference<List<String>>() {});
                LinkedHashMap<String, Integer> result = new LinkedHashMap<>();
                for (String option : options) {
                    if (StringUtils.isNotEmpty(option)) {
                        result.put(option, 0);
                    }
                }
                return result;
            } catch (Exception ignored) {
                return null;
            }
        }
    }

    private boolean isModeOne(String mode) {
        return "1".equals(mode) || "mode1".equalsIgnoreCase(mode) || "模式一".equals(mode);
    }

    private boolean isModeTwo(String mode) {
        return "2".equals(mode) || "mode2".equalsIgnoreCase(mode) || "模式二".equals(mode);
    }
}
