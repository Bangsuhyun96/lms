package com.lms.board.notice.mapper;

import com.lms.board.notice.dto.NoticeDto;
import com.lms.board.qna.dto.QnaDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticeMapper {
    List<NoticeDto> selectNoticeList(@Param("startRow") int startRow, @Param("pageSize") int pageSize) throws Exception;

    public void insertNotice(NoticeDto noticeDto) throws Exception;

    public NoticeDto noticeOne(int noticeId) throws Exception;

    public int updateNotice(NoticeDto noticeDto) throws Exception;

    public int deleteNotice(int noticeId) throws Exception;

    public int getTotalNoticeCount() throws Exception;

    public void increaseViewCount(int noticeId) throws Exception;




}
