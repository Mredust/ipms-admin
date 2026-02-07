package com.ruoyi.ipms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 会议议程对象 meeting_agenda
 * 
 * @author Mredust
 * @date 2026-02-07
 */
public class MeetingAgenda extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 议程JSON数据 */
    @Excel(name = "议程JSON数据")
    private String textJson;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setTextJson(String textJson) 
    {
        this.textJson = textJson;
    }

    public String getTextJson() 
    {
        return textJson;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("textJson", getTextJson())
            .toString();
    }
}
