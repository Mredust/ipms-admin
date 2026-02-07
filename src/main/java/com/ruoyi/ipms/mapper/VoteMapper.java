package com.ruoyi.ipms.mapper;

import com.ruoyi.ipms.domain.Vote;

import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * 投票Mapper接口
 *
 * @author Mredust
 * @date 2026-02-05
 */
public interface VoteMapper {
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
     * 根据ID列表查询投票
     *
     * @param ids 投票ID列表
     * @return 投票集合
     */
    public List<Vote> selectVoteByIds(@Param("ids") List<Long> ids);

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
     * 删除投票
     *
     * @param id 投票主键
     * @return 结果
     */
    public int deleteVoteById(Long id);

    /**
     * 批量删除投票
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteVoteByIds(Long[] ids);
}
