package com.lms.admin.lectureAttendance.dto;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class LectureDto {

    // 강의정보 dto
    private int lectureId;  // 강의 ID
    private String lectureName; // 강의이름
    private String lectureYear;  // 강의년도
    private int hours; // 시수
    private String progress; // 강의상태
    private int studentCount; // 수강인원
    private String lectureContent; // 강의설명

    // 학기정보 curriculum 테이블
    private LocalDate startDate; // 시작일자
    private int month;
    private LocalDate endDate; // 종료일자

    // 강사정보 prof 테이블
    private int profId; // 교수번호
    private String name; // 교수이름

    // 개인별월강사료 fee 테이블
    private String feeDate; // 지급년월(지급일자)
}