package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.LoginPage;

/**
 * 登录页Service接口
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public interface ILoginPageService 
{
    /**
     * 查询登录页
     * 
     * @param id 登录页主键
     * @return 登录页
     */
    public LoginPage selectLoginPageById(Long id);

    /**
     * 查询登录页列表
     * 
     * @param loginPage 登录页
     * @return 登录页集合
     */
    public List<LoginPage> selectLoginPageList(LoginPage loginPage);

    /**
     * 新增登录页
     * 
     * @param loginPage 登录页
     * @return 结果
     */
    public int insertLoginPage(LoginPage loginPage);

    /**
     * 修改登录页
     * 
     * @param loginPage 登录页
     * @return 结果
     */
    public int updateLoginPage(LoginPage loginPage);

    /**
     * 批量删除登录页
     * 
     * @param ids 需要删除的登录页主键集合
     * @return 结果
     */
    public int deleteLoginPageByIds(Long[] ids);

    /**
     * 删除登录页信息
     * 
     * @param id 登录页主键
     * @return 结果
     */
    public int deleteLoginPageById(Long id);
}
