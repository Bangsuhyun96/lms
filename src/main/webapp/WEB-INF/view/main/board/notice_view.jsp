<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/board/notice_view.css" rel="stylesheet">
<!-- js파일 -->
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/main/board/notice.js"></script>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="notice_view_wrap">
        <div>
            <div class="notice_view_user">
                <p>작성자 : 방수현</p>
                <p>작성시간 : <fmt:formatDate value="${noticeDto.noticeRdate}" pattern="yyyy년MM월dd일 hh:mm"/></p>
                <c:if test="${not empty noticeDto.noticeUdate}">
                    <p>수정시간 : <fmt:formatDate value="${noticeDto.noticeUdate}" pattern="yyyy년MM월dd일 hh:mm"/></p>
                </c:if>
                <p>조회수 : ${noticeDto.noticeHits}</p>
            </div>
            <div class="notice_view_title">
                <h2><span>${noticeDto.noticeId}.</span>${noticeDto.noticeTitle}</h2>
                <button type="submit" onclick="location.href='/board/noticeList'">목록으로</button>
            </div>
        </div>
        <div class="notice_view_text">
            <textarea name="" id="" cols="30" rows="10" disabled>${noticeDto.noticeContent}</textarea>
            <div class="form-group">
                <c:choose>
                    <c:when test="${not empty noticeDto.noticeFilepath}">
                        <img src="${noticeDto.noticeFilepath}" width="200" height="200"/>
                    </c:when>
                </c:choose>
            </div>
        </div>
        <div class="notice_view_btn">
            <button type="submit" onclick="location.href='/board/updateNotice/${noticeDto.noticeId}'">수정</button>
            <button id="deleteBtn" type="button" onclick="confirmDelete(${noticeDto.noticeId})">삭제</button>
        </div>
        <div class="notice_view_comments">
            <div class="notice_view_title">
                <h2>댓글</h2>
            </div>
            <div class="notice_view_text2">
                <form action="">
                    <input type="text">
                    <button type="submit">등록하기</button>
                </form>
            </div>
        </div>

        <!-- 동적 생성-->
        <div class="notice_comments">
            <div class="user_comment_img_wrap">
                <a href="" class="user_comment_img"><i class="fa-solid fa-user"></i></a>
            </div>
            <div class="user_comment_info">
                <div>
                    <p>방수현</p>
                    <p>2023-10-02 12:34</p>
                    <p>여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용</p>
                </div>
                <div class="user_comment_info_btn">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>
        </div>
        <div class="notice_comments">
            <div class="user_comment_img_wrap">
                <a href="" class="user_comment_img"><i class="fa-solid fa-user"></i></a>
            </div>
            <div class="user_comment_info">
                <div>
                    <p>방수현</p>
                    <p>2023-10-02 12:34</p>
                    <p>여기가 댓글 내용</p>
                </div>
                <div class="user_comment_info_btn">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>
        </div>
        <div class="notice_comments">
            <div class="user_comment_img_wrap">
                <a href="" class="user_comment_img"><i class="fa-solid fa-user"></i></a>
            </div>
            <div class="user_comment_info">
                <div>
                    <p>방수현</p>
                    <p>2023-10-02 12:34</p>
                    <p>여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용여기가 댓글 내용</p>
                </div>
                <div class="user_comment_info_btn">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>
        </div>
        <div class="notice_comments">
            <div class="user_comment_img_wrap">
                <a href="" class="user_comment_img"><i class="fa-solid fa-user"></i></a>
            </div>
            <div class="user_comment_info">
                <div>
                    <p>방수현</p>
                    <p>2023-10-02 12:34</p>
                    <p>여기가 댓글 내용</p>
                </div>
                <div class="user_comment_info_btn">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>
        </div>
        <div class="notice_comments">
            <div class="user_comment_img_wrap">
                <a href="" class="user_comment_img"><i class="fa-solid fa-user"></i></a>
            </div>
            <div class="user_comment_info">
                <div>
                    <p>방수현</p>
                    <p>2023-10-02 12:34</p>
                    <p>여기가 댓글 내용</p>
                </div>
                <div class="user_comment_info_btn">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>
        </div>
        <div class="notice_comments">
            <div class="user_comment_img_wrap">
                <a href="" class="user_comment_img"><i class="fa-solid fa-user"></i></a>
            </div>
            <div class="user_comment_info">
                <div>
                    <p>방수현</p>
                    <p>2023-10-02 12:34</p>
                    <p>여기가 댓글 내용</p>
                </div>
                <div class="user_comment_info_btn">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>