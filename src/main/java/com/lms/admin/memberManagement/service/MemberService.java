package com.lms.admin.memberManagement.service;

import com.lms.login.model.dto.JoinDto;
import com.lms.login.model.dto.UserDto;

public interface MemberService {

    void saveStudent(UserDto userDTo);
    void saveProf(UserDto userDTo);
//    void checkSave()

    int findStudentId();
    int findProfId();

    void saveUser(JoinDto joinDto);

    void deleteMember(String userId, String userType);

    UserDto findStudent(String userId);
    UserDto findProf(String userId);

    //수정
    void updateStudent(UserDto userDto);
    void updateProf(UserDto userDto);

}
