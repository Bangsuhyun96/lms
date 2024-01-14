package com.lms.main.student.dto;

import lombok.Data;

@Data
public class StuMainDto {

    // student
    private int studentId;

    // assignment
    private int assignmentId;
    private String assignmentName;

    // assignment_submission
    private int submissionId;
    private String filePath;

    // lecture_info
    private int lectureId;
    private String lectureYear;
    private String lectureName;

}
