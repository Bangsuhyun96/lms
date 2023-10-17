package com.lms.login.model.dto;

import lombok.Data;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Data
public class UserDto {

    private int studentId;
    private String name;
    private LocalDate birthDate;
    private String gender;
    private String address;
    private String addressDetail;
    private String zipCode;
    private String phoneNo;
    private double totalAttendance;
    private String attendance80;
    private double totalScore;
    private double scoreGrade;
    private String studentStatus;
    private String entranceYear;
    private String creationLocation;
    private String userId;
    private String paymentStatus;

    private int profId;
    private String email;
    private String account;
    private String accountName;
    private String accountBank;
    private int lectureFee;

    public void setBirthDate(String birthDate) {
        // 문자열을 LocalDate로 변환
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        this.birthDate = LocalDate.parse(birthDate, formatter);
    }
}
