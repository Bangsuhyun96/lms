<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/admin_schedule.css" rel="stylesheet">
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
            <button class="btn_pos" id="SearchButton">조회</button>
            <button class="btn-default" disabled>신규</button>
            <button class="btn-default" disabled>저장</button>
            <button class="btn-default" disabled>삭제</button>
        </div>
        <!--  선택 테이블 구조 1 -->
        <div class="select_table_1">
            <table>
                <tbody>
                <tr>
                    <td><label>수업년도/학기</label></td>
                    <td>
                        <div class="select_box select_2">
                            <select name="curriculumYear" class="select">
                                <option value="">(전체)</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td>
                        <div class="select_box select_2">
                            <select name="curriculumName" class="select">
                                <option value="">(전체)</option>
                                <option value="자바(JAVA)기반 풀스택 개발자 취업과정">자바(JAVA)기반 풀스택 개발자 취업과정</option>
                                <option value="[IT코칭] JAVA로 잡는 실전 프로그래밍">[IT코칭] JAVA로 잡는 실전 프로그래밍</option>
                                <option value="자바(JAVA)프로그래밍(JSP)">자바(JAVA)프로그래밍(JSP)</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
<%--                    <td><label>과정구분</label></td>--%>
<%--                    <td>--%>
<%--                        <div class="select_box">--%>
<%--                            <select name="" class="select">--%>
<%--                                <option value=" ">(전체)</option>--%>
<%--                                <option value="">봄학기</option>--%>
<%--                                <option value="">여름학기</option>--%>
<%--                                <option value="">가을학기</option>--%>
<%--                                <option value="">겨울학기</option>--%>
<%--                            </select>--%>
<%--                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>--%>
<%--                        </div>--%>
<%--                    </td>--%>
<%--                    <td><label>기수코드</label></td>--%>
<%--                    <td>--%>
<%--                        <div class="select_box">--%>
<%--                            <select name="" class="select">--%>
<%--                                <option value=" ">(전체)</option>--%>
<%--                                <option value="">봄학기</option>--%>
<%--                                <option value="">여름학기</option>--%>
<%--                                <option value="">가을학기</option>--%>
<%--                                <option value="">겨울학기</option>--%>
<%--                            </select>--%>
<%--                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>--%>
<%--                        </div>--%>
<%--                    </td>--%>
                </tr>
                </tbody>
            </table>
        </div>
        <!-- 검색 건수 -->
        <c:set var="count" value="0" />
        <c:forEach var="item" items="${dto}">
            <c:set var="count" value="${count + 1}" />
        </c:forEach>
        <!--  타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>수업일정정보&nbsp;</span>
                검색결과:<span id="countValue">${count}</span>건
            </p>
        </div>
        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                    <!-- 헤더 -->
                    <tr>
                        <th>수업년도</th>
                        <th>과정명</th>
                        <th>일정종류</th>
                        <th>시작일</th>
                        <th>종료일</th>
                    </tr>
                    <!-- 헤더 끝-->
                    <!--  출력  -->
                    <c:forEach items="${dto}" var="item">
                    <tr>
                        <td id="curriculumYear">${item.curriculumYear}</td>
                        <td id="curriculumName">${item.curriculumName}</td>
                        <td id="certainType">${item.certainType}</td>
                        <td id="startDate"><fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td id="endDate"><fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                    </c:forEach>
                    <!--  출력 끝 -->
                </tbody>
            </table>
        </div>

    </div>
</div>
</body>
<script>
    // 조회하기
</script>
</html>