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
<%--    <form action="/admin/lwm/search" method="get">--%>
<%--        <select name="curriculumYear" class="select">--%>
<%--            <option value="">전체</option>--%>
<%--            <option value="2023">2023</option>--%>
<%--            <option value="2024">2024</option>--%>
<%--        </select>--%>
<%--        <select name="curriculumName" class="select">--%>
<%--            <option value="">전체</option>--%>
<%--            <option value="자바(JAVA)기반 풀스택 개발자 취업과정">자바(JAVA)기반 풀스택 개발자 취업과정</option>--%>
<%--            <option value="자바(JAVA)프로그래밍(JSP)">자바(JAVA)프로그래밍(JSP)</option>--%>
<%--            <option value="[IT코칭] JAVA로 잡는 실전 프로그래밍">[IT코칭] JAVA로 잡는 실전 프로그래밍</option>--%>
<%--        </select>--%>
<%--        <button type="submit" class="btn_pos">조회</button>--%>
<%--    </form>--%>
    <!-- 테테스스트트 끝-->
<%--    <button class="btn_pos" id="SearchButton">조회</button>--%>
    <div class="main_contents_right">
        <!-- 상단 버튼 구조 1 -->
        <div class="div_common_button">
            <button type="submit" class="btn_pos" id="SearchButton">조회</button>
            <button class="btn-default" id="addRowButton">신규</button>
            <button class="btn-default" id="saveButton">저장</button>
            <button class="btn-default" id="deleteButton" type="submit">삭제</button>
        </div>
        <!--  선택 테이블 구조 1 -->
        <div class="select_table_1">
            <table>
                <tbody>
                <tr>
                    <td><label>수업년도</label></td>
                    <td>
                        <div class="select_box">
                            <select name="curriculumYear" class="select">
                                <option value="">(전체)</option>
                                <c:forEach items="${lwm}" var="item" varStatus="loop">
                                    <c:if test="${loop.first || !item.curriculumYear.equals(lwm[loop.index - 1].curriculumYear)}">
                                        <option value="${item.curriculumYear}">${item.curriculumYear}</option>
                                    </c:if>
                                </c:forEach>
                                <%--                                <option value="">전체</option>--%>
                                <%--                                <option value="2023">2023</option>--%>
                                <%--                                <option value="2024">2024</option>--%>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>과정명</label></td>
                    <td>
                        <div class="select_box">
                            <select name="curriculumName" class="select">
                                <option value="">전체</option>
                                <%--                                <option value="자바(JAVA)기반 풀스택 개발자 취업과정">자바(JAVA)기반 풀스택 개발자 취업과정</option>--%>
                                <%--                                <option value="자바(JAVA)프로그래밍(JSP)">자바(JAVA)프로그래밍(JSP)</option>--%>
                                <%--                                <option value="[IT코칭] JAVA로 잡는 실전 프로그래밍">[IT코칭] JAVA로 잡는 실전 프로그래밍</option>--%>
                                <c:forEach items="${lwm}" var="item" varStatus="loop">
                                    <c:if test="${loop.first || !item.curriculumName.equals(lwm[loop.index - 1].curriculumName)}">
                                        <option value="${item.curriculumName}">${item.curriculumName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!-- 검색 건수 -->
        <c:set var="count" value="0" />
        <c:forEach var="item" items="${lwm}">
            <c:set var="count" value="${count + 1}" />
        </c:forEach>
        <!--  타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>수업주차정보&nbsp;</span>
                검색결과:${count}건
            </p>
        </div>

        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table id="data_table">
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th class="w40"><input type="checkbox" id="selectAllCheckbox"></th>
                    <th>수업년도</th>
                    <th>과정명</th>
                    <th>강의주</th>
                    <th>시작일</th>
                    <th>종료일</th>
                    <th>보강주</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <c:forEach items="${lwm}" var="item">
                    <tr>
                        <td class="w40"><input type="checkbox" class="rowCheckbox"></td>
                        <td><input type="hidden" name="weekId" value="${item.weekId}">${item.curriculumYear}</td>
                        <td style="min-width: 300px">${item.curriculumName}</td>
                        <td>${item.lectureWeek}주차</td>
                        <td><fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${item.makeupWeek == N}">
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
    // 체크박스 전체 선택
    document.getElementById("selectAllCheckbox").addEventListener("change", function () {
        const checkboxes = document.querySelectorAll(".rowCheckbox");
        for (const checkbox of checkboxes) {
            checkbox.checked = this.checked;
        }
    });

    // 폼 한줄 추가
    document.getElementById("addRowButton").addEventListener("click", function () {
        const table = document.getElementById("data_table").getElementsByTagName('tbody')[0];
        const newRow = table.insertRow(table.rows.length);
        const cellCount = table.rows[0].cells.length;

        const fieldNames = ["curriculumYear", "curriculumName", "lectureWeek", "startDate", "endDate", "makeupWeek"];

        for (let i = 0; i < cellCount; i++) {
            const newCell = newRow.insertCell(i);
            const input = document.createElement("input");

            if (i === 0) {
                newCell.className = "w40";
                input.type = "checkbox";
            } else {
                input.type = "text";
                input.name = fieldNames[i - 1];
            }

            if (i === 7) {
                const checkboxInput = document.createElement("input");
                checkboxInput.type = "checkbox";
                checkboxInput.name = "makeupWeek";
                newCell.appendChild(checkboxInput);
            } else {
                newCell.appendChild(input);
            }
        }

        // 신규 행 추가 후, 첫 번째 입력란에 포커스 설정
        newRow.getElementsByTagName("input")[1].focus();
    });

    // 선택 데이터 삭제하기
    document.querySelector("button#deleteButton").addEventListener("click", function () {
        const selectedRows = document.querySelectorAll("input.rowCheckbox:checked");
        const weekIds = Array.from(selectedRows).map(row => row.closest("tr").querySelector("[name='weekId']").value);

        $.ajax({
            url: "/admin/lwm/delete",
            type: "POST",
            data: JSON.stringify({ weekIds: weekIds }), // weekIds 배열을 JSON 데이터로 전송
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                console.log("삭제 성공");
                console.log(response);
                location.reload();
            },
            error: function (error) {
                console.error("삭제 실패: " + error);
            }
        });
    });

    // 조회가 안돼
    // document.querySelector("button#SearchButton").addEventListener("click", function () {
    //     // 선택된 값을 가져오기
    //     const selectedCurriculumYear = document.querySelector("select[name='curriculumYear']").value;
    //     const selectedCurriculumName = document.querySelector("select[name='curriculumName']").value;
    //
    //     // GET 요청을 실행
    //     $.ajax({
    //         url: "/admin/lwm/search",
    //         type: "GET",
    //         data: {
    //             curriculumYear: selectedCurriculumYear,
    //             curriculumName: selectedCurriculumName
    //         },
    //         success: function (response) {
    //             console.log("조회 성공");
    //             console.log(selectedCurriculumName);
    //             console.log(selectedCurriculumYear);
    //         },
    //         error: function (error) {
    //             console.error("조회 실패: " + error);
    //             // 에러 처리
    //         }
    //     });
    // });



</script>
</html>