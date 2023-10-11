package com.lms.board.freeBoard.service;

import com.lms.board.freeBoard.dto.FreeBoardDto;

import java.util.List;

public interface FreeService {
    List<FreeBoardDto> selectBoardList(int pageNum, int pageSize) throws Exception;

    void insertFree(FreeBoardDto freeBoard) throws Exception;

    FreeBoardDto selectBoard(int freeId) throws Exception;

    int deleteBoard(int freeId) throws Exception;

    int updateBoard(FreeBoardDto freeBoardDto) throws Exception;

    // 게시물 수 count
    public int getTotalFreeCount() throws Exception;

    // 조회수 증가
    public void increaseHitsCount(int freeId) throws Exception;

}
