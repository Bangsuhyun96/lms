package com.lms.prof.prof_attendance.service;

import com.lms.prof.prof_attendance.dto.ProfAttendanceDto;

import java.util.List;

public interface ProfAttendService {
    List<ProfAttendanceDto> lectureAll(int profId);

    List<ProfAttendanceDto> lectureSelect(int profId, String year);

    // 출결 페이지 -> 상단 강의정보
    ProfAttendanceDto lectureInfo(int lectureId);
}
