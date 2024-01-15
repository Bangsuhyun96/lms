package com.lms.classInfo.service;

import com.lms.classInfo.dto.AttendanceDto;

import java.util.List;

public interface AttendanceService {

    // 강좌정보 띄우기
    AttendanceDto lectureInfo(int lectureId);

    List<AttendanceDto> attendInfo(int lecture_id, int student_id);
}
