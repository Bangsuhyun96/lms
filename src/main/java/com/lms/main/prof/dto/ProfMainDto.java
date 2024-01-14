package com.lms.main.prof.dto;

import lombok.Data;

@Data
public class ProfMainDto {

    // student
    private int studentId;

    // prof
    private int profId;

    // assignment
    private int assignmentId;
    private String assignmentName;
    private int submissionCount;

    // assignment_submission
    private int submissionId;
    private String filePath;

    // lecture_info
    private int lectureId;
    private String lectureYear;
    private String lectureName;

}
