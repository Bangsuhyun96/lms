package com.lms.login.dao;

import com.lms.login.model.dto.JoinDto;
import com.lms.login.model.dto.LoginDto;
import com.lms.login.model.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface Login {
    LoginDto findByLoginId(LoginDto loginDto);

    List<JoinDto> findByJoinDto();

    List<JoinDto> searchMember(JoinDto joinDto);

    UserDto findByStudent(String userId);
    UserDto findByProf(String userId);

}
