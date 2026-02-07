package com.ruoyi.ipms.domain;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 会议对象 meeting
 * 
 * @author Mredust
 * @date 2026-02-05
 */
public class Meeting extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 所属范�?*/
    @Excel(name = "所属范围")
    private String scope;

    /** 会议名称 */
    @Excel(name = "会议名称")
    private String meetingName;

    /** 副标�?*/
    @Excel(name = "副标")
    private String subtitle;

    /** 开始时�?*/
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 选择会议�?*/
    @Excel(name = "选择会议")
    private Long roomId;

    /** 会议主持�?*/
    @Excel(name = "会议主持")
    private Long hostId;

    /** 会议助理 */
    @Excel(name = "会议助理")
    private Long assistantId;

    /** 会议类型 */
    @Excel(name = "会议类型")
    private Long typeId;

    /** 功能选择 */
    @Excel(name = "功能选择")
    private String featureSelect;

    /** 会议logo */
    @Excel(name = "会议logo")
    private String logo;

    /** 座位�?*/
    @Excel(name = "座位")
    private String seatChart;

    /** PAD背景 */
    @Excel(name = "PAD背景")
    private String padBgUrl;

    /** WEB背景 */
    @Excel(name = "WEB背景")
    private String webBgUrl;

    /** 会议标语ID */
    @Excel(name = "会议标语ID")
    private Long sloganId;

    /** 投票ID列表 */
    @Excel(name = "投票ID列表")
    private String voteIds;

    private Long agendaId;

    private Long status;

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setScope(String scope) 
    {
        this.scope = scope;
    }

    public String getScope() 
    {
        return scope;
    }

    public void setMeetingName(String meetingName) 
    {
        this.meetingName = meetingName;
    }

    public String getMeetingName() 
    {
        return meetingName;
    }

    public void setSubtitle(String subtitle) 
    {
        this.subtitle = subtitle;
    }

    public String getSubtitle() 
    {
        return subtitle;
    }

    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }

    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }

    public void setRoomId(Long roomId) 
    {
        this.roomId = roomId;
    }

    public Long getRoomId() 
    {
        return roomId;
    }

    public void setHostId(Long hostId) 
    {
        this.hostId = hostId;
    }

    public Long getHostId() 
    {
        return hostId;
    }

    public void setAssistantId(Long assistantId) 
    {
        this.assistantId = assistantId;
    }

    public Long getAssistantId() 
    {
        return assistantId;
    }

    public void setTypeId(Long typeId) 
    {
        this.typeId = typeId;
    }

    public Long getTypeId() 
    {
        return typeId;
    }

    public void setFeatureSelect(String featureSelect) 
    {
        this.featureSelect = featureSelect;
    }

    public String getFeatureSelect() 
    {
        return featureSelect;
    }

    public void setLogo(String logo) 
    {
        this.logo = logo;
    }

    public String getLogo() 
    {
        return logo;
    }

    public void setSeatChart(String seatChart) 
    {
        this.seatChart = seatChart;
    }

    public String getSeatChart() 
    {
        return seatChart;
    }

    public String getPadBgUrl() {
        return padBgUrl;
    }

    public void setPadBgUrl(String padBgUrl) {
        this.padBgUrl = padBgUrl;
    }

    public String getWebBgUrl() {
        return webBgUrl;
    }

    public void setWebBgUrl(String webBgUrl) {
        this.webBgUrl = webBgUrl;
    }

    public Long getSloganId() {
        return sloganId;
    }

    public void setSloganId(Long sloganId) {
        this.sloganId = sloganId;
    }

    public String getVoteIds() {
        return voteIds;
    }

    public void setVoteIds(String voteIds) {
        this.voteIds = voteIds;
    }

    public Long getAgendaId() {
        return agendaId;
    }

    public void setAgendaId(Long agendaId) {
        this.agendaId = agendaId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("scope", getScope())
            .append("meetingName", getMeetingName())
            .append("subtitle", getSubtitle())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("roomId", getRoomId())
            .append("hostId", getHostId())
            .append("assistantId", getAssistantId())
            .append("typeId", getTypeId())
            .append("featureSelect", getFeatureSelect())
            .append("logo", getLogo())
            .append("seatChart", getSeatChart())
            .append("padBgUrl", getPadBgUrl())
            .append("webBgUrl", getWebBgUrl())
            .append("sloganId", getSloganId())
            .append("voteIds", getVoteIds())
            .append("agendaId", getAgendaId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}

