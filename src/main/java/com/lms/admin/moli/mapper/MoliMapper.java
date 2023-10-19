package com.lms.admin.moli.mapper;

import com.lms.admin.moli.dto.MoliDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MoliMapper {

    // 개설강좌목록 전체조회
    public List<MoliDto> selectAll();

    // 검색한 개설강좌목록 조회
    public List<MoliDto> selectSearch(MoliDto moliDto);

    // 정보 저장
    public int selectUpdate(@Param("name") String name,
                            @Param("studentCount") String studentCount,
                            @Param("lectureId") String lectureId);

    // 강사 조회
    public List<MoliDto> searchProf();

    // 강사료 업데이트
    public int profUpdate(@Param("profId") String profId, @Param("lectureFee") int lectureFee);
}
