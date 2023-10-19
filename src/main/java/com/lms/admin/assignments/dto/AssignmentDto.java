package com.lms.admin.assignments.dto;

import lombok.*;

import java.util.Date;

@Data
public class AssignmentDto {
    private int assignmentsId; // 과제ID
    private int lectureId; // 강의ID
    private String assignmentName; // 과제명
    private String unit; // 수행단위
    private Date startDate; // 제출시작일시
    private Date endDate; // 제출마감일시
    private String status; // 진행상태
    private int submissionCount; // 제출인원
    private String description; // 과제설명 (수정: Text 대신 String 사용)
    private int fileNo; // 파일번호
    private int lectorId; // 강사번호
    private String professorName; // 추가: SQL 쿼리와 일치하도록 professorName 필드 추가
    private int studentCount; // 추가: SQL 쿼리와 일치하도록 student_count 필드 추가

    private String lectureName; // 강의이름
    private String lectureYear; // 년도
    private int assignmentCount;

}
