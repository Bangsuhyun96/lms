package com.lms.login.mapper;

import com.lms.login.model.dto.JoinDto;
import com.lms.login.model.dto.LoginDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface Login {
    LoginDto findByLoginId(LoginDto loginDto);

    List<JoinDto> findByJoinDto();
}
