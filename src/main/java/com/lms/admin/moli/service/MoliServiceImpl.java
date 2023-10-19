package com.lms.admin.moli.service;

import com.lms.admin.moli.dto.MoliDto;
import com.lms.admin.moli.mapper.MoliMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MoliServiceImpl implements MoliService{

    private final MoliMapper moliMapper;

    @Override
    public List<MoliDto> selectAll(){
        return moliMapper.selectAll();
    }

    @Override
    public List<MoliDto> selectSearch(MoliDto moliDto){
        return moliMapper.selectSearch(moliDto);
    }

    @Override
    public int selectUpdate(String name, String studentCount, String lectureId){
        return moliMapper.selectUpdate(name, studentCount, lectureId);
    }

    // 강사조회
    @Override
    public List<MoliDto> searchProf(){
        return moliMapper.searchProf();
    }

    // 강사료 업데이트
    @Override
    public int profUpdate(String profId, int lectureFee){
        return moliMapper.profUpdate(profId, lectureFee);
    }
}
