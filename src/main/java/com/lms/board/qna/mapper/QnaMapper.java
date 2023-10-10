package com.lms.board.qna.mapper;

import com.lms.board.qna.dto.QnaDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QnaMapper {
    List<QnaDto> selectQnaList(@Param("startRow") int startRow, @Param("pageSize") int pageSize) throws Exception;

    public void insertQna(QnaDto qnaDto) throws Exception;

    public QnaDto qnaOne(int qnaId) throws Exception;

    public int updateQna(QnaDto qnaDto) throws Exception;

    public int deleteQna(int qnaId) throws Exception;

    public int getTotalQnaCount() throws Exception;

    public void increaseViewCount(int qnaId) throws Exception;


}
