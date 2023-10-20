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
    <div class="main_contents_right">
        <!-- 상단 버튼 구조 1 -->
        <div class="div_common_button">
            <button type="submit" class="btn_pos" id="SearchButton">조회</button>
<%--            <button class="btn-default" id="addRowButton">신규</button>--%>
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
<%--                                <c:forEach items="${lwm}" var="item" varStatus="loop">--%>
<%--                                    <c:if test="${loop.first || !item.curriculumYear.equals(lwm[loop.index - 1].curriculumYear)}">--%>
<%--                                        <option value="${item.curriculumYear}">${item.curriculumYear}</option>--%>
<%--                                    </c:if>--%>
<%--                                </c:forEach>--%>
                                                                <option value="">전체</option>
                                                                <option value="2023">2023</option>
                                                                <option value="2024">2024</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>과정명</label></td>
                    <td>
                        <div class="select_box">
                            <select name="curriculumName" class="select">
                                <option value="">(전체)</option>

                                                                <option value="자바(JAVA)기반 풀스택 개발자 취업과정">자바(JAVA)기반 풀스택 개발자 취업과정</option>
                                                                <option value="자바(JAVA)프로그래밍(JSP)">자바(JAVA)프로그래밍(JSP)</option>
                                                                <option value="[IT코칭] JAVA로 잡는 실전 프로그래밍">[IT코칭] JAVA로 잡는 실전 프로그래밍</option>
