<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/board/qna_view.css" rel="stylesheet">
<!-- js파일 -->
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/main/board/qna.js"></script>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="qna_view_wrap">
        <div>
            <div class="qna_view_user">
                <input type="hidden" id="qna-qnaNo" value="${qnaDto.qnaId}">
                <p>작성자 : 방수현</p>
                <p>작성시간 : <fmt:formatDate value="${qnaDto.qnaRdate}" pattern="yyyy년MM월dd일 hh:mm"/></p>
                <c:if test="${not empty qnaDto.qnaUdate}">
                    <p>수정시간 : <fmt:formatDate value="${qnaDto.qnaUdate}" pattern="yyyy년MM월dd일 hh:mm"/></p>
                </c:if>
                <p>조회수 : ${qnaDto.qnaHits}</p>
            </div>
            <div class="qna_view_title">
                <h2><span>${qnaDto.qnaId}.</span>${qnaDto.qnaTitle}</h2>
                <button type="submit" onclick="location.href='/board/qnaList'">목록으로</button>
            </div>
        </div>
        <div class="qna_view_text">
            <textarea name="" id="" cols="30" rows="10" disabled>${qnaDto.qnaContent}</textarea>
        </div>
        <div class="qna_view_btn">
            <button type="submit" onclick="location.href='/board/updateQna/${qnaDto.qnaId}'">수정</button>
            <button id="deleteBtn" type="button" onclick="confirmDelete(${qnaDto.qnaId})">삭제</button>

        </div>
        <div class="qna_view_comments">
            <div class="qna_view_title">
                <h2>댓글</h2>
            </div>
            <div class="qna_view_text2">
                <form action="">
                    <input type="text">
                    <button type="submit">등록하기</button>
                </form>
            </div>
        </div>

        <!-- 동적 생성-->
        <div class="qna_comments">
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
        <div class="qna_comments">
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
        <div class="qna_comments">
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
        <div class="qna_comments">
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
        <div class="qna_comments">
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
        <div class="qna_comments">
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