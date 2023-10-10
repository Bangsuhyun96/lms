package com.lms.board.notice.service;


import com.lms.board.notice.dto.NoticeDto;

import java.util.List;

public interface NoticeService {

    // notice 리스트 보기
    List<NoticeDto> selectNoticeList(int pageNum, int pageSize) throws Exception;

    // notice 추가
    public void insertNotice(NoticeDto noticeDto) throws Exception;

    // notice 글 1개 조회
    public NoticeDto noticeOne(int noticeId) throws Exception;

    // 게시물 총 개수 반환
    public int getTotalNoticeCount() throws Exception;

    // notice 수정
    public int updateNotice(NoticeDto noticeDto) throws Exception;

    // notice 삭제
    public int deleteNotice(int noticeId) throws Exception;

    // 조회수 증가
    public void increaseViewCount(int noticeId) throws Exception;

}
