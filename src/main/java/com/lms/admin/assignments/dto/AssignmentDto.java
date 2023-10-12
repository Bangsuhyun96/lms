package com.lms.admin.assignments.dto;

import lombok.Data;
import org.w3c.dom.Text;

import java.util.Date;

@Data
public class AssignmentDto {

    private int assignments_id; // 과제ID
    private int lecture_id; // 강의ID
    private String assignment_name; // 과제명
    private String unit; // 수행단위
    private Date start_date; // 제출시작일시
    private Date end_date; // 제출마감일시
    private String status; // 진행상태
    private int submission_count; // 제출인원
    private Text description; // 과제설명
    private int file_no; // 파일번호
    private int lector_id; // 강사번호

}
