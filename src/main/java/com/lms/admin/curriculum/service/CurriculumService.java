package com.lms.admin.curriculum.service;

import com.lms.admin.curriculum.dto.CurriculumDto;

import java.util.List;

public interface CurriculumService {

    // 교육과정 목록 출력하기
    List<CurriculumDto> getAllCurriculum();
}
