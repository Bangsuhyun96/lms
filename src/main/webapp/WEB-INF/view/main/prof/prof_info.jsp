<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_info.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
    <div class="myinfo_wrap">
        <div class="myinfo_title">
            <p>나의 정보 조회하기</p>
        </div>
        <div class="myinfo_info">
            <div class="myinfo_img">
                <img src="<%= request.getContextPath() %>/resources/image/pro.jpg" alt="">
                <div>
                    <button>선택하기</button>
                </div>

            </div>
            <div class="myinfo_table">
                <table>
                    <tbody>
                    <tr><th><p>성명</p></th><td><input type="text" value="${profInfo.name}" maxlength="50" disabled></td></tr>
                    <fmt:formatDate value="${profInfo.birthDate}" pattern="yyyy-MM-dd" var="formattedDate" />
                    <tr><th><p>생년월일</p></th><td><input type="text" value="${formattedDate}" maxlength="50" disabled></td></tr>
                    <tr><th><p>성별</p></th><td><input type="text" value="${profInfo.gender}" maxlength="50" disabled></td></tr>
                    <tr><th><p>이메일</p></th><td><input type="text" value="${profInfo.email}" maxlength="50" disabled></td></tr>
                    <tr><th><p>주소</p></th><td><input type="text" value="${profInfo.address}, ${profInfo.addressDetail}" maxlength="50" disabled></td></tr>
                    <tr><th><p>연락처</p></th><td><input type="text" value="${profInfo.phoneNo}" maxlength="50" disabled></td></tr>
                    <tr><th><p>계좌번호</p></th><td><input type="text" value="${profInfo.account}" maxlength="50" disabled></td></tr>
                    <tr><th><p>예금주명</p></th><td><input type="text" value="${profInfo.accountName}" maxlength="50" disabled></td></tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="myinfo_modify">
            <button type="submit" onclick="location.href='/prof/info/update'" >수정하기</button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>