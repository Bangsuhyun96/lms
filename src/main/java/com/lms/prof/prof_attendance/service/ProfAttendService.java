package com.lms.prof.prof_attendance.service;

import com.lms.prof.prof_attendance.dto.ProfAttendanceDto;

import java.util.Date;
import java.util.List;

public interface ProfAttendService {

//    List<ProfAttendanceDto> lectureYearAll(int studentId);

    List<ProfAttendanceDto> lectureAll(int profId);

    List<ProfAttendanceDto> lectureSelect(int profId, String year);

    // 출결 페이지 -> 상단 강의정보
    ProfAttendanceDto lectureInfo(int lectureId);

    // 주차, 날짜, 총인원수, 출석인원 정보
    List<ProfAttendanceDto> weekInfo(int lectureId);

    // 선택한 날짜의 주차, 날짜, 총인원수, 출석인원 정보
    ProfAttendanceDto pickedInfo(int lectureId, Date pickDate);

    // 수강하는 학생들 리스트
    List<ProfAttendanceDto> stuInfo(int lectureId);

    // 학생 출결현황 저장
    void saveAttendance(int studentId, String status, int lectureId, int weekId);

    // lecture_apply update
    void laupdate(int lectureId, int studentId);

    // 주차별 학생 출결상태 출력
    List<ProfAttendanceDto> todayAttendance(int lectureId, int weekId);
}
