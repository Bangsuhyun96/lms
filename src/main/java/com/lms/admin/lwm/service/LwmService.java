package com.lms.admin.lwm.service;

import com.lms.admin.lwm.dto.LwmDto;

import java.util.List;

public interface LwmService {

    // 수업주차정보 전체 조회
    List<LwmDto> lwmSelectAll();

    // 수업주차정보 선택 조회
    List<LwmDto> searchLwmByYearAndSemester(String lectureYear, int curriculumSemester);


}
