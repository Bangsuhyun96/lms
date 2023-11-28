<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/common/admin_lecture_apply.css" rel="stylesheet">

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
            <button class="btn_pos">조회</button>
            <button class="btn-default">신규</button>
            <button class="btn-default">저장</button>
            <button class="btn-default">삭제</button>
            <button class="btn-default" disabled="">선택</button>
            <button class="btn-default" disabled="" >닫기</button>
        </div>


        <!--  선택 테이블 구조 2 -->
        <div class="select_table_2">
            <table>
                <tbody>
                <tr>
                    <!-- 테이블 구조 2 : 텍스트 박스 -->
                    <td><label>과목명</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="searchInput"/>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!--  타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>강의정보&nbsp;</span>검색결과:0000건</p>
        </div>

        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th>강의번호</th>
                    <th>강의이름</th>
                    <th>강의년도</th>
                    <th>강사이름</th>
                    <th>수업요일</th>
                    <th>수업교시</th>
                    <th>강의실</th>

                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td>1</td>
                    <td>자바</td>
                    <td>2023</td>
                    <td>홍길동</td>
                    <td>화,수</td>
                    <td>1,2,3</td>
                    <td>101호</td>

                </tr>
                <c:forEach var="item" items="${infoDto}">
                    <tr>
                        <td>${item.lectureId}</td>
                        <td>${item.lectureName}</td>
                        <td>${item.lectureYear}</td>
                        <td>${item.name}</td>
                        <td>${item.lectureDay}</td>
                        <td>${item.lectureTime}</td>
                        <td>${item.classroom}</td>

                    </tr>
                </c:forEach>

                <!-- 출력 끝-->
                </tbody>
            </table>
        </div>

        <!--  타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>학생정보&nbsp;</span>검색결과:0000건</p>
        </div>

        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th>학번</th>
                    <th>성명</th>
                    <th>생년월일</th>
                    <th>입학년도</th>

                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>

                    <td>내용</td>
                    <td>내영</td>
                    <td>내용</td>
                    <td>내용</td>

                </tr>
                <!-- 출력 끝-->
                </tbody>
            </table>
        </div>
        <!-- 여기서 만들쟈-->

    </div>
</div>
</body>
</html>