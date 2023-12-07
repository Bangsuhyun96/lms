package com.lms.user.classinfo.dto;

import lombok.Data;

import java.util.Date;

@Data
public class StuClassInfoDto {
    private String lectureYear;
    private String lectureName;
    private int lectureId;
    private int studentId;

    private String curriculumName;
    private String profName;
    private String lectureDay;
    private String lectureTime;
    private String classroom;
    private String tel;
    private String email;
    private int lectureWeek;
    private Date startDate;
    private Date endDate;
    private String lectureContents;
}
