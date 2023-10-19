package com.lms.admin.curriculumSchedule.dto;

import lombok.Data;
import java.util.Date;

@Data
public class CurriculumScheduleDto {
    private int scheduleId;
    private int curriculumId;
    private String certainType;
    private Date startDate;
    private Date endDate;
    private String curriculumYear;
    private String curriculumName;
}
