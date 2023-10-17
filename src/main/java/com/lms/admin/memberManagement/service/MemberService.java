package com.lms.admin.memberManagement.service;

import com.lms.login.model.dto.JoinDto;
import com.lms.login.model.dto.UserDto;

public interface MemberService {

    void saveStudent(UserDto userDTo);

    int findStudentId();
    int findProfId();

    void saveUser(JoinDto joinDto);

    void deleteMember(String userId, String userType);

}
