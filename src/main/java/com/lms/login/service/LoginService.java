package com.lms.login.service;

import com.lms.login.dao.Login;
import com.lms.login.model.dto.JoinDto;
import com.lms.login.model.dto.LoginDto;
import com.lms.login.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

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

    public UserDto findStudent(String userId) {
        return loginDao.findByStudent(userId);
    }

    public UserDto findProf(String userId) {
        return loginDao.findByProf(userId);
    }

}
