package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 机构对象 organization
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public class Organization extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 头像 */
    @Excel(name = "头像")
    private String avatar;

    /** 上级机构 */
    @Excel(name = "上级机构")
    private Long parentId;

    /** 机构名称 */
    @Excel(name = "机构名称")
    private String orgName;

    /** 机构编码 */
    @Excel(name = "机构编码")
    private String orgCode;

    /** 机构类型 */
    @Excel(name = "机构类型")
    private String orgType;

    /** 负责人 */
    @Excel(name = "负责人")
    private String leader;

    /** 电话 */
    @Excel(name = "电话")
    private String phone;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
    }

    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }

    public void setOrgName(String orgName) 
    {
        this.orgName = orgName;
    }

    public String getOrgName() 
    {
        return orgName;
    }

    public void setOrgCode(String orgCode) 
    {
        this.orgCode = orgCode;
    }

    public String getOrgCode() 
    {
        return orgCode;
    }

    public void setOrgType(String orgType) 
    {
        this.orgType = orgType;
    }

    public String getOrgType() 
    {
        return orgType;
    }

    public void setLeader(String leader) 
    {
        this.leader = leader;
    }

    public String getLeader() 
    {
        return leader;
    }

    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }

    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("avatar", getAvatar())
            .append("parentId", getParentId())
            .append("orgName", getOrgName())
            .append("orgCode", getOrgCode())
            .append("orgType", getOrgType())
            .append("leader", getLeader())
            .append("phone", getPhone())
            .append("email", getEmail())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
