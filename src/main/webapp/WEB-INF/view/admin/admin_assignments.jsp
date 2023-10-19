<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/admin_assignments.css" rel="stylesheet">
<script src="/resources/js/admin/assignments/assignments.js"></script>
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
            <button class="btn-default">삭제</button>
        </div>
        <!--  선택 테이블 구조 1 -->
        <div class="select_table_1">
            <table>
                <tbody>
                <tr>
                    <td><label>수업년도</label></td>
                    <td>
                        <div class="select_box select_2">
                            <select id="lectureYearSelect" name="lectureYear" class="select">
                                <option value="">(전체)</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>

                    <td><label class="labeltext">개설강좌</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="searchInput" name="lectureName" placeholder="검색어를 입력하세요"/>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table">
            <div>
                <div class="div_title_1">
                    <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>강좌정보&nbsp;</span>검색결과:0000건</p>
                </div>
                <div class="select_view_table_1">
                    <table id="dataTable">
                        <tbody>
                        <!-- 헤더 -->
                        <tr>
                            <th>강좌번호</th>
                            <th>개설강좌명</th>
                            <th>교원</th>
                            <th>수강인원</th>
                            <th>과제건수</th>
                        </tr>
                        <!-- 헤더 끝-->


                        <!--  출력  -->

                        <c:forEach items="${assignments}" var="assignment" varStatus="loop">
                            <tr>
                                <td>${assignment.lectureId}</td>
                                <td>${assignment.lectureName}</td>
                                <td>${assignment.professorName}</td>
                                <td>${assignment.studentCount}</td>
                                <td>${assignment.assignmentCount}</td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>
            <div>
                <div class="div_title_2">
                    <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>과제정보&nbsp;</span>검색결과:0000건</p>
                </div>
                <div class="select_view_table_2">
                    <table>
                        <tbody>
                        <!-- 헤더 -->
                        <tr>
                            <th><input type="checkbox" id="selectAll"></th>
                            <th>과제번호</th>
                            <th>과제명</th>
                            <th>출제자</th>
                            <th>수행단위</th>
                            <th>진행상태</th>
                            <th>제출인원</th>
                        </tr>
                        <!-- 헤더 끝-->

                        <!--  출력  -->
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <!-- 출력 끝-->
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <!--  타이틀 2  -->
        <div class="div_title_1">
            <div class="div_title_1">
                <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>과제정보&nbsp;</span></p>
            </div>
            <div class="div_common_button">
                <button class="btn_pos" onclick="resetStyles()">신규</button>
                <button class="btn-default" id="saveButton" onclick="saveDataAndCreateTable()">저장</button>
            </div>
        </div>

        <!--  출력 테이블 구조 2 -->
        <div class="select_table_2">
            <table>
                <tbody>
                <tr>
                    <td><label for="assignmentIdInput">과제번호</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="assignmentIdInput">
                        </div>
                    </td>
                    <td><label for="unitInput">수행단위</label></td>
                    <td>
                        <div class="select_box_flex">
                            <div class="select_box">
                                <select id="unitInput" name="" class="select">
                                    <option value="">개인과제</option>
                                    <option value="">그룹과제</option>
                                </select>
                                <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                            </div>
                        </div>
                    </td>
                    <td><label for="statusInput">진행상태</label></td>
                    <td>
                        <div class="select_box_flex">
                            <div class="select_box">
                                <select id="statusInput" name="" class="select">
                                    <option value="">제출가능</option>
                                    <option value="">제출마감</option>
                                </select>
                                <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="assignmentNameInput">과제명</label></td>
                    <td colspan="5">
                        <div class="text_box_2">
                            <input type="text" id="assignmentNameInput">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="studentCountInput">수강인원</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="studentCountInput">
                        </div>
                    </td>
                    <td><label for="submissionCountInput">제출인원</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="submissionCountInput">
                        </div>
                    </td>
                    <td><label for="professorNameInput">출제자</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="professorNameInput">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="startDateInput">제출시작일시</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="startDateInput">
                        </div>
                    </td>
                    <td><label for="endDateInput">제출마감일시</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" id="endDateInput">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="transform: translateY(-80px);"><label for="descriptionInput">과제설명</label></td>
                    <td colspan="6">
                        <div class="text_box_2">
                            <textarea id="descriptionInput" rows="4" cols="50" name="assignment_description"></textarea>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                <tr/>
                <tr>
                    <td><label>첨부파일</label></td>
                    <td colspan="5">
                        <div class="text_box_1">
                            <input type="text" id="fileInputText" readonly>
                            <button class="btn_file" onclick="chooseFile()" >첨부파일</button>
                            <input type="file" id="fileInput" accept="*" style="display: none;" onchange="displaySelectedFileName()">
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        </div>
    </div>
</body>
</html>