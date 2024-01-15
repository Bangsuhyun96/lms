package com.lms.prof.profInfo.mapper;

import com.lms.prof.profInfo.dto.ProfInfoDto;
import com.lms.prof.profInfo.service.ProfInfoService;
import org.apache.ibatis.annotations.Mapper;

import javax.swing.*;
import java.util.List;
import java.util.Map;

@Mapper
public interface ProfInfoMapper {

    ProfInfoDto profInfo(int profId);

    int profInfoUpdate(Map<String, Object> param);

    List<ProfInfoDto> profHistory(int profId);
}
