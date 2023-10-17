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

<%--    <!-- 테테스스트트 -->--%>
<%--    <form action="/admin/lwm/search" method="get">--%>
<%--        <select name="lectureYear" class="select">--%>
<%--            <option value=" ">전체</option>--%>
<%--            <option value="2023">2023</option>--%>
<%--            <option value="2024">2024</option>--%>
<%--        </select>--%>
<%--        <select name="curriculumSemester" class="select">--%>
<%--            <option value=" ">전체</option>--%>
<%--            <option value="1">1학기</option>--%>
<%--            <option value="2">2학기</option>--%>
<%--        </select>--%>
<%--        <button type="submit" class="btn_pos">조회</button>--%>
<%--    </form>--%>
<%--    <!-- 테테스스트트 끝-->--%>

    <div class="main_contents_right">
        <!-- 상단 버튼 구조 1 -->
        <div class="div_common_button">
            <form action="/admin/lwm/search"><button class="btn_pos">조회</button></form>
            <button class="btn-default" id="addRowButton">신규</button>
            <form action="/admin/lwm/add"><button class="btn-default" id="saveButton">저장</button></form>
           <button class="btn-default" id="deleteButton" type="submit">삭제</button>
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
                        <td class="w40"><input type="checkbox" class="rowCheckbox"></td>
                        <td><input type="hidden" name="weekId" value="${item.weekId}">${item.lectureYear}</td>
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

        const fieldNames = ["lectureYear", "curriculumSemester", "curriculumDivision", "lectureWeek", "startDate", "endDate", "endDate"]; // 두 번 반복되는 "endDate"는 수정하실 필요가 있을 것 같습니다.

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

    // 데이터 저장하기
    // document.querySelector("button#saveButton").addEventListener("click", function () {
    //     const selectedRow = document.querySelector("input[type='checkbox']:checked");
    //
    //     if (selectedRow) {
    //         const makeupWeekCheckbox = selectedRow.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.querySelector("input[type='checkbox']");
    //         const makeupWeekValue = makeupWeekCheckbox.checked ? 1 : 0;
    //         const rowData = {
    //             lectureYear: selectedRow.parentElement.nextElementSibling.textContent,
    //             curriculumSemester: selectedRow.parentElement.nextElementSibling.nextElementSibling.textContent,
    //             curriculumDivision: selectedRow.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.textContent,
    //             lectureWeek: selectedRow.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent,
    //             startDate: selectedRow.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent,
    //             endDate: selectedRow.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent,
    //             makeupWeek: makeupWeekValue
    //         };
    //         $.ajax({
    //             url: "/admin/lwm/add", // 서버의 저장 엔드포인트 URL
    //             type: "POST", // POST 방식으로 데이터 전송
    //             data: JSON.stringify(rowData), // JSON 형식으로 데이터 전송
    //             contentType: "application/json; charset=utf-8", // 데이터 형식 설정
    //             success: function (response) {
    //                 // 서버로부터의 응답을 처리
    //                 console.log("저장 성공");
    //                 console.log(rowData);
    //             },
    //             error: function (error) {
    //                 // 에러 처리
    //                 console.error("저장 실패: " + error);
    //             }
    //         });
    //     } else {
    //         alert("선택된 행이 없습니다. 저장할 행을 선택하세요.");
    //     }
    // });

    // 하나의 데이터 삭제하기
    // document.querySelector("button#deleteButton").addEventListener("click", function () {
    //     const selectedRow = document.querySelector("input[type='checkbox']:checked");
    //
    //     if (selectedRow) {
    //         // 선택된 행의 weekId 가져오기
    //         const weekId = selectedRow.parentElement.parentElement.querySelector("[name='weekId']").value;
    //
    //         // 서버로 전송할 데이터 객체 생성
    //         const rowData = {
    //             weekId: weekId
    //         };
    //
    //         $.ajax({
    //             url: "/admin/lwm/delete", // 서버의 삭제 엔드포인트 URL
    //             type: "POST", // POST 방식으로 데이터 삭제 요청 전송
    //             data: JSON.stringify(rowData), // JSON 형식으로 데이터 전송
    //             contentType: "application/json; charset=utf-8", // 데이터 형식 설정
    //             success: function (response) {
    //                 // 서버로부터의 응답을 처리
    //                 console.log("삭제 성공");
    //                 console.log(rowData);
    //                 // location.reload(); // 삭제 시 페이지 리로드
    //             },
    //             error: function (error) {
    //                 // 에러 처리
    //                 console.error("삭제 실패: " + error);
    //             }
    //         });
    //     } else {
    //         alert("선택된 행이 없습니다. 삭제할 행을 선택하세요.");
    //     }
    // });

    // 전체 데이터 삭제하기
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

    // search 실행
    document.querySelector("button.btn_pos").addEventListener("click", function () {
        // 선택된 수업년도, 학기 값을 가져오기
        const lectureYear = document.querySelector("select[name='lectureYear']").value;
        const curriculumSemester = document.querySelector("select[name='curriculumSemester']").value;

        // GET 요청을 생성하고 선택된 값들을 매개변수로 추가
        const url = `/admin/lwm/search?lectureYear=${lectureYear}&curriculumSemester=${curriculumSemester}`;

        // 페이지를 이동하여 조회를 실행
        window.location.href = url;
    });

</script>
</html>