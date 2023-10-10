package com.lms.board.freeBoard.mapper;

import com.lms.board.freeBoard.dto.FreeBoardDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FreeMapper {
    List<FreeBoardDto> selectBoardList(@Param("startRow") int StartRow, @Param("pageSize") int pageSize);

    void insertFree(FreeBoardDto freeBoard) throws Exception;

    FreeBoardDto selectBoard(int freeId); // 글 하나 조회 메서드

    // 글 삭제 메서드
    public int deleteBoard(int freeId) throws Exception;

    public int updateBoard(FreeBoardDto freeBoardDto) throws Exception;

    public int getTotalFreeCount() throws Exception;

    public void increaseHitsCount(int freeId) throws Exception;
}
