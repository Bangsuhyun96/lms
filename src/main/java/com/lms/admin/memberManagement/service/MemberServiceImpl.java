package com.lms.admin.memberManagement.service;

import com.lms.admin.memberManagement.dao.MemberDao;
import com.lms.login.model.dto.JoinDto;
import com.lms.login.model.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberDao memberDao;



    @Override
    public void saveStudent(UserDto userDTo) {
        memberDao.saveStudent(userDTo);
    }

    @Override
    public int findStudentId() {
//        System.out.println(memberDao.findByStudentId());
        return memberDao.findByStudentId();
    }

    @Override
    public int findProfId() {
//        System.out.println(memberDao.findByProfId());
        return memberDao.findByProfId();
    }

    @Override
    public void saveUser(JoinDto joinDto) {

        if (Objects.equals(joinDto.getUserType(), "학생")) {
            int idNumber = findStudentId()+1;
            joinDto.setUserId("student2023-" + (idNumber));
        } else {
            int idNumber = findProfId() + 1;
            joinDto.setUserId("prof2023-" + (idNumber));
        }

        joinDto.setUserPw("1234");
        memberDao.saveUser(joinDto);

    }

    @Override
    public void deleteMember(String userId, String userType) {

        if (Objects.equals(userType, "학생")) {
            memberDao.deleteStudent(userId);
        } else {
            memberDao.deleteProf(userId);
        }

        memberDao.deleteUser(userId);

    }
}
