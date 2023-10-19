package com.lms.prof.prof_attendance.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class ProfAttendanceDto {
    // 강의정보 lecture_info
    private String lectureYear; // 강의년도
    private int instructorNo; // 강사번호
    private String lectureName; // 강의이름
    private int profId;
    private int lectureId; // 강의번호

    // 교육과정정보 curriculum
    private String curriculumName; // 교육과정명
    private LocalDate startDate;  // 시작일자
    private LocalDate endDate;  // 종료일자
}
