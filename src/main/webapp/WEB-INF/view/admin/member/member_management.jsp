<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/common/admin_member_management.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/admin/member/member_management.js"></script>

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
        <!-- 상단 버튼 구조 1 -->
        <div class="div_common_button">
            <button class="btn_pos" id="searchButton">조회</button>
            <button class="btn-default" id="newButton">신규</button>
            <button class="btn-default" id="saveButton">저장</button>
            <button class="btn-default" id="deleteButton">삭제</button>
        </div>

        <!--  선택 테이블 구조 2 -->
        <div class="select_table_2">
            <table>
                <tbody>
                <tr>
                    <!-- 테이블 구조 2 : 텍스트 박스 -->
                    <td><label>이름</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="searchInput"/>
                        </div>
                    </td>

                    <!--  선택 테이블 구조 1 -->

                    <td><label>구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
                                <option value="전체" >(전체)</option>
                                <option value="학생">학생</option>
                                <option value="교수">교수</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table id="dataTable">
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th><input type="checkbox"></th>
                    <th>회원관리번호</th>
                    <th>구분</th>
                    <th>이름</th>
                    <th>로그인ID</th>
                    <th>비밀번호변경필요</th>
                    <th>암호오류횟수</th>
                    <th>최근접속일자</th>
                    <th>등록일자</th>
                </tr>
                <!-- 헤더 끝-->
                <c:forEach var="item" items="${member}">
                    <tr>
                        <td><input type="checkbox" class="checkbox" name="selectedItems"></td>
                        <td><a href="/admin/find/member?userId=${item.userId}&userType=${item.userType}">${item.userId}</a></td>
                        <td>${item.userType}</td>
                        <td>${item.name}</td>
                        <td>${item.loginId}</td>
                        <td>${item.changePwYn}</td>
                        <td>${item.pwErrCount}</td>
                        <td>${item.lastLoginDate}</td>
                        <td>${item.registDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>


</div>
</body>
</html>