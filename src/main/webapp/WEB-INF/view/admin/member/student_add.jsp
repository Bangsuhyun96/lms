<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/common/user_add.css" rel="stylesheet">

<!-- 여기서 CSS 추가하자 -->
<!-- 여기서 CSS 추가하자 -->
<!-- 여기서 CSS 추가하자 -->
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/admin/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/admin/common/header.jsp" %>
<div class="wrap">
    <%@ include file="/WEB-INF/view/admin/common/aside.jsp" %>

        <div class="main_contents_right">
            <form action="/admin/student/add" method="post">
            <!-- 상단 버튼 구조 1 -->
            <div class="div_common_button">
                <button class="btn-default" type="submit">저장</button>
                <a href="/admin/member/management"><button class="btn-default" disabled="" >닫기</button></a>
            </div>

            <!--  타이틀 2  -->
            <div class="div_title_2">
                <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>학생정보저장&nbsp;</span></p>
            </div>
            <!--  선택 테이블 구조 1 -->
            <div class="select_table_1">
                <table>
                    <tbody>
                    <tr>
                        <td><label>학번</label></td>
                        <td>
                            <div class="select_box">
                                <input type="text" name="studentId" class="select" value="${studentId}">

                            </div>
                        </td>
                        <td><label>성명</label></td>
                        <td>
                            <div class="select_box">
                                <input type="text" name="name" class="select" value="${user.name}">

                            </div>
                        </td>
                        <td><label>생년월일</label></td>
                        <td>
                            <div class="select_box">
                                <input type="date" name="birthDate" class="select" required>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><label>성별</label></td>
                        <td>
                            <div class="select_box">
                                <select name="gender" class="select" required>
                                    <option value="남성">남성</option>
                                    <option value="여성">여성</option>

                                </select>
                                <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                            </div>
                        </td>
                        <td><label>주소</label></td>
                        <td>
                            <div class="select_box">
                                <input type="text" name="address" class="select">

                            </div>
                        </td>
                        <td><label>상세주소</label></td>
                        <td>
                            <div class="select_box">
                                <input type="text" name="addressDetail" class="select">

                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <!--  선택 테이블 구조 1 -->
            <div class="select_table_1">
                <table>
                    <tbody>
                    <tr>
                        <td><label>우편번호</label></td>
                        <td>
                            <div class="select_box">
                                <input type="text" name="zipCode" class="select">

                            </div>
                        </td>
                        <td><label>연락처</label></td>
                        <td>
                            <div class="select_box">
                                <input type="text" name="phoneNo" class="select" required>

                            </div>
                        </td>
                        <td><label>이메일</label></td>
                        <td>
                            <div class="select_box">
                                <input type="email" name="email" class="select" value="${user.loginId}" >

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><label>입학년도</label></td>
                        <td>
                            <div class="select_box">
                                <input type="text" name="entranceYear" class="select">

                            </div>
                        </td>
                        <td><label>상태구분</label></td>
                        <td>
                            <div class="select_box">
                                <input type="text" name="studentStatus" class="select">

                            </div>
                        </td>
                        <td><label>유저ID</label></td>
                        <td>
                            <div class="select_box">
                                <input type="text" name="userId" class="select" value="${user.userId}">

                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- 여기서 만들쟈-->
            <!-- 여기서 만들쟈-->
            <!-- 여기서 만들쟈-->
            <!-- 여기서 만들쟈-->
            <!-- 여기서 만들쟈-->
            <!-- 여기서 만들쟈-->
            <!-- 여기서 만들쟈-->
            </form>
        </div>

</div>
</body>
</html>