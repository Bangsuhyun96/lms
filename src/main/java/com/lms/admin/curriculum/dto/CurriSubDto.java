package com.lms.admin.curriculum.dto;

import lombok.Data;

import java.util.Date;

@Data
public class CurriSubDto {

    // curriculum 테이블
    private int curriculumId;
    private String curriculumName;
    private String curriculumContent;
    private String curriculumYear;
    private int lectureWeek;
    private Date startDate;
    private Date endDate;

    // subject 테이블
    private int subjectId;
    private String subjectName;
    private String subjectUse;

}
