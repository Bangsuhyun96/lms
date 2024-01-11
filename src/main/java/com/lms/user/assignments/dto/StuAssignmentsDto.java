package com.lms.user.assignments.dto;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class StuAssignmentsDto {
    // lecture_info
    private String lectureYear;
    private String lectureName;
    private int lectureId;

    // curriculum
    private String curriculumName;

    // curriculum_lecture_week
    private Date startDate;
    private Date endDate;

    private int profId;
    private int studentId;

    // assignments
    private int assignmentId;
    private String assignmentName;
    private String description;
    private String status;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date assignmentsStartDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date assignmentsEndDate;
    private String fileName;   // 저장된 파일 이름
    private String filePath; // 저장된 파일 경로

    // assignments_submission
    private int submissionCount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date submissionDate;
    private String subFileName;
    private String subFilePath;
    private String evaluationComments;
}
