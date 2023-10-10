package com.lms.board.notice.dto;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeDto {
    private int noticeId;
    private String noticeTitle;
    private String noticeContent;
    private int noticeHits;
    private Date noticeRdate;
    private Date noticeUdate;
    private String noticeFilename;
    private String noticeFilepath;
}
