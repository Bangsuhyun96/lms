package com.lms.board.freeBoard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    private List<MultipartFile> files = new ArrayList<>();
}
