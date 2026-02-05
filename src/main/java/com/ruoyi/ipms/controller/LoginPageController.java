package com.ruoyi.ipms.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.ipms.domain.LoginPage;
import com.ruoyi.ipms.service.ILoginPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 登录页Controller
 *
 * @author Mredust
 * @date 2026-02-05
 */
@RestController
@RequestMapping("/ipms/page")
public class LoginPageController extends BaseController {
    @Autowired
    private ILoginPageService loginPageService;

    /**
     * 查询登录页列表
     */
    @GetMapping("/list")
    public TableDataInfo list(LoginPage loginPage) {
        startPage();
        List<LoginPage> list = loginPageService.selectLoginPageList(loginPage);
        return getDataTable(list);
    }

    /**
     * 导出登录页列表
     */
    @PreAuthorize("@ss.hasPermi('ipms:page:export')")
    @Log(title = "登录页", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LoginPage loginPage) {
        List<LoginPage> list = loginPageService.selectLoginPageList(loginPage);
        ExcelUtil<LoginPage> util = new ExcelUtil<LoginPage>(LoginPage.class);
        util.exportExcel(response, list, "登录页数据");
    }

    /**
     * 获取登录页详细信息
     */
    @PreAuthorize("@ss.hasPermi('ipms:page:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(loginPageService.selectLoginPageById(id));
    }

    /**
     * 新增登录页
     */
    @PreAuthorize("@ss.hasPermi('ipms:page:add')")
    @Log(title = "登录页", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LoginPage loginPage) {
        return toAjax(loginPageService.insertLoginPage(loginPage));
    }

    /**
     * 修改登录页
     */
    @PreAuthorize("@ss.hasPermi('ipms:page:edit')")
    @Log(title = "登录页", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LoginPage loginPage) {
        return toAjax(loginPageService.updateLoginPage(loginPage));
    }

    /**
     * 删除登录页
     */
    @PreAuthorize("@ss.hasPermi('ipms:page:remove')")
    @Log(title = "登录页", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(loginPageService.deleteLoginPageByIds(ids));
    }
}
