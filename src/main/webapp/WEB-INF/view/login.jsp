<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/login.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<header>
    <div class="header_wrap">
        <div class="header_left">
            <img src="<%=request.getContextPath()%>/resources/image/logo_bang_default.png" alt="">
        </div>

    </div>
</header>
<div class="login_wrap">
    <div class="login_form">
        <h2>로그인</h2>
        <p>아이디</p>
        <input type="text">
        <p>패스워드</p>
        <input type="text">
        <button type="submit">로그인</button>
        <div class="id_check">
            <input type="checkbox">
            <p>아이디 기억하기</p>
        </div>
    </div>
</div>

</body>
</html>