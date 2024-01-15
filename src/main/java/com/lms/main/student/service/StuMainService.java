package com.lms.main.student.service;

import com.lms.main.student.dto.StuMainDto;

import java.util.List;

public interface StuMainService {

    // 과제 제출 현황
    List<StuMainDto> getAssignmentList(int studentId);

}
