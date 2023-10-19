package com.lms.admin.lecture_apply.service;

import com.lms.admin.lecture_apply.dao.ApplyDao;
import com.lms.admin.lecture_apply.dto.LectureInfoDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LectureApplyService {

    private final ApplyDao applyDao;

    public List<LectureInfoDto> selectInfo() {
        return applyDao.selectInfo();
    }
}
