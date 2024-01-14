package com.lms.prof.assignments.service;

import com.lms.prof.assignments.dto.AssignmentsDto;
import com.lms.prof.assignments.mapper.AssignmentsMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AssignmentsServiceImpl implements AssignmentsService{

    private final AssignmentsMapper assignmentsMapper;

    @Override
    // 강좌 정보 - 년, 교욱과정
    public List<AssignmentsDto> getSyllabusInfo(String lectureYear, String lectureName, int profId){
        return assignmentsMapper.getSyllabusInfo(lectureYear, lectureName, profId);
    }

    @Override
    // 강좌 정보 - 시작일자, 종료일자
    public List<AssignmentsDto> getSyllabusDateInfo(String lectureYear, String lectureName, int profId){
        return assignmentsMapper.getSyllabusDateInfo(lectureYear, lectureName, profId);
    }

    // 과제 정보 리스트 출력
    @Override
    public List<AssignmentsDto> getAssignmentsInfo(String lectureYear, String lectureName, int profId){
        return assignmentsMapper.getAssignmentsInfo(lectureYear, lectureName, profId);
    }

    // 과제 추가하기
    @Override
    public void insertAssignments(int lectureId,
                                  int lectorId,
                                  String assignmentName,
                                  String description,
                                  Date assignmentsStartDate,
                                  Date assignmentsEndDate,
                                  String status,
                                  String fileName,
                                  String filePath){
        assignmentsMapper.insertAssignments(lectureId, lectorId, assignmentName, description,
                assignmentsStartDate, assignmentsEndDate, status, fileName, filePath);
    }

    // id 얻어오기(과제 추가하기)
    @Override
    public List<AssignmentsDto> getId(String lectureYear, String lectureName, int profId){
        return assignmentsMapper.getId(lectureYear, lectureName, profId);
    }

    // 과제 제출한 학생 리스트 출력
    @Override
    public List<AssignmentsDto> getStuAssignments(String lectureYear,
                                          String lectureName,
                                          int profId,
                                          int lectureId,
                                          int assignmentId){
        return assignmentsMapper.getStuAssignments(lectureYear, lectureName, profId, lectureId, assignmentId);

    }

    // id 얻어오기(제출한 학생 리스트 보기)
    @Override
    public List<AssignmentsDto> getId2(String lectureYear, String lectureName, int profId){
        return assignmentsMapper.getId2(lectureYear, lectureName, profId);
    }

    // 과제 추가하기
    @Override
    public void insertComments(int profId,
                               int lectureId,
                               int assignmentId,
                               String evaluationComments,
                               int studentId){
        assignmentsMapper.insertComments(profId, lectureId, assignmentId, evaluationComments, studentId);
    }

    // 제출한 학생 상세 보기
    @Override
    public AssignmentsDto getComments(String lectureYear,
                               String lectureName,
                               int profId,
                               int lectureId,
                               int assignmentId,
                               int studentId){
        return assignmentsMapper.getComments(lectureYear, lectureName, profId, lectureId, assignmentId, studentId);
    }

}
