package com.ruoyi.ipms.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 会议资料对象 meeting_material
 * 
 * @author Mredust
 * @date 2026-02-06
 */
public class MeetingMaterial extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 文件名称 */
    @Excel(name = "文件名称")
    private String fileName;

    /** 文件类型 */
    @Excel(name = "文件类型")
    private String fileType;

    /** 文件大小(KB) */
    @Excel(name = "文件大小(KB)")
    private BigDecimal fileSize;

    /** 文件排序 */
    @Excel(name = "文件排序")
    private Long fileSort;

    /** 打开/下载链接 */
    @Excel(name = "打开/下载链接")
    private String openDownload;

    /** 会议ID */
    @Excel(name = "会议ID")
    private Long meetingId;

    /** 议题ID */
    @Excel(name = "议题ID")
    private Long agendaId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setFileName(String fileName) 
    {
        this.fileName = fileName;
    }

    public String getFileName() 
    {
        return fileName;
    }

    public void setFileType(String fileType) 
    {
        this.fileType = fileType;
    }

    public String getFileType() 
    {
        return fileType;
    }

    public void setFileSize(BigDecimal fileSize) 
    {
        this.fileSize = fileSize;
    }

    public BigDecimal getFileSize() 
    {
        return fileSize;
    }

    public void setFileSort(Long fileSort) 
    {
        this.fileSort = fileSort;
    }

    public Long getFileSort() 
    {
        return fileSort;
    }

    public void setOpenDownload(String openDownload) 
    {
        this.openDownload = openDownload;
    }

    public String getOpenDownload() 
    {
        return openDownload;
    }

    public void setMeetingId(Long meetingId) 
    {
        this.meetingId = meetingId;
    }

    public Long getMeetingId() 
    {
        return meetingId;
    }

    public void setAgendaId(Long agendaId) 
    {
        this.agendaId = agendaId;
    }

    public Long getAgendaId() 
    {
        return agendaId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("fileName", getFileName())
            .append("fileType", getFileType())
            .append("fileSize", getFileSize())
            .append("fileSort", getFileSort())
            .append("openDownload", getOpenDownload())
            .append("meetingId", getMeetingId())
            .append("agendaId", getAgendaId())
            .append("createTime", getCreateTime())
            .toString();
    }
}
