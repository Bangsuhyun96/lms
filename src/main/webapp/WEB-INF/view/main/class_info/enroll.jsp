<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/enroll.css" rel="stylesheet">
<%--<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/class_info/enroll.js"></script>--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="enroll_wrap">
        <div class="enroll_title">
            <p>강의목록</p>
        </div>
        <div class="enroll_contents">
            <div class="enroll_contents_1">
                <p>년도</p>
                <input type="text" id="currentYear" disabled>
            </div>
            <script>
                var currentYear = new Date().getFullYear();
                document.getElementById("currentYear").value = currentYear;
            </script>
        </div>
        <div class="enroll_table">
            <table>
                <tbody>
                <tr>
                    <th>개설과정명</th>
                    <th>진행일자</th>
                    <th>수강인원</th>
                    <th>학습과목</th>
                    <th>수강신청</th>
                </tr>
                <%@ page import="java.text.SimpleDateFormat" %>
                <%@ page import="java.util.Date" %>

                <c:forEach var="item" items="${enrollDtos}" varStatus="loop">
                    <tr>
                        <input type="hidden" id="curriculumId" value="${item.curriculumId}" />
                        <td>${item.curriculumName}</td>
                        <td><fmt:formatDate value="${item.startDate}" pattern="yyyy/MM/dd"/> ~ <fmt:formatDate value="${item.endDate}" pattern="yyyy/MM/dd"/></td>
                        <td>${item.studentCount}명</td>
                        <td><button class="openBtn" onclick="openModal(${loop.index})">상세보기</button></td>
                        <div class="modal hidden">
                            <div class="bg"></div>
                            <div class="modalBox">
                                <div id="modalTitle">학습과목 (교수명)</div>
                                <c:forEach var="sap" items="${subAndProf}">
                                    <c:set var="cName1" value="${item.curriculumName}" />
                                    <c:set var="cName2" value="${sap.curriculumName}" />
                                    <c:if test="${cName2 eq cName1}">
                                         <p id="modalContent">${sap.subjectName} (${sap.name})</p>
                                    </c:if>
                                </c:forEach>
                                <button class="closeBtn" onclick="closeModal(${loop.index})">✖</button>
                            </div>
                        </div>
                        <script>

                            function openModal(index) {
                                document.querySelectorAll(".modal")[index].classList.remove("hidden");
                            }

                            function closeModal(index) {
                                document.querySelectorAll(".modal")[index].classList.add("hidden");
                            }
                            document.querySelector(".bg").addEventListener("click", close);

                        </script>
                        <td><button type="submit" onclick="confirmApply('${item.curriculumName}')">신청</button></td>
                        <script>
                            function confirmApply(curriculumName){
                                var isConfirmed = confirm(curriculumName + " 을(를) 신청하시겠습니까?");

                                if(isConfirmed) {
                                    var param = {
                                        curriculumId : $("#curriculumId").val()
                                    }
                                    // ajax 통신
                                    $.ajax({
                                        type: "POST",
                                        url: "/classinfo/enrolment",
                                        data: param,
                                        success: function(result){
                                            console.log("성공");
                                            alert("신청이 완료되었습니다.");

                                            location.reload();
                                        },
                                        error: function(request, status, error){
                                            console.log("error: " + error);
                                            if(request.status === 400){
                                                alert("이미 신청한 과목이 있습니다.");
                                            }
                                            // alert("실패");
                                        }
                                    })
                                }else{
                                    alert("신청을 취소하였습니다.");
                                }
                            }
                        </script>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="enroll_title2">
            <p>수강신청한 강의</p>
        </div>
        <div class="enroll_table">
            <table>
                <tbody>
                <tr>
                    <th>개설과정명</th>
                    <th>진행일자</th>
                    <th>수강인원</th>
                    <th>학습과목</th>
                    <th>수강취소</th>
                </tr>
                <tr id="enrolmentRow" style="display: ${empty enrolmented ? 'none' : 'table-row'}"> <!-- 수강신청 데이터가 없을 경우 tr이 나타나지 않도록 -->
                    <input type="hidden" id="curriculumId2" value="${enrolmented.curriculumId}">
                    <td>${enrolmented.curriculumName}</td>
                    <td><fmt:formatDate value="${enrolmented.startDate}" pattern="yyyy/MM/dd"/> ~ <fmt:formatDate value="${enrolmented.endDate}" pattern="yyyy/MM/dd"/></td>
                    <td>${enrolmented.count}명</td>
                    <td><button class="openBtn2">상세보기</button></td>
                    <div class="modal hidden">
                        <div class="bg2"></div>
                        <div class="modalBox">
                            <div id="modalTitle">학습과목 (교수명)</div>
                            <c:forEach var="sap" items="${subAndProf}">
                                <c:set var="cName1" value="${enrolmented.curriculumName}" />
                                <c:set var="cName2" value="${sap.curriculumName}" />
                                <c:if test="${cName2 eq cName1}">
                                    <p id="modalContent">${sap.subjectName} (${sap.name})</p>
                                </c:if>
                            </c:forEach>
                            <button class="closeBtn2">✖</button>
                        </div>
                    </div>
                    <script>

                        const open = () => {
                            document.querySelector(".modal").classList.remove("hidden");
                        }

                        const close = () => {
                            document.querySelector(".modal").classList.add("hidden");
                        }

                        document.querySelector(".openBtn2").addEventListener("click", open);
                        document.querySelector(".closeBtn2").addEventListener("click", close);
                        // document.querySelector(".bg").addEventListener("click", close);

                    </script>
                    <td><button type="submit" onclick="cancelApply()">취소</button></td>
                    <script>
                        function cancelApply() {

                            var isCanceled = confirm("해당과정 수강을 취소하시겠습니까?");

                            if (isCanceled) {
                                var param = {
                                    curriculumId: $("#curriculumId2").val()
                                }

                                // ajax 통신
                                $.ajax({
                                    type: "POST",
                                    url: "/classinfo/enrolCancel",
                                    data: param,
                                    success: function (result) {
                                        alert("수강 취소되었습니다.");

                                        location.reload();
                                    },
                                    error: function (request, status, error) {
                                        console.log("error:" + error);
                                        alert("실패");
                                    }
                                })
                            }
                        }
                    </script>
                </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
