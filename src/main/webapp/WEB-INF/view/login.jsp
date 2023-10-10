<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/login.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<% if (request.getParameter("error") != null) { %>
<script type="text/javascript">
    alert("아이디 또는 비밀번호가 일치하지 않습니다");
</script>
<% } %>
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
        <form action="/login" method="post">
            <p>아이디</p>
            <input type="email" id="loginId" name="loginId" placeholder="아이디"
                   value="${cookie.rememberedUsername != null ? cookie.rememberedUsername.value : ''}">
            <p>패스워드</p>
            <input type="password" name="userPw" placeholder="비밀번호">
            <button type="submit" onclick="remeberMe()">로그인</button>
            <div class="id_check">
                <input type="checkbox" id="rememberMe">
                <p>아이디 기억하기</p>
            </div>

        </form>
    </div>
</div>

</body>
</html>