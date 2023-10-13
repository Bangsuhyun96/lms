package com.lms.login.model.dto;

import lombok.Data;

import java.time.LocalDate;

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

}
