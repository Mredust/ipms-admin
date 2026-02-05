package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户对象 user
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public class User extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 归属单位 */
    @Excel(name = "归属单位")
    private Long orgId;

    /** 归属部门 */
    @Excel(name = "归属部门")
    private Long deptId;

    /** 工号 */
    @Excel(name = "工号")
    private String employeeNo;

    /** 姓名 */
    @Excel(name = "姓名")
    private String realName;

    /** 登录名 */
    @Excel(name = "登录名")
    private String username;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 确认密码 */
    @Excel(name = "确认密码")
    private String confirmPassword;

    /** 职务 */
    @Excel(name = "职务")
    private String position;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

    /** 用户角色 */
    @Excel(name = "用户角色")
    private String role;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setOrgId(Long orgId) 
    {
        this.orgId = orgId;
    }

    public Long getOrgId() 
    {
        return orgId;
    }

    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }

    public void setEmployeeNo(String employeeNo) 
    {
        this.employeeNo = employeeNo;
    }

    public String getEmployeeNo() 
    {
        return employeeNo;
    }

    public void setRealName(String realName) 
    {
        this.realName = realName;
    }

    public String getRealName() 
    {
        return realName;
    }

    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }

    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }

    public void setConfirmPassword(String confirmPassword) 
    {
        this.confirmPassword = confirmPassword;
    }

    public String getConfirmPassword() 
    {
        return confirmPassword;
    }

    public void setPosition(String position) 
    {
        this.position = position;
    }

    public String getPosition() 
    {
        return position;
    }

    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }

    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }

    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }

    public void setRole(String role) 
    {
        this.role = role;
    }

    public String getRole() 
    {
        return role;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orgId", getOrgId())
            .append("deptId", getDeptId())
            .append("employeeNo", getEmployeeNo())
            .append("realName", getRealName())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("confirmPassword", getConfirmPassword())
            .append("position", getPosition())
            .append("unit", getUnit())
            .append("email", getEmail())
            .append("phone", getPhone())
            .append("role", getRole())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
