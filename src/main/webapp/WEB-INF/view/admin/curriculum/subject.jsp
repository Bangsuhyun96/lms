<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/admin/curriculum/subject.js"></script>

<!-- CSS -->
<link href="<%=request.getContextPath()%>/resources/css/admin/curriculum/subject.css" rel="stylesheet">

<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/admin/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/admin/common/header.jsp" %>
<div class="wrap">
    <%@ include file="/WEB-INF/view/admin/common/aside.jsp" %>
    <div class="main_contents_right">
        <div class="div_common_button">
            <button class="btn_pos" id="searchBtn">조회</button>
            <button class="btn-default" id="insertBtn">신규</button>
            <button class="btn-default" id="saveBtn">저장</button>
            <button class="btn-default" id="deleteBtn">삭제</button>
        </div>

        <div class="select_table_1">
            <table>
                <tbody>
                <tr>
                    <td><label>교과목명</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="subjectName" name="subjectName"/>
                        </div>
                    </td>
                    <td><label>사용여부</label></td>
                    <td>
                        <div class="select_box">
                            <select name="subjectUse" class="select" id="subjectUse">
                                <option value="">(전체)</option>
                                <option value="사용">사용</option>
                                <option value="미사용">미사용</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="div_title_1">
            <p>
                <img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>교과목&nbsp;</span>
                <!-- 검색 건수 -->
                <c:set var="count" value="0"/>
                <c:forEach var="item" items="${subjectDto}">
                    <c:set var="count" value="${count + 1}"/>
                </c:forEach>
                검색결과 : <span id="searchResultCount"><c:out value="${count}"/></span>건
            </p>
        </div>

        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table id="subjectTable">
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th class="allCheck one"><input type="checkbox" name="agree" id="allCheck"></th>
                    <th>교과목명</th>
                    <th>사용여부</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <c:forEach items="${subjectDto}" var="item">
                <tr>
                    <td class="allCheck"><input type="checkbox" name="agree" id="rowAllCheck" value="${item.subjectId}"></td>
                    <td>${item.subjectName}</td>
                    <td>${item.subjectUse}</td>
                    <!-- subjectId는 hidden이기 때문에 class를 줌으로써 js에서 처리 -->
                    <td hidden="hidden" class="subjectId">${item.subjectId}</td>
                </tr>
                </c:forEach>
                <!-- 출력 끝-->
                </tbody>
            </table>
        </div>

        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>교과목정보&nbsp;</span></p>
        </div>

        <div class="select_view_table_2">
            <table class="tg">
                <thead>
                <tr>
                    <td class="tg-0lax title">교과목코드</td>
                    <td class="tg-0lax">
                        <input type="text" class="subject_inputBox" id="subject_id" name="subjectId" disabled/>
                    </td>
                    <td class="tg-0lax title">교과목명</td>
                    <td class="tg-0lax">
                        <input type="text" class="subject_inputBox" id="subject_name" name="subjectName"/>
                    </td>
                    <td class="tg-0lax title">사용여부</td>
                    <td class="tg-0lax">
                        <select class="select" id="subject_use" name="subjectUse">
                            <option value="사용">사용</option>
                            <option value="미사용">미사용</option>
                        </select>
                    </td>
                </tr>
                </thead>
            </table>
        </div>

</div>
</body>
</html>