package com.lms.admin.moli.service;

import com.lms.admin.moli.dto.MoliDto;

import java.util.List;

public interface MoliService {

    List<MoliDto> selectAll();

    List<MoliDto> selectSearch(MoliDto moliDto);

    public int selectUpdate(String name, String studentCount, String lectureId);

    // 강사조회
    List<MoliDto> searchProf();

    // 강사료 업데이트
    public int profUpdate(String profId, int lectureFee);
}
