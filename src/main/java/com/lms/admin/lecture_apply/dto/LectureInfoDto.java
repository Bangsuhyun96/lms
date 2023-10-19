package com.lms.admin.lecture_apply.dto;

import lombok.Data;

@Data
public class LectureInfoDto {

    private int lectureId;
    private String lectureName;
    private String lectureYear;
    private int hours;
    private String progress;
    private int studentCount;
    private String lectureContent;
    private int curriculumId;
    private int instructorNo;
    private int subjectId;

    private String name;

    private String lectureDay;
    private String lectureTime;
    private String classroom;
}
