package com.lms.admin.lwm.mapper;

import com.lms.admin.lwm.dto.LwmDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LwmMapper {

    // 수업주차정보 전체 조회
    public List<LwmDto> searchLwmList();

    // 수업주차정보 선택 조회
    List<LwmDto> searchLwmByYearAndSemester(@Param("lectureYear") String lectureYear, @Param("curriculumSemester") int curriculumSemester);

}
