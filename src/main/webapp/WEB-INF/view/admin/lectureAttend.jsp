<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/lectureAttend.css" rel="stylesheet">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/admin/lectureAttend/lectureAttend.js"></script>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/admin/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/admin/common/header.jsp" %>
<div class="wrap">
    <%@ include file="/WEB-INF/view/admin/common/aside.jsp" %>
    <div class="main_contents_right">
        <!-- 상단 버튼 구조 1 -->
        <form method="GET" action="/admin/lectureAttend/search">
            <div class="div_common_button">
                <button class="btn_pos">조회</button>
            </div>
            <!--  선택 테이블 구조 1 -->
            <div class="select_table_1">
                <table>
                    <tbody>
                    <tr>
                        <td><label>수업년도/학기</label></td>
                        <td>
                            <div class="select_box1">
                                <select name="lectureYear" id="lectureValue" class="select1">
                                    <option value="">(전체)</option>
                                    <option value="2023">2023</option>
                                    <option value="2024">2024</option>
                                </select>
                            </div>
                        </td>
                        <td class="right_element"><label>월구분</label></td>
                        <td class="right_element">
                            <div class="select_box">
                                <select name="month" id="month" class="select">
                                    <option value="0">(전체)</option>
                                    <option value="1">1월</option>
                                    <option value="2">2월</option>
                                    <option value="3">3월</option>
                                    <option value="4">4월</option>
                                    <option value="5">5월</option>
                                    <option value="6">6월</option>
                                    <option value="7">7월</option>
                                    <option value="8">8월</option>
                                    <option value="9">9월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
                                <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><label>교수번호/명</label></td>
                        <td>
                            <div class="input_box">
                                <input name="name" id="name" type="text" class="input">
                            </div>
                        </td>
                        <td class="right_element"><label>개설과목명</label></td>
                        <td class="right_element">
                            <div class="input_box">
                                <input name="lectureName" id="lecture_name" type="text" class="input">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </form>


        <!-- 검색 건수 -->
        <c:set var="count" value="0" />
        <c:forEach var="item" items="${lectureDto}">
            <tr>
                <c:set var="count" value="${count + 1}" />
            </tr>
        </c:forEach>

        <!--  타이틀 2  -->
        <div class="div_title_2">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>강의출강관리&nbsp;</span></p>
            <p>검색 결과 : ${count} 건</p>
        </div>

        <form method="POST" action="/admin/lectureAttend/update">
            <div class="div_common_button">
                <button class="btn-default" id="saveBtn">저장</button>
            </div>
            <!--  출력 테이블 구조 1 -->
            <div class="select_view_table_1">
                <table>
                    <tbody>
                    <!-- 헤더 -->
                        <tr>
                            <th id="lecutreID">개설과정번호</th>
                            <th id="lectureName">개설과정명</th>
                            <th id="lectDate">수업일자</th>
                            <th id="profID">교수번호</th>
                            <th id="profName">교수명</th>
                            <th id="lectureHour">강의시수</th>
                            <th id="lectureStatus">강의진행</th>
                            <th id="paymentYM">지급년월</th>
                        </tr>
                        <!-- 헤더 끝-->

                        <!--  출력  -->
                        <c:forEach var="item" items="${lectureDto}">
                            <tr>
                                <td>${item.lectureId}</td>
                                <td>${item.lectureName}</td>
                                <td>${item.startDate} ~ ${item.endDate}</td>
                                <td>${item.profId}</td>
                                <td>${item.name}</td>
                                <td>${item.hours}</td>
                                <td>
                                    <input type="hidden" value="${item.lectureId}" name="lectureId" />
                                    <div class="table_select_box">
                                        <select name="progress" class="table_select">
                                            <option value="">${item.progress}</option>
                                            <option value="진행중">진행중</option>
                                            <option value="미진행">미진행</option>
                                            <option value="진행완료">진행완료</option>

                                        </select>
                                        <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                                    </div>
                                </td>
                                <td>
                                    <input name="feeDate" id="feeDate" type="text" class="input" value="${item.feeDate}">
                                </td>
                            </tr>
                        </c:forEach>

                    <!-- 출력 끝-->
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</div>
</body>
</html>