<%--                                <c:forEach items="${lwm}" var="item" varStatus="loop">--%>
<%--                                    <c:if test="${loop.first || !item.curriculumName.equals(lwm[loop.index - 1].curriculumName)}">--%>
<%--                                        <option value="${item.curriculumName}">${item.curriculumName}</option>--%>
<%--                                    </c:if>--%>
<%--                                </c:forEach>--%>
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
                검색결과:<span id="countValue">${count}</span>건
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
                        <td class="w200"><input type="hidden" name="weekId" value="${item.weekId}">${item.curriculumYear}</td>
                        <td class="w300">${item.curriculumName}</td>
                        <td class="w200">${item.lectureWeek}주차</td>
                        <td class="w200"><fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td class="w200"><fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/></td>
                        <td class="w40">
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

    // 선택 데이터 삭제하기
    document.querySelector("button#deleteButton").addEventListener("click", function () {
        const selectedRows = document.querySelectorAll("input.rowCheckbox:checked");
        const weekIds = [];

        selectedRows.forEach(row => {
            const weekIdElement = row.closest("tr").querySelector("td[style='display: none;']");
            if (weekIdElement) {
                weekIds.push(weekIdElement.textContent);
            }
        });

        $.ajax({
            url: "/admin/lwm/delete",
            type: "POST",
            data: JSON.stringify({ weekIds: weekIds }), // weekIds 배열을 JSON 데이터로 전송
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                console.log("삭제 성공");
                console.log(weekIds);
                alert('삭제가 완료되었습니다');
                location.reload();
            },
            error: function (error) {
                console.error("삭제 실패: " + error);
            }
        });
    });

    // 조회하기
    document.querySelector("button#SearchButton").addEventListener("click", function () {

        // 선택된 값을 가져오기
        const selectedCurriculumYear = document.querySelector("select[name='curriculumYear']").value;
        const selectedCurriculumName = document.querySelector("select[name='curriculumName']").value;

        // 데이터를 출력할 테이블 선택
        const table = document.getElementById("data_table");
        const tbody = table.querySelector("tbody");

        // tbody를 지워서 기존 데이터 삭제
        // 기존 데이터 행들을 모두 삭제 (헤더는 그대로 남김)
        while (tbody.rows.length > 1) {
            tbody.deleteRow(1);
        }
        // GET 요청을 실행
        $.ajax({
            url: "/admin/lwm/search",
            type: "GET",
            data: {
                curriculumYear: selectedCurriculumYear,
                curriculumName: selectedCurriculumName
            },
            success: function (response) {
                console.log("조회 성공");
                console.log("selectedCurriculumName: " + selectedCurriculumName);
                console.log("selectedCurriculumYear: " + selectedCurriculumYear);

                const curriculumId = response.curriculumId;
                console.log(curriculumId);

                // 데이터를 반복해서 처리
                for (let i = 0; i < response.length; i++) {
                    // 새로운 데이터 행 추가
                    const newRow = tbody.insertRow(-1);

                    // 각 열에 데이터를 추가
                    const selectCell = newRow.insertCell(0);
                    const curriculumYearCell = newRow.insertCell(1);
                    const curriculumNameCell = newRow.insertCell(2);
                    const lectureWeekCell = newRow.insertCell(3);
                    const startDateCell = newRow.insertCell(4);
                    const endDateCell = newRow.insertCell(5);
                    const makeupWeekCell = newRow.insertCell(6);
                    const weekIdCell = newRow.insertCell(7); // 추가된 열

                    // 셀 내용 설정
                    selectCell.className = "w40";
                    curriculumYearCell.className = "w200";
                    curriculumNameCell.className = "w300";
                    lectureWeekCell.className = "w200";
                    startDateCell.className = "w200";
                    endDateCell.className = "w200";
                    makeupWeekCell.className = "w200";
                    weekIdCell.style.display = "none";

                    // 셀에 데이터 출력하기
                    weekIdCell.textContent = response[i].weekId; // weekId 설정
                    selectCell.innerHTML = '<input type="checkbox" class="rowCheckbox">';
                    curriculumYearCell.innerHTML = `<input type="text" value="`+ response[i].curriculumYear +`" class="w200" id="curriculumYearpost" name="` + response[i].curriculumYear + `"disabled>`;
                    curriculumNameCell.innerHTML = `<input type="text" value="`+ response[i].curriculumName +`" class="w300" id="curriculumNamepost" name="` + response[i].curriculumName + `"disabled>`;
                    lectureWeekCell.innerHTML = `<input type="text" value="`+ response[i].lectureWeek +`주차" class="w200" id="lectureWeekpost" name="` + response[i].lectureWeek + `">`;
                    const startDate = new Date(response[i].startDate);
                    const formattedStartDate = startDate.getFullYear() + '-' + String(startDate.getMonth() + 1).padStart(2, '0') + '-' + String(startDate.getDate()).padStart(2, '0');
                    startDateCell.innerHTML = `<input type="text" value="`+ formattedStartDate + `" class="w200" id="startDatepost" name="` +startDate + `">`;
                    const endDate = new Date(response[i].endDate);
                    const formattedEndDate = endDate.getFullYear() + '-' + String(endDate.getMonth() + 1).padStart(2, '0') + '-' + String(endDate.getDate()).padStart(2, '0');
                    endDateCell.innerHTML = `<input type="text" value="`+ formattedEndDate + `" class="w200" id="endDatepost" name="` +endDate + `">`;
                    makeupWeekCell.innerHTML = '<input type="checkbox">';

                }
                // 검색 건수 업데이트
                const count = response.length;
                document.querySelector("#countValue").textContent = count;
            },
            error: function (error) {
                console.error("조회 실패: " + error);
                // 에러 처리
            }
        });
    });

    // 수업주차정보 업데이트
    document.querySelector("button#saveButton").addEventListener("click", function (){
        const selectedRows = document.querySelectorAll("input.rowCheckbox:checked");
        const weekIds = [];
        const lectureWeeks = [];

        selectedRows.forEach(checkbox => {
            const row = checkbox.closest("tr");
            lectureYear = row.querySelector("#curriculumYearpost").value;
            courseName = row.querySelector("#curriculumNamepost").value;
            const lectureWeek = row.querySelector("#lectureWeekpost").value;
            const startDate = row.querySelector("#startDatepost").value;
            const endDate = row.querySelector("#endDatepost").value;

            const weekIdElement = row.querySelector("td[style='display: none;']");
            if (weekIdElement) {
                weekIds.push(weekIdElement.textContent);
            }

            lectureWeeks.push({
                lectureWeek: lectureWeek,
                startDate: startDate,
                endDate: endDate
            });

        });
        console.log(lectureWeeks);

        for(let i = 0; i < lectureWeeks.length; i++)
        {
            const updateObject = {
                lectureWeek: lectureWeeks[0].lectureWeek,
                startDate: lectureWeeks[0].startDate,
                endDate: lectureWeeks[0].endDate,
                weekId: weekIds[0],
                curriculumYear: lectureYear,
                curriculumName: courseName
            };

            console.log(updateObject);

            $.ajax({
                url: "/admin/lwm/update",
                type: "POST",
                data: JSON.stringify(updateObject),
                contentType: 'application/json',
                success: function (response) {
                    console.log('success');
                    alert('업데이트가 완료되었습니다.');
                    location.reload();
                },
                error: function () {
                    console.log("error");
                }
            })
        }
    });

</script>
<script src=""></script>
</html>