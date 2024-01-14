package com.lms.user.assignments.service;

import com.lms.user.assignments.dto.StuAssignmentsDto;
import com.lms.user.assignments.mapper.StuAssignmentsMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class StuAssignmentsServiceImpl implements StuAssignmentsService {

    private final StuAssignmentsMapper stuAssignmentsMapper;

    // 강좌 정보 - 년, 교욱과정
    @Override
    public List<StuAssignmentsDto> getSyllabusInfo(String lectureYear, String lectureName, int studentId){
        return stuAssignmentsMapper.getSyllabusInfo(lectureYear, lectureName, studentId);
    }

    // 강좌 정보 - 시작일자, 종료일자
    @Override
    public List<StuAssignmentsDto> getSyllabusDateInfo(String lectureYear, String lectureName, int studentId){
        return stuAssignmentsMapper.getSyllabusDateInfo(lectureYear, lectureName, studentId);
    }

    // 과제 정보 리스트 출력
    @Override
    public List<StuAssignmentsDto> getAssignmentsInfo(String lectureYear, String lectureName, int studentId){
        return stuAssignmentsMapper.getAssignmentsInfo(lectureYear, lectureName, studentId);
    }

    // 과제 하나 보기
    @Override
    public StuAssignmentsDto getAssignmentsDetail(String lectureYear, String lectureName, int studentId, int assignmentId){
        return stuAssignmentsMapper.getAssignmentsDetail(lectureYear, lectureName, studentId, assignmentId);
    }

    // 제출한 파일 존재 여부
    @Override
    public int checkAssignmentSubmission(Map<String, Object> parameters) {
        return stuAssignmentsMapper.checkAssignmentSubmission(parameters);
    }

    // 과제 파일 제출하기
    @Override
    public void insertAssignmentSubmission(Map<String, Object> parameters){
        stuAssignmentsMapper.insertAssignmentSubmission(parameters);
    }

    // 과제 파일 수정하기
    @Override
    public void updateAssignmentSubmission(Map<String, Object> parameters){
        stuAssignmentsMapper.updateAssignmentSubmission(parameters);
    }

    // 과제 제출 시 인원 수 증가시키기
    @Override
    public void updateSubmissionCount(Map<String, Object> parameters) {
        stuAssignmentsMapper.updateSubmissionCount(parameters);
    }

    // id 얻어오기(과제 제출하기)
    @Override
    public List<StuAssignmentsDto> getId(String lectureYear, String lectureName, int assignmentId, int lectureId, int studentId){
        return stuAssignmentsMapper.getId(lectureYear, lectureName, assignmentId, lectureId, studentId);
    }

    // 제출한 과제보기
    @Override
    public List<StuAssignmentsDto> submitAssignments(String lectureYear, String lectureName, int studentId, int assignmentId){
        return stuAssignmentsMapper.submitAssignments(lectureYear, lectureName, studentId, assignmentId);
    }

    // 피드백 보기
    @Override
    public StuAssignmentsDto getCommetns(String lectureYear, String lectureName, int studentId, int assignmentId){
        return stuAssignmentsMapper.getComments(lectureYear, lectureName, studentId, assignmentId);
    }

}
