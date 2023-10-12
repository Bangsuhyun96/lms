package com.lms.admin.lwm.dto;

import lombok.Data;

import java.util.Date;

@Data
public class LwmDto {
    private int curriculumId; // 커리큘럼 id 기준 키
    private int weekId;
    private String lectureYear; //lecture_info 테이블 → 수업년도
    private int curriculumSemester; // curriculum 테이블 → 시작학기
    private String  curriculumDivision; // curriculum 테이블 → 과정구분
    private int lectureWeek; // curriculum 테이블 → 강의주차
    private Date startDate; // curriculum 테이블 → 시작일
    private Date endDate; // curriculum 테이블 → 종료일
    private String makeupWeek; // curriculum_lecture_week 테이블 → 보강주
}
