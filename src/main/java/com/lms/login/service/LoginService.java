package com.lms.login.service;

import com.lms.login.mapper.Login;
import com.lms.login.model.dto.JoinDto;
import com.lms.login.model.dto.LoginDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final Login loginDao;

    public LoginDto login(LoginDto loginDto) {
        return loginDao.findByLoginId(loginDto);
    }

    public List<JoinDto> memberManage() {
        return loginDao.findByJoinDto();
    }


    public List<JoinDto> searchMember(JoinDto joinDto) {
        return loginDao.searchMember(joinDto);

    }
}
