package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 会议功能对象 meeting_feature
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public class MeetingFeature extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 功能名称 */
    @Excel(name = "功能名称")
    private String featureName;

    /** 功能别名 */
    @Excel(name = "功能别名")
    private String featureAlias;

    /** 排序 */
    @Excel(name = "排序")
    private Long sortOrder;

    /** 颜色选择 */
    @Excel(name = "颜色选择")
    private String color;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setFeatureName(String featureName) 
    {
        this.featureName = featureName;
    }

    public String getFeatureName() 
    {
        return featureName;
    }

    public void setFeatureAlias(String featureAlias) 
    {
        this.featureAlias = featureAlias;
    }

    public String getFeatureAlias() 
    {
        return featureAlias;
    }

    public void setSortOrder(Long sortOrder) 
    {
        this.sortOrder = sortOrder;
    }

    public Long getSortOrder() 
    {
        return sortOrder;
    }

    public void setColor(String color) 
    {
        this.color = color;
    }

    public String getColor() 
    {
        return color;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("featureName", getFeatureName())
            .append("featureAlias", getFeatureAlias())
            .append("sortOrder", getSortOrder())
            .append("color", getColor())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
