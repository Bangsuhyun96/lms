package com.lms.admin.curriculum.dto;

import com.sun.jna.platform.win32.OaIdl;
import lombok.Data;

import java.util.Date;

@Data
public class CurriculumDto {
    private int curriculumId;
    private String curriculumName;
    private String curriculumContent;
    private String curriculumYear;
    private int lectureWeek;
    private Date startDate;
    private Date endDate;
    private float attendanceRate;
    private int curriculumSemester;
    private String curriculumDivision;
    private int lectureGrade;
}
