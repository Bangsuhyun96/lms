package com.lms.board.qna.service;

import com.lms.board.qna.dto.QnaDto;
import com.lms.board.qna.mapper.QnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class QnaServiceImpl implements QnaService{

    @Autowired
    private QnaMapper qnaMapper;

    @Override
    public List<QnaDto> selectQnaList(int pageNum, int pageSize) throws Exception{
        // 인덱스가 0부터 시작하기 때문에 -1을 해줌
        int startRow = (pageNum - 1) * pageSize;
        return qnaMapper.selectQnaList(startRow, pageSize);
    }

    @Override
    public void insertQna(QnaDto qnaDto) throws Exception{
        qnaMapper.insertQna(qnaDto);
    }

    @Override
    public QnaDto qnaOne(int qnaId) throws Exception{
        return qnaMapper.qnaOne(qnaId);
    }

    @Override
    public int updateQna(QnaDto qnaDto) throws Exception{
        return qnaMapper.updateQna(qnaDto);
    }

    @Override
    public int deleteQna(int qnaId) throws Exception{
        return qnaMapper.deleteQna(qnaId);
    }

    @Override
    public int getTotalQnaCount() throws Exception{
        return qnaMapper.getTotalQnaCount();
    }

    @Transactional
    @Override
    public void increaseViewCount(int qnaId) throws Exception{
        qnaMapper.increaseViewCount(qnaId);
    }

}
