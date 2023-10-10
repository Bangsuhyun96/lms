package com.lms.board.freeBoard.service;

import com.lms.board.freeBoard.dto.FreeBoardDto;
import com.lms.board.freeBoard.mapper.FreeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service

public class FreeServiceImpl implements FreeService{

    @Autowired// Mapper와 연결
    private FreeMapper freeMapper;

    @Override
    public List<FreeBoardDto> selectBoardList(int pageNum, int pageSize) throws Exception{
        // 페이지의 시작 행을 나타내는 변수 : 시작행은 0부터 시작함
        int startRow = (pageNum - 1) * pageSize;
        return freeMapper.selectBoardList(startRow, pageSize);
    }

    @Override
    public void insertFree(FreeBoardDto freeBoard) throws Exception{
        freeMapper.insertFree(freeBoard);
    }

    @Override
    public FreeBoardDto selectBoard(int freeId) throws Exception{
        return freeMapper.selectBoard(freeId);
    }

    @Override
    public int deleteBoard(int freeId) throws Exception{
        return freeMapper.deleteBoard(freeId);
    }

    @Override
    public int updateBoard(FreeBoardDto freeBoardDto) throws Exception{
        return freeMapper.updateBoard(freeBoardDto);
    }

    // 게시물 수 count
    @Override
    public int getTotalFreeCount() throws Exception{
        return freeMapper.getTotalFreeCount();
    }

    // 조회수 증가
    @Transactional
    @Override
    public void increaseHitsCount(int freeId) throws Exception{
        freeMapper.increaseHitsCount(freeId);
    }
}
