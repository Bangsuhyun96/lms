package com.lms.board.qna.service;

import com.lms.board.qna.dto.QnaDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QnaService {

    // qna 리스트 보기
    List<QnaDto> selectQnaList(int pageNum, int pageSize) throws Exception;

    // qna 추가
    public void insertQna(QnaDto qnaDto) throws Exception;

    // qna 하나 보기
    public QnaDto qnaOne(int qnaId) throws Exception;

    // qna 수정
    public int updateQna(QnaDto qnaDto) throws Exception;

    // qna 삭제
    public int deleteQna(int qnaId) throws Exception;

    // 게시물 총 개수 반환
    public int getTotalQnaCount() throws Exception;

    // 조회수 증가
    public void increaseViewCount(int qnaId) throws Exception;


}
