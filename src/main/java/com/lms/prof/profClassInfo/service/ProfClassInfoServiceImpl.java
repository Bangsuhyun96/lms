package com.lms.prof.profClassInfo.service;

import com.lms.prof.profClassInfo.dto.ProfClassInfoDto;
import com.lms.prof.profClassInfo.mapper.ProfClassInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ProfClassInfoServiceImpl implements ProfClassInfoService{

    private final ProfClassInfoMapper profClassInfoMapper;

    // 나의 강의실 년도 띄우기
    @Override
    public List<ProfClassInfoDto> lectureYearAll(int profId){
        return profClassInfoMapper.lectureYearAll(profId);
    }

    // 나의 강의실 년도에 따른 수강 과목 띄우기
    @Override
    public List<ProfClassInfoDto> lectureSubjectAll(int profId){
        return profClassInfoMapper.lectureSubjectAll(profId);
    }

    // 강좌 정보 - 년, 교육과정명
    @Override
    public List<ProfClassInfoDto> getSyllabusInfo(String lectureYear, String lectureName, int profId){
        return profClassInfoMapper.getSyllabusInfo(lectureYear, lectureName, profId);
    }

    // 강좌 정보 - 시작일자, 종료일자
    @Override
    public List<ProfClassInfoDto> getSyllabusDateInfo(String lectureYear, String lectureName, int profId){
        return profClassInfoMapper.getSyllabusDateInfo(lectureYear, lectureName, profId);
    }

    // 강좌 계획
    @Override
    public ProfClassInfoDto getSyllabusPlan(String lectureYear, String lectureName, int profId){
        return profClassInfoMapper.getSyllabusPlan(lectureYear, lectureName, profId);
    }

    // 주차 계획
    @Override
    public List<ProfClassInfoDto> getWeeklyPlan(String lectureYear, String lectureName, int profId){
        return profClassInfoMapper.getWeeklyPlan(lectureYear, lectureName, profId);
    }

    // 강좌 계획 교과목 설명 추가
    @Override
    public int insertSubjectPlan(Map<String, Object> params){
        return profClassInfoMapper.insertSubjectPlan(params);
    }

    // 강좌 계획 주차별 교과목 상세 설명 추가
//    @Override
//    public int insertLectureContents(Map<String, Object> params){
////        if (params == null) {
////            params = new HashMap<>();
////        }
//
//        // 나머지 코드는 그대로 유지
////        profClassInfoMapper.insertLectureContents(params);
//        return profClassInfoMapper.insertLectureContents(params);
//    }

}
