package com.lms.admin.curriculum.service;

import com.lms.admin.curriculum.dto.CurriculumDto;

import java.util.List;

public interface CurriculumService {

    // 교육과정 목록 출력하기
    public List<CurriculumDto> selectCurriculum(int pageNum, int pageSize);

    // 교육과정 추가하기
    public void insertCurriculum(CurriculumDto curriculumDto);

    // 교육과정 삭제하기
    public void deleteCurriculum(List<Integer> curriculumIds);

    // 교육과정 수정하기
    public void updateCurriculum(CurriculumDto curriculumDto);

    // 교육과정 전체 개수
    public int getTotalCurriculumCount();

    // 교육과정 조회하기
//    List<CurriculumDto> searchCurriculum(CurriculumDto curriculumDto);
}
