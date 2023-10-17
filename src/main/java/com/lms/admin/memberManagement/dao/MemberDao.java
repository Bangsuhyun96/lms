package com.lms.admin.memberManagement.dao;

import com.lms.login.model.dto.JoinDto;
import com.lms.login.model.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
    void saveStudent(UserDto userDto);

    void saveUser(JoinDto joinDto);

    int findByStudentId();
    int findByProfId();

    void deleteUser(String userId);
    void deleteStudent(String userId);
    void deleteProf(String userId);


}
