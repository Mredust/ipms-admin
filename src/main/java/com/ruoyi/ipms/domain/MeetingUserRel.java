package com.ruoyi.ipms.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 会议-参会人员关联对象 meeting_user_rel
 * 
 * @author Mredust
 * @date 2026-02-07
 */
public class MeetingUserRel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 会议ID */
    @Excel(name = "会议ID")
    private Long meetingId;

    /** 用户id列表（JSON数组格式） */
    @Excel(name = "用户id列表", readConverterExp = "J=SON数组格式")
    private String userIds;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setMeetingId(Long meetingId) 
    {
        this.meetingId = meetingId;
    }

    public Long getMeetingId() 
    {
        return meetingId;
    }

    public void setUserIds(String userIds) 
    {
        this.userIds = userIds;
    }

    public String getUserIds() 
    {
        return userIds;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("meetingId", getMeetingId())
            .append("userIds", getUserIds())
            .toString();
    }
}
