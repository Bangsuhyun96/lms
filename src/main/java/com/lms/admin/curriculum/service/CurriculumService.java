package com.lms.admin.curriculum.service;

import com.lms.admin.curriculum.dto.CurriculumDto;

import java.util.List;

public interface CurriculumService {

    // 교육과정 목록 출력하기
    List<CurriculumDto> selectCurriculum();

    // 교육과정 추가하기
    public void insertCurriculum(CurriculumDto curriculumDto);

    // 교육과정 삭제하기
    public void deleteCurriculum(List<Integer> curriculumIds);
}
