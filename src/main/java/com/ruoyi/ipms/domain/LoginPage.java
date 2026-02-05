package com.ruoyi.ipms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 登录页对象 login_page
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public class LoginPage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 副标题 */
    @Excel(name = "副标题")
    private String subtitle;

    /** 页脚 */
    @Excel(name = "页脚")
    private String footer;

    /** 背景图 */
    @Excel(name = "背景图")
    private String backgroundImage;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    public void setSubtitle(String subtitle) 
    {
        this.subtitle = subtitle;
    }

    public String getSubtitle() 
    {
        return subtitle;
    }

    public void setFooter(String footer) 
    {
        this.footer = footer;
    }

    public String getFooter() 
    {
        return footer;
    }

    public void setBackgroundImage(String backgroundImage) 
    {
        this.backgroundImage = backgroundImage;
    }

    public String getBackgroundImage() 
    {
        return backgroundImage;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("subtitle", getSubtitle())
            .append("footer", getFooter())
            .append("backgroundImage", getBackgroundImage())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
