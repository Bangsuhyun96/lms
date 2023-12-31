package com.lms.admin.lwm.service;

import com.lms.admin.lwm.dto.LwmDto;
import com.lms.admin.lwm.mapper.LwmMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LwmServiceImpl implements LwmService{

    private final LwmMapper lwmMapper;

    // 수업주차정보 전체 조회
    @Override
    public List<LwmDto> lwmSelectAll() {
        return lwmMapper.searchLwmList();
    }

    // 수업주차정보 선택 조회
    @Override
    public List<LwmDto> searchLwmByYearAndName(String curriculumYear, String curriculumName) {
        return lwmMapper.searchLwmByYearAndName(curriculumYear, curriculumName);
    }

    // 수업주차정보 추가
    @Override
    public void insertLwm(LwmDto lwmDto) {
        lwmMapper.insertLwm(lwmDto);
    }

    // 수업주차정보 업데이트
    @Override
    public void updateLwm(LwmDto lwmDto) {
        lwmMapper.updateLwm(lwmDto);
    }


    // 수업주차정보 삭제
    @Override
    public int clwDelete(int weekId){
        return lwmMapper.deleteClw(weekId);
    }
    @Override
    public int lectureTime(int weekId){
        return lwmMapper.deleteLectureTime(weekId);
    }
    @Override
    public int lwmDelete(int weekId){
        return lwmMapper.deleteLwm(weekId);
    }

}
