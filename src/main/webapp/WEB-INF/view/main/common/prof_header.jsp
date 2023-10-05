<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<link href="<%=request.getContextPath()%>/resources/css/main/common/prof_header.css" rel="stylesheet">
<header>
    <div class="header_wrap">
        <div class="header_left">
            <a href="/prof"><img src="<%=request.getContextPath()%>/resources/image/logo_bang_default.png" alt=""></a>
        </div>
        <div class="header_right">
            <div>
                <ul class="header_menu">
                    <li id="menu_item_1">
                        <p>나의정보</p>
                        <ul class="header_childmenu">
                            <li><a href="/prof/info">나의 정보 조회</a></li>
                            <li><a href="/prof/history">강의 이력</a></li>
                            <li><a href="/prof/fee">강의사례비</a></li>
                        </ul>
                    </li>
                    <li id="menu_item_2">
                        <p>수업정보</p>
                        <ul class="header_childmenu">
                            <li><a href="/prof/schedule">나의 강의실</a></li>
                            <li><a href="/prof/assignment">과제 관리</a></li>
                        </ul>
                    </li>
                    <li id="menu_item_3">
                        <p>커뮤니티</p>
                        <ul class="header_childmenu">
                            <li><a href="/board/notice">공지사항</a></li>
                            <li><a href="/board/free">자유게시판</a></li>
                            <li><a href="/board/qna">Q&A</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="header_info">
                <div class="header_info_left">
                    <a href="" class="user_img"><i class="fa-solid fa-user"></i></a>
                    <a href=""><p>교수</p></a>
                </div>
                <div class="header_info_right">
                    <button class="header_logout_btn">로그아웃</button>
                </div>
            </div>

        </div>
    </div>
</header>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main/header.js"></script>