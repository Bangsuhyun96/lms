package com.lms.prof.profInfo.service;

import com.lms.prof.profInfo.dto.ProfInfoDto;
import com.lms.prof.profInfo.mapper.ProfInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ProfInfoServiceImpl implements ProfInfoService{

    private final ProfInfoMapper profInfoMapper;
    @Override
    public ProfInfoDto profInfo(int profId){
        return profInfoMapper.profInfo(profId);
    }

    @Override
    public int profInfoUpdate(Map<String, Object> param){
        return profInfoMapper.profInfoUpdate(param);
    }

    @Override
    public List<ProfInfoDto> profHistory(int profId){
        return profInfoMapper.profHistory(profId);
    }
}
