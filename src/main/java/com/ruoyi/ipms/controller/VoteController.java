package com.ruoyi.ipms.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Vote;
import com.ruoyi.ipms.service.IVoteService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 投票Controller
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@RestController
@RequestMapping("/ipms/vote")
public class VoteController extends BaseController
{
    @Autowired
    private IVoteService voteService;

    /**
     * 查询投票列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:vote:list')")
    @GetMapping("/list")
    public TableDataInfo list(Vote vote)
    {
        startPage();
        List<Vote> list = voteService.selectVoteList(vote);
        return getDataTable(list);
    }

    /**
     * 导出投票列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:vote:export')")
    @Log(title = "投票", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Vote vote)
    {
        List<Vote> list = voteService.selectVoteList(vote);
        ExcelUtil<Vote> util = new ExcelUtil<Vote>(Vote.class);
        util.exportExcel(response, list, "投票数据");
    }

    /**
     * 获取投票详细信息
     */
    @PreAuthorize("@ss.hasPermi('ipms:vote:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(voteService.selectVoteById(id));
    }

    /**
     * 新增投票
     */
    @PreAuthorize("@ss.hasPermi('ipms:vote:add')")
    @Log(title = "投票", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Vote vote)
    {
        return toAjax(voteService.insertVote(vote));
    }

    /**
     * 修改投票
     */
    @PreAuthorize("@ss.hasPermi('ipms:vote:edit')")
    @Log(title = "投票", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Vote vote)
    {
        return toAjax(voteService.updateVote(vote));
    }

    /**
     * 删除投票
     */
    @PreAuthorize("@ss.hasPermi('ipms:vote:remove')")
    @Log(title = "投票", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(voteService.deleteVoteByIds(ids));
    }
}
