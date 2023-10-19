package com.lms.admin.lwm.dto;

import lombok.Data;

import java.util.Date;

@Data
public class LwmDto {
    private int curriculumId;
    private int lectureWeek;
    private Date startDate;
    private Date endDate;
    private Date ClwstartDate;
    private Date ClwendDate;
    private String makeupWeek;
    private String curriculumYear;
    private int weekId;
    private String curriculumName;
}
