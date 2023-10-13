package com.lms.test;

import com.lms.login.dao.Login;
import com.lms.login.model.dto.UserDto;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MapperTest {

    @Autowired
    private Login login;


    @Test
    void getMapper() {


        UserDto student = login.findByStudent("student2023-1");

        System.out.println("student = " + student);

    }

}
