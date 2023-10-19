package com.lms.admin.memberManagement.dao;

import com.lms.login.model.dto.JoinDto;
import com.lms.login.model.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
    UserDto saveStudent(UserDto userDto);
    UserDto saveProf(UserDto userDto);


    void saveUser(JoinDto joinDto);

    int findByStudentId();
    int findByProfId();

    void deleteUser(String userId);
    void deleteStudent(String userId);
    void deleteProf(String userId);

    UserDto findStudent(String userId);
    UserDto findProf(String userId);

    UserDto findStudentId(int studentId);
    UserDto findProfId(int profId);

    void updateStudent(UserDto userDto);
    void updateProf(UserDto userDto);
}
