package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Vote;

/**
 * 投票Service接口
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public interface IVoteService 
{
    /**
     * 查询投票
     * 
     * @param id 投票主键
     * @return 投票
     */
    public Vote selectVoteById(Long id);

    /**
     * 查询投票列表
     * 
     * @param vote 投票
     * @return 投票集合
     */
    public List<Vote> selectVoteList(Vote vote);

    /**
     * 新增投票
     * 
     * @param vote 投票
     * @return 结果
     */
    public int insertVote(Vote vote);

    /**
     * 修改投票
     * 
     * @param vote 投票
     * @return 结果
     */
    public int updateVote(Vote vote);

    /**
     * 批量删除投票
     * 
     * @param ids 需要删除的投票主键集合
     * @return 结果
     */
    public int deleteVoteByIds(Long[] ids);

    /**
     * 删除投票信息
     * 
     * @param id 投票主键
     * @return 结果
     */
    public int deleteVoteById(Long id);
}
