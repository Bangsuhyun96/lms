package com.lms.main.prof.service;

import com.lms.main.prof.dto.ProfMainDto;

import java.util.List;

public interface ProfMainService {

    // 과제 제출 현황
    List<ProfMainDto> getAssignmentList(int profId);

}
