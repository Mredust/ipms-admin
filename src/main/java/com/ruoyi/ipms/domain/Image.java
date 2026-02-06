package com.ruoyi.ipms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 图片对象 image
 * 
 * @author Mredust
 * @date 2026-02-06
 */
public class Image extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 链接 */
    @Excel(name = "链接")
    private String url;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 是否系统：0-否，1-是 */
    @Excel(name = "是否系统：0-否，1-是")
    private Integer isSystem;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }

    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    public void setIsSystem(Integer isSystem) 
    {
        this.isSystem = isSystem;
    }

    public Integer getIsSystem() 
    {
        return isSystem;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("url", getUrl())
            .append("type", getType())
            .append("createTime", getCreateTime())
            .append("isSystem", getIsSystem())
            .toString();
    }
}
