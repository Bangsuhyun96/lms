package com.lms.prof.profClassInfo.mapper;

import com.lms.prof.profClassInfo.dto.ProfClassInfoDto;
import com.lms.user.classinfo.dto.StuClassInfoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProfClassInfoMapper {

    // 나의 강의실 년도 띄우기
    List<ProfClassInfoDto> lectureYearAll(int profId);

    // 나의 강의실 년도에 따른 수강 과목 띄우기
    List<ProfClassInfoDto> lectureSubjectAll(int profId);

    // 강좌 정보 - 년, 교육과정명
    List<ProfClassInfoDto> getSyllabusInfo(String lectureYear, String lectureName, int profId);

    // 강좌 정보 - 시작일자, 종료일자
    List<ProfClassInfoDto> getSyllabusDateInfo(String lectureYear, String lectureName, int profId);

    // 강좌 계획
    ProfClassInfoDto getSyllabusPlan(String lectureYear, String lectureName, int profId);

    // 주차 계획
    List<ProfClassInfoDto> getWeeklyPlan(String lectureYear, String lectureName, int profId);

    // 강좌 계획 교과목 설명 추가
    public int insertSubjectPlan(Map<String, Object> params);

    // 강좌 계획 주차별 교과목 상세 설명 추가
//    public int insertLectureContents(Map<String, Object> params);

}
