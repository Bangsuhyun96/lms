package com.lms.classInfo.service;

import com.lms.classInfo.dto.EnrollDto;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface EnrollService {
    // 수강신청 과목 리스트
    List<EnrollDto> enrollAll();
    // 상세보기 (과목명, 교수명)
    List<EnrollDto> subAndProf();
    // 수강신청한 과정
    EnrollDto enrolmented(int studentId);

    // 수강신청한 과목 insert
    void insertSub(Map<String, Object> paramMap);

    // 수강 중인 과목이 있는지 체크
    boolean checkIfAlreadyEnrolled(int studentId);

    // 수강 취소
    void deleteCurriculum(Map<String, Object> paramMap);

    // count 업데이트
    void countUpdate(int curriculumId);
}
