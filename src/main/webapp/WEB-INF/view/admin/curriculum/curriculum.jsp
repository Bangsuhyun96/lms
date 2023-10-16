<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/admin/curriculum/curriculum.js"></script>
<!-- CSS -->
<link href="<%=request.getContextPath()%>/resources/css/admin/curriculum/curriculum.css" rel="stylesheet">
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
            <button class="btn-default">저장</button>
            <button class="btn-default" id="deleteBtn">삭제</button>
        </div>

        <div class="select_table_1">
            <table>
                <tbody>
                <tr>
                    <td><label>과정년도</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="curriculumYear"/>
                        </div>
                    </td>
                    <td><label>교육과정명</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="curriculumName"/>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="div_title_1">
            <p>
                <img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>교육과정&nbsp;</span>
                <!-- 검색 건수 -->
                <c:set var="count" value="0"/>
                <c:forEach var="item" items="${curriculumDto}">
                    <c:set var="count" value="${count + 1}" />
                </c:forEach>
                검색결과 : <c:out value="${count}"/>건
            </p>
        </div>

        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table id="curriculumTable">
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th class="allCheck one"><input type="checkbox" name="agree" id="all"></th>
                    <th>과정년도</th>
                    <th>교육과정명</th>
                    <th>강의주차</th>
                    <th>시작일자</th>
                    <th>종료일자</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <c:forEach items="${curriculumDto}" var="item">
                    <tr>
                        <td class="allCheck"><input type="checkbox" name="agree"></td>
                        <td>${item.curriculumYear}</td>
                        <td>${item.curriculumName}</td>
                        <td>${item.lectureWeek}주차</td>
                        <td><fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
                <!-- 출력 끝-->

                </tbody>
            </table>

            <!-- 페이징 1 -->
            <div class="free_paging">
                <ul>
                    <li><a href="">&lt; 이전</a></li>
                    <li><a href="">1</a></li>
                    <li><a href="">2</a></li>
                    <li><a href="">3</a></li>
                    <li><a href="">4</a></li>
                    <li><a href="">5</a></li>
                    <li><a href="">6</a></li>
                    <li><a href="">7</a></li>
                    <li><a href="">8</a></li>
                    <li><a href="">9</a></li>
                    <li><a href="">10</a></li>
                    <li><a href="">다음 &gt;</a></li>
                </ul>
            </div>
        </div>

        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>교육과정정보&nbsp;</span></p>
        </div>

        <div class="select_view_table_2">
            <table class="tg">
                <thead>
                <tr>
                    <td class="tg-0lax title">과정년도</td>
                    <td class="tg-0lax">
                        <input type="text" class="curriculum_inputBox" id="curriculum_year"/>
                    </td>
                    <td class="tg-0lax title">강의주차</td>
                    <td class="tg-0lax">
                        <input type="text" class="curriculum_inputBox" id="lecture_week"/>
                    </td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="tg-0lax title">교육과정명</td>
                    <td class="tg-0lax" colspan="5">
                        <input type="text" class="curriculum_inputBox" id="curriculum_name"/>
                    </td>
                </tr>
                <tr>
                    <td class="tg-0lax title">수업내용</td>
                    <td class="tg-0lax" colspan="5">
                        <input type="text" class="curriculum_inputBox" id="curriculum_content"/>
                    </td>
                </tr>
                <tr>
                    <td class="tg-0lax title">시작일자</td>
                    <td class="tg-0lax">
                        <input type="text" class="curriculum_inputBox" id="start_date"/>
                    </td>
                    </td>
                    <td class="tg-0lax title">종료일자</td>
                    <td class="tg-0lax" colspan="3">
                        <input type="text" class="curriculum_inputBox" id="end_date">
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

<%--        </br>--%>

<%--        <div class="div_title_1">--%>
<%--            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>수업학기&nbsp;</span>검색결과:00건</p>--%>
<%--        </div>--%>

<%--        <div class="select_view_table_1">--%>
<%--            <table>--%>
<%--                <tbody>--%>
<%--                <!-- 헤더 -->--%>
<%--                <tr>--%>
<%--                    <th>번호</th>--%>
<%--                    <th>수업년도</th>--%>
<%--                    <th>시작학기</th>--%>
<%--                    <th>수강학년</th>--%>
<%--                    <th>강의시작일</th>--%>
<%--                    <th>강의종료일</th>--%>
<%--                </tr>--%>
<%--                <!-- 헤더 끝-->--%>

<%--                <c:forEach items="${curriculumDto}" var="item">--%>
<%--                    <tr>--%>
<%--                        <td>${item.curriculumId}</td>--%>
<%--                        <td>${item.curriculumYear}</td>--%>
<%--&lt;%&ndash;                        <td>${item.curriculumSemester}</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <td>${item.lectureGrade}</td>&ndash;%&gt;--%>
<%--                        <td><fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/></td>--%>
<%--                        <td><fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/></td>--%>
<%--                    </tr>--%>
<%--                </c:forEach>--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--    </div>--%>
</div>
</body>
</html>