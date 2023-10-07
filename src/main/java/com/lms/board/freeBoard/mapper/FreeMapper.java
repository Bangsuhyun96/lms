package com.lms.board.freeBoard.mapper;

import com.lms.board.freeBoard.dto.FreeBoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FreeMapper {
    List<FreeBoardDto> selectBoardList();

    void insertFree(FreeBoardDto freeBoard) throws Exception;

    FreeBoardDto selectBoard(int freeId); // 글 하나 조회 메서드

    // 글 삭제 메서드
    public int deleteBoard(int freeId) throws Exception;

    public int updateBoard(FreeBoardDto freeBoardDto) throws Exception;
}
