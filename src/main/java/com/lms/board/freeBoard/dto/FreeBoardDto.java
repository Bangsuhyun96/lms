package com.lms.board.freeBoard.dto;

import lombok.Data;

import java.util.Date;

@Data
public class FreeBoardDto {
    private int freeId;
    private String freeTitle;
    private String freeContent;
    private int freeHits;
    private Date freeRdate;
    private Date freeUdate;
    private String freeFilename;
    private String freeFilepath;
}
