<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <p>2023-10-02 09:07</p>
                <p>조회수 : 34034</p>
            </div>
            <div class="free_view_title">
                <h2><span>1.</span>글쓰기싫당</h2>
                <button type="submit" onclick="location.href='/board/free'">목록으로</button>
            </div>
        </div>
        <div class="free_view_text">
            <textarea name="" id="" cols="30" rows="10" disabled></textarea>
        </div>
        <div class="free_view_btn">
            <button type="submit">수정</button>
            <button type="submit" onclick="location.href='/board/free'">삭제</button>
        </div>
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