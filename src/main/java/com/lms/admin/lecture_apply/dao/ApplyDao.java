package com.lms.admin.lecture_apply.dao;

import com.lms.admin.lecture_apply.dto.LectureInfoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ApplyDao {

    List<LectureInfoDto> selectInfo();
}
