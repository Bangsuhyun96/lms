package com.lms.classInfo.mapper;

import com.lms.classInfo.dto.EnrollDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface EnrollMapper {
    List<EnrollDto> enrollAll();

    List<EnrollDto> subAndProf();

    EnrollDto enrolmented(int studentId);

    void insertSub(Map<String, Object> paramMap);

    void deleteCurriculum(Map<String, Object> paramMap);

    // 인원수 업데이트
    void countUpdate(int curriculumId);

}
