package com.ruoyi.ipms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 投票对象 vote
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public class Vote extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 投票主题 */
    @Excel(name = "投票主题")
    private String voteTitle;

    /** 关联议程主题 */
    @Excel(name = "关联议程主题")
    private Long agendaId;

    /** 会议ID */
    private Long meetingId;

    /** 投票模式 */
    @Excel(name = "投票模式")
    private String voteMode;

    /** 投票显示开关：0-关闭，1-开启 */
    @Excel(name = "投票显示开关：0-关闭，1-开启")
    private Integer showSwitch;

    /** 投票匿名开关：0-关闭，1-开启 */
    @Excel(name = "投票匿名开关：0-关闭，1-开启")
    private Integer anonymousSwitch;

    /** 投票结果JSON */
    private String voteRes;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setVoteTitle(String voteTitle)
    {
        this.voteTitle = voteTitle;
    }

    public String getVoteTitle()
    {
        return voteTitle;
    }

    public void setAgendaId(Long agendaId)
    {
        this.agendaId = agendaId;
    }

    public Long getAgendaId()
    {
        return agendaId;
    }

    public void setMeetingId(Long meetingId)
    {
        this.meetingId = meetingId;
    }

    public Long getMeetingId()
    {
        return meetingId;
    }

    public void setVoteMode(String voteMode)
    {
        this.voteMode = voteMode;
    }

    public String getVoteMode()
    {
        return voteMode;
    }

    public void setShowSwitch(Integer showSwitch)
    {
        this.showSwitch = showSwitch;
    }

    public Integer getShowSwitch()
    {
        return showSwitch;
    }

    public void setAnonymousSwitch(Integer anonymousSwitch)
    {
        this.anonymousSwitch = anonymousSwitch;
    }

    public Integer getAnonymousSwitch()
    {
        return anonymousSwitch;
    }

    public void setVoteRes(String voteRes)
    {
        this.voteRes = voteRes;
    }

    public String getVoteRes()
    {
        return voteRes;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("voteTitle", getVoteTitle())
            .append("agendaId", getAgendaId())
            .append("meetingId", getMeetingId())
            .append("voteMode", getVoteMode())
            .append("showSwitch", getShowSwitch())
            .append("anonymousSwitch", getAnonymousSwitch())
            .append("voteRes", getVoteRes())
            .append("remark", getRemark())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
