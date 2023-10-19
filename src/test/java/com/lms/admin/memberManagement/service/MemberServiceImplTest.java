package com.lms.admin.memberManagement.service;

import com.lms.admin.memberManagement.dao.MemberDao;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

class MemberServiceImplTest {

    private final MemberDao memberDao;

    MemberServiceImplTest(MemberDao memberDao) {
        this.memberDao = memberDao;
    }


    @Test
    void saveStudent() {
        memberDao.findByStudentId();
    }

    @Test
    void findStudentId() {

    }

    @Test
    void findProfId() {
    }

    @Test
    void saveUser() {
    }
}