package com.lms.board.qna.dto;

import lombok.Data;

import java.util.Date;

@Data
public class QnaDto {
    private int qnaId;
    private String qnaTitle;
    private String qnaContent;
    private int qnaHits;
    private Date qnaRdate;
    private Date qnaUdate;
    private String qnaFilename;
    private String qnaFilepath;
}
