package com.lms.board.freeBoard.service;

import com.lms.board.freeBoard.dto.FreeBoardDto;

import java.util.List;

public interface FreeService {
    List<FreeBoardDto> selectBoardList() throws Exception;

    void insertFree(FreeBoardDto freeBoard) throws Exception;

    FreeBoardDto selectBoard(int freeId) throws Exception;

    int deleteBoard(int freeId) throws Exception;

    int updateBoard(FreeBoardDto freeBoardDto) throws Exception;
}
