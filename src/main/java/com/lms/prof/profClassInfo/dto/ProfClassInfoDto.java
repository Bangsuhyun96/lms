package com.lms.prof.profClassInfo.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ProfClassInfoDto {
    // lecture_info
    private String lectureYear;
    private String lectureName;
    private String subjectContent; // 교과목 설명

    private int lectureId;
    private int profId;

    // curriculum
    private String curriculumName;

    // prof
    private String profName;
    private String tel;
    private String email;

    // lecture_time
    private String lectureDay;
    private String lectureTime;
    private String classroom;

    // curriculum_lecture_week
    private Date startDate;
    private Date endDate;
    private int lectureWeek;

    // lecture_schedule
    private String lectureContents; // 주차별 교과목 상세 설명
    private int lectureScheduleId;
    private int weekId;

}
