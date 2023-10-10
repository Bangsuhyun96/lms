package com.lms.board.freeBoard.service;

import com.lms.board.freeBoard.dto.FreeBoardDto;
import com.lms.board.freeBoard.mapper.FreeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class FreeServiceImpl implements FreeService{

    @Autowired// Mapper와 연결
    private FreeMapper freeMapper;

//    @Autowired
//    public FreeServiceImpl(FreeMapper freeMapper) {
//        this.freeMapper = freeMapper;
//    }

    @Override
    public List<FreeBoardDto> selectBoardList() throws Exception{
        return freeMapper.selectBoardList();
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
}
