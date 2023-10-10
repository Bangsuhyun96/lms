<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<link href="<%=request.getContextPath()%>/resources/css/main/common/header.css" rel="stylesheet">
<header>
    <div class="header_wrap">
        <div class="header_left">
            <a href="/main"><img src="<%=request.getContextPath()%>/resources/image/logo_bang_default.png" alt=""></a>
        </div>
        <div class="header_right">
            <div>
                <ul class="header_menu">
                    <li id="menu_item_1">
                        <p>나의정보</p>
                        <ul class="header_childmenu">
                            <li><a href="/mypage/myinfo">나의 정보 조회</a></li>
                            <li><a href="/mypage/coursehistory">수강 이력</a></li>
                            <li><a href="/mypage/grade">성적 조회</a></li>
                        </ul>
                    </li>
                    <li id="menu_item_2">
                        <p>수업정보</p>
                        <ul class="header_childmenu">
                            <li><a href="/classinfo/myclass">나의 강의실</a></li>
                            <li><a href="/classinfo/assignment">과제제출</a></li>
                            <li><a href="/classinfo/enroll">수강신청</a></li>
                            <li><a href="/classinfo/gradecheck">성적조회</a></li>
                        </ul>
                    </li>
                    <li id="menu_item_3">
                        <p>커뮤니티</p>
                        <ul class="header_childmenu">
                            <li><a href="/board/noticeList">공지사항</a></li>
                            <li><a href="/freeList">자유게시판</a></li>
                            <li><a href="/board/qnaList">Q&A</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="header_info">
                <div class="header_info_left">
                    <a href="" class="user_img"><i class="fa-solid fa-user"></i></a>
                    <a href=""><p>심민아</p></a>
                </div>
                <div class="header_info_right">
                    <button class="header_logout_btn">로그아웃</button>
                </div>
            </div>

        </div>
    </div>
</header>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main/header.js"></script>