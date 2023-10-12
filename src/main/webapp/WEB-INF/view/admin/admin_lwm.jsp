<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/admin_lwm.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/admin/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/admin/common/header.jsp" %>
<div class="wrap">
    <%@ include file="/WEB-INF/view/admin/common/aside.jsp" %>

    <!-- 테테스스트트 -->
    <form action="/admin/lwm/search" method="get">
        <select name="lectureYear" class="select">
            <option value=" ">전체</option>
            <option value="2023">2023</option>
            <option value="2024">2024</option>
        </select>
        <select name="curriculumSemester" class="select">
            <option value=" ">전체</option>
            <option value="1">1학기</option>
            <option value="2">2학기</option>
        </select>
        <button type="submit" class="btn_pos">조회</button>
    </form>
    <!-- 테테스스트트 끝-->

    <div class="main_contents_right">
        <!-- 상단 버튼 구조 1 -->
        <div class="div_common_button">
            <button class="btn_pos">조회</button>
            <button class="btn-default" id="addRowButton">신규</button>
            <button class="btn-default">저장</button>
            <button class="btn-default">삭제</button>
        </div>
        <!--  선택 테이블 구조 1 -->
        <div class="select_table_1">
            <table>
                <tbody>
                <tr>
                    <td><label>수업년도/학기</label></td>
                    <td>
                        <div class="select_box">
                            <select name="lectureYear" class="select">
                                <option value="">(전체)</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td>
                        <div class="select_box">
                            <select name="curriculumSemester" class="select">
                                <option value="">(전체)</option>
                                <option value="1">1학기</option>
                                <option value="2">2학기</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">정규과정</option>
                                <option value="">야간과정</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--  타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>수업주차정보&nbsp;</span>검색결과:0000건</p>
        </div>
        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table id="data_table">
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th class="w40"><input type="checkbox"></th>
                    <th>수업년도</th>
                    <th>학기</th>
                    <th>과정구분</th>
                    <th>강의주</th>
                    <th>시작일</th>
                    <th>종료일</th>
                    <th>보강주</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <c:forEach items="${lwm}" var="item">
                    <tr>
                        <td class="w40"><input type="checkbox"></td>
                        <td>${item.lectureYear}</td>
                        <td>${item.curriculumSemester}</td>
                        <td>${item.curriculumDivision}</td>
                        <td>${item.lectureWeek}주차</td>
                        <td><fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${item.makeupWeek == 1}">
                                    <input type="checkbox" checked="checked">
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox">
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                <!-- 출력 끝-->
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    // JavaScript로 신규 버튼 클릭 이벤트 처리
    document.getElementById("addRowButton").addEventListener("click", function () {
        const table = document.getElementById("data_table").getElementsByTagName('tbody')[0];
        const newRow = table.insertRow(table.rows.length);
        const cellCount = table.rows[0].cells.length;

        for (let i = 0; i < cellCount; i++) {
            const newCell = newRow.insertCell(i);
            if (i === cellCount - 1) {
                newCell.innerHTML = '<input type="checkbox">';
            } else {
                newCell.innerHTML = '<input type="text">';
            }
        }

        // 신규 행 추가 후, 첫 번째 입력란에 포커스 설정
        newRow.getElementsByTagName("input")[0].focus();
    });
</script>
</html>