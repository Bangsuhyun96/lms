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
    List<LwmDto> searchLwmByYearAndName(@Param("curriculumYear") String curriculumYear, @Param("curriculumName") String curriculumName);

    // 수업주차정보 추가
    void insertLwm(LwmDto lwmDto);

    // 수업주차정보 업데이트
    void updateLwm(LwmDto lwmDto);

    // 수업주차정보 삭제
    int deleteClw(@Param("weekId") int weekId);
    int deleteLectureTime(@Param("weekId") int weekId);
    int deleteLwm(@Param("weekId") int weekId);

}
