package com.ruoyi.ipms.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ipms.mapper.LoginPageMapper;
import com.ruoyi.ipms.domain.LoginPage;
import com.ruoyi.ipms.service.ILoginPageService;

/**
 * 登录页Service业务层处理
 * 
 * @author Mredust
 * @date 2026-02-05
 */
@Service
public class LoginPageServiceImpl implements ILoginPageService 
{
    @Autowired
    private LoginPageMapper loginPageMapper;

    /**
     * 查询登录页
     * 
     * @param id 登录页主键
     * @return 登录页
     */
    @Override
    public LoginPage selectLoginPageById(Long id)
    {
        return loginPageMapper.selectLoginPageById(id);
    }

    /**
     * 查询登录页列表
     * 
     * @param loginPage 登录页
     * @return 登录页
     */
    @Override
    public List<LoginPage> selectLoginPageList(LoginPage loginPage)
    {
        return loginPageMapper.selectLoginPageList(loginPage);
    }

    /**
     * 新增登录页
     * 
     * @param loginPage 登录页
     * @return 结果
     */
    @Override
    public int insertLoginPage(LoginPage loginPage)
    {
        loginPage.setCreateTime(DateUtils.getNowDate());
        return loginPageMapper.insertLoginPage(loginPage);
    }

    /**
     * 修改登录页
     * 
     * @param loginPage 登录页
     * @return 结果
     */
    @Override
    public int updateLoginPage(LoginPage loginPage)
    {
        loginPage.setUpdateTime(DateUtils.getNowDate());
        return loginPageMapper.updateLoginPage(loginPage);
    }

    /**
     * 批量删除登录页
     * 
     * @param ids 需要删除的登录页主键
     * @return 结果
     */
    @Override
    public int deleteLoginPageByIds(Long[] ids)
    {
        return loginPageMapper.deleteLoginPageByIds(ids);
    }

    /**
     * 删除登录页信息
     * 
     * @param id 登录页主键
     * @return 结果
     */
    @Override
    public int deleteLoginPageById(Long id)
    {
        return loginPageMapper.deleteLoginPageById(id);
    }
}
