package com.lms.admin.moli.dto;

import lombok.Data;

@Data
public class MoliDto {
    // 강의정보 테이블 lecture_info
    private int lectureId; // 강의 id
    private String lectureName; // 강의이름
    private String lectureYear; // 강의년도
    private int hours; // 강의시수
    private String progress; // 강의상태
    private int studentCount; // 수강인원
    private int curriculumId; // 과정id
    private int instructorNo; // 강사번호
    private int subjectId; // 교과목id

    // 교육과정정보 테이블 curriculum
    private int lectureWeek; // 강의주차
    private String curriculumName; // 과정이름

    // 강사 테이블 prof
    private String name; // 강사이름
    private int profId; // 강사번호
    private int lectureFee; // 시수단가

    // 개설강의시간표 테이블 lecture_time
    private String lectureDay; // 수업요일
    private String lectureTime; // 수업교시? 시작교시? 수업시작시간?
    private String classroom; // 강의실

}
