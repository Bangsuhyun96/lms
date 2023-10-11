<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/board/free_view.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="free_view_wrap">
        <div>
            <div class="free_view_user">
                <p>작성자 : 방수현</p>
                <p>작성시간 : <fmt:formatDate value="${freeBoardDto.freeRdate}" pattern="yyyy년MM월dd일 hh:mm"/></p>
                <c:if test="${not empty freeBoardDto.freeUdate}">
                    <p>수정시간 : <fmt:formatDate value="${freeBoardDto.freeUdate}" pattern="yyyy년MM월dd일 hh:mm"/></p>
                </c:if>
                <p>조회수 : ${freeBoardDto.freeHits}</p>

            </div>
            <div class="free_view_title">
                <h2><span>${freeBoardDto.freeId}.</span>${freeBoardDto.freeTitle}</h2>
                <button type="submit" onclick="location.href='/freeList'">목록으로</button>
            </div>
        </div>
        <div class="free_view_text">
            <textarea name="" id="" cols="30" rows="10" disabled>${freeBoardDto.freeContent}</textarea>
            <div class="form-group">
                <c:choose>
                    <c:when test="${not empty freeBoardDto.freeFilepath}">
                        <img src="${freeBoardDto.freeFilepath}" width="200" height="200" />
                    </c:when>
                </c:choose>
            </div>
        </div>
        <div class="free_view_btn">
            <button type="submit" onclick="location.href='/free/update/${freeBoardDto.freeId}'">수정</button>
            <button type="submit" onclick="confirmDelete(${freeBoardDto.freeId})">삭제</button>
        </div>
        <!-- 삭제 버튼을 눌렀을 때 정말 삭제할 거냐고 묻는 script -->
        <script>

        </script>
        <div class="free_view_comments">
            <div class="free_view_title">
                <h2>댓글</h2>
            </div>
            <div class="free_view_text2">
                <form action="">
                    <input type="text">
                    <button type="submit">등록하기</button>
                </form>
            </div>
        </div>

        <!-- 동적 생성-->
        <div class="free_comments">
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
        <div class="free_comments">
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
        <div class="free_comments">
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
        <div class="free_comments">
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
        <div class="free_comments">
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
        <div class="free_comments">
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