package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.VoteMapper;
import com.ruoyi.system.domain.Vote;
import com.ruoyi.system.service.IVoteService;

/**
 * 投票Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@Service
public class VoteServiceImpl implements IVoteService 
{
    @Autowired
    private VoteMapper voteMapper;

    /**
     * 查询投票
     * 
     * @param id 投票主键
     * @return 投票
     */
    @Override
    public Vote selectVoteById(Long id)
    {
        return voteMapper.selectVoteById(id);
    }

    /**
     * 查询投票列表
     * 
     * @param vote 投票
     * @return 投票
     */
    @Override
    public List<Vote> selectVoteList(Vote vote)
    {
        return voteMapper.selectVoteList(vote);
    }

    /**
     * 新增投票
     * 
     * @param vote 投票
     * @return 结果
     */
    @Override
    public int insertVote(Vote vote)
    {
        vote.setCreateTime(DateUtils.getNowDate());
        return voteMapper.insertVote(vote);
    }

    /**
     * 修改投票
     * 
     * @param vote 投票
     * @return 结果
     */
    @Override
    public int updateVote(Vote vote)
    {
        vote.setUpdateTime(DateUtils.getNowDate());
        return voteMapper.updateVote(vote);
    }

    /**
     * 批量删除投票
     * 
     * @param ids 需要删除的投票主键
     * @return 结果
     */
    @Override
    public int deleteVoteByIds(Long[] ids)
    {
        return voteMapper.deleteVoteByIds(ids);
    }

    /**
     * 删除投票信息
     * 
     * @param id 投票主键
     * @return 结果
     */
    @Override
    public int deleteVoteById(Long id)
    {
        return voteMapper.deleteVoteById(id);
    }
}
