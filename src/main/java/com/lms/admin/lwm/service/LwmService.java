package com.lms.admin.lwm.service;

import com.lms.admin.lwm.dto.LwmDto;

import java.util.List;

public interface LwmService {

    // 수업주차정보 전체 조회
    List<LwmDto> lwmSelectAll();

    // 수업주차정보 선택 조회
    List<LwmDto> searchLwmByYearAndName(String curriculumYear, String curriculumName);

    // 수업주차정보 추가
    void insertLwm(LwmDto lwmDto);

    // 수업주차정보 업데이트
    void updateLwm(LwmDto lwmDto);
    // 수업주차정보 삭제
    int clwDelete(int weekId);
    int lectureTime(int weekId);
    int lwmDelete(int weekId);

}
