package com.lms.admin.lectureAttendance.service;

import com.lms.admin.lectureAttendance.dto.LectureDto;

import java.time.LocalDate;
import java.util.List;

public interface LectService {

    List<LectureDto> selectAll();

    List<LectureDto> selectSearch(LectureDto lectureDto);

    public int lectUpdate(String progress, String feeDate, String lectureId);
}
