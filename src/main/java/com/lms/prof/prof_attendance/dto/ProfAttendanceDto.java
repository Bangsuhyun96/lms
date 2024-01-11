package com.lms.prof.prof_attendance.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class ProfAttendanceDto {
    // 강의 정보 lecture_info
    private String lectureYear; // 강의 년도
    private int instructorNo; // 강사 번호
    private String lectureName; // 강의 이름
    private int profId;
    private int lectureId; // 강의 번호

    // 교육 과정 정보 curriculum
    private String curriculumName; // 교육 과정명
    private LocalDate startDate;  // 시작 일자
    private LocalDate endDate;  // 종료 일자

    // weekInfo 에 필요한 애들
    private int lectureWeek; // 강의 주차
    private LocalDate lectureDate; // 강의 날짜
    private int count; // 인원수
    private String name; // 학생 이름
    private String email; // 학생 이메일
    private int studentId; // 학생 번호
    private int weekId; // 주차 번호
    private String division; // 출결 상태
    private int attendance; // 출석률
}
