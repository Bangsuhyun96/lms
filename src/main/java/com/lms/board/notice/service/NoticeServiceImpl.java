package com.lms.board.notice.service;

import com.lms.board.notice.dto.NoticeDto;
import com.lms.board.notice.mapper.NoticeMapper;
import com.lms.board.qna.dto.QnaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<NoticeDto> selectNoticeList(int pageNum, int pageSize) throws Exception{
        int startRow = (pageNum - 1) * pageSize;
        return noticeMapper.selectNoticeList(startRow, pageSize);
    }

    @Override
    public void insertNotice(NoticeDto noticeDto) throws Exception{
        noticeMapper.insertNotice(noticeDto);
    }

    @Override
    public NoticeDto noticeOne(int noticeId) throws Exception{
        return noticeMapper.noticeOne(noticeId);
    }

    @Override
    public int updateNotice(NoticeDto noticeDto) throws Exception{
        return noticeMapper.updateNotice(noticeDto);
    }

    @Override
    public int deleteNotice(int noticeId) throws Exception{
        return noticeMapper.deleteNotice(noticeId);
    }

    @Override
    public int getTotalNoticeCount() throws Exception{
        return noticeMapper.getTotalNoticeCount();
    }

    @Transactional
    @Override
    public void increaseViewCount(int noticeId) throws Exception{
        noticeMapper.increaseViewCount(noticeId);
    }
}
