package com.lms.admin.lectureAttendance.service;

import com.lms.admin.lectureAttendance.dto.LectureDto;

import java.util.List;

public interface LectService {

    List<LectureDto> selectAll();
}
