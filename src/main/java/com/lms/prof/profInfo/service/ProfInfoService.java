package com.lms.prof.profInfo.service;

import com.lms.prof.profInfo.dto.ProfInfoDto;

import java.util.List;
import java.util.Map;

public interface ProfInfoService{
    ProfInfoDto profInfo(int profId);

    // 교수 정보 수정(업데이트)
    int profInfoUpdate(Map<String, Object> param);

    // 강의 이력 출력
    List<ProfInfoDto> profHistory(int profId);
}
