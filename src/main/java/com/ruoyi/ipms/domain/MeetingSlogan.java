package com.ruoyi.ipms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 会议标语对象 meeting_slogan
 * 
 * @author Mredust
 * @date 2026-02-07
 */
public class MeetingSlogan extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 欢迎语 */
    @Excel(name = "欢迎语")
    private String welcomeText;

    /** 主标题字体 */
    @Excel(name = "主标题字体")
    private String mainTitleFont;

    /** 主标题颜色 */
    @Excel(name = "主标题颜色")
    private String mainTitleColor;

    /** 主标题大小 */
    @Excel(name = "主标题大小")
    private String mainTitleSize;

    /** 其它字体 */
    @Excel(name = "其它字体")
    private String otherFont;

    /** 其它颜色 */
    @Excel(name = "其它颜色")
    private String otherColor;

    /** 其它大小 */
    @Excel(name = "其它大小")
    private String otherSize;

    /** 背景url */
    @Excel(name = "背景url")
    private String backgroundUrl;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setWelcomeText(String welcomeText) 
    {
        this.welcomeText = welcomeText;
    }

    public String getWelcomeText() 
    {
        return welcomeText;
    }

    public void setMainTitleFont(String mainTitleFont) 
    {
        this.mainTitleFont = mainTitleFont;
    }

    public String getMainTitleFont() 
    {
        return mainTitleFont;
    }

    public void setMainTitleColor(String mainTitleColor) 
    {
        this.mainTitleColor = mainTitleColor;
    }

    public String getMainTitleColor() 
    {
        return mainTitleColor;
    }

    public void setMainTitleSize(String mainTitleSize) 
    {
        this.mainTitleSize = mainTitleSize;
    }

    public String getMainTitleSize() 
    {
        return mainTitleSize;
    }

    public void setOtherFont(String otherFont) 
    {
        this.otherFont = otherFont;
    }

    public String getOtherFont() 
    {
        return otherFont;
    }

    public void setOtherColor(String otherColor) 
    {
        this.otherColor = otherColor;
    }

    public String getOtherColor() 
    {
        return otherColor;
    }

    public void setOtherSize(String otherSize) 
    {
        this.otherSize = otherSize;
    }

    public String getOtherSize() 
    {
        return otherSize;
    }

    public void setBackgroundUrl(String backgroundUrl) 
    {
        this.backgroundUrl = backgroundUrl;
    }

    public String getBackgroundUrl() 
    {
        return backgroundUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("welcomeText", getWelcomeText())
            .append("mainTitleFont", getMainTitleFont())
            .append("mainTitleColor", getMainTitleColor())
            .append("mainTitleSize", getMainTitleSize())
            .append("otherFont", getOtherFont())
            .append("otherColor", getOtherColor())
            .append("otherSize", getOtherSize())
            .append("backgroundUrl", getBackgroundUrl())
            .toString();
    }
}
