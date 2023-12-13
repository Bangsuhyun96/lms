package com.lms.classInfo.dto;

import lombok.Data;

import java.util.Date;

@Data
public class EnrollDto {
    private int curriculumId; // 과정번호(일련번호)
    private String curriculumName; // 과정명
    private int profId; // 교수번호(일련번호)
    private String name; // 교수명
    private int studentCount; // 수강인원
    private int subjectId; // 과목번호(일련번호)
    private String subjectName; // 과목이름
    private Date startDate; // 시작일자
    private Date endDate; // 종료일자

    // --------------------//

    private int count; // 인원수

}
