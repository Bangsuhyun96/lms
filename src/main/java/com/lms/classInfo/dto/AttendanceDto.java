package com.lms.classInfo.dto;

import lombok.Data;

import java.util.Date;

@Data
public class AttendanceDto {

    // 강좌정보 띄우기
    private String lectureYear; // 년도
    private String curriculumName;// 과정명
    private String lectureName;// 과목명
    private String name;// 교수명
    private int lectureWeek; // 강의주차
    private Date lectureDate; // 강의날짜
    private String division; // 출결현황
 }
