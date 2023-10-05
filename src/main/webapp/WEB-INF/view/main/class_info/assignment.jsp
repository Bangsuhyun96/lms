<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/assignment.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/header.jsp" %>
<div class="body_wrap">
    <div class="subassign_wrap">
        <div class="subassign_title">
            <p>강좌정보</p>
        </div>
        <div class="subassign_contents">
            <div class="subassign_contents_1">
                <p>년도</p>
                <input type="text" value="2023" disabled>
            </div>
            <div class="subassign_contents_1">
                <p>학기</p>
                <input type="text" value="1학기" disabled>
            </div>
            <div class="subassign_contents_1">
                <p>과정명</p>
                <input type="text" value="정규과정" disabled>
            </div>
            <div class="subassign_contents_1">
                <p>과목명</p>
                <input type="text" value="알고리즘 ( 강의코드 ex) 00087427 )" disabled>
            </div>
        </div>

        <div class="subassign_title2">
            <p>과제정보</p>
        </div>
        <div class="subassign_table">
            <table>
                <tbody>
                <tr>
                    <th>과제번호</th>
                    <th>과제명</th>
                    <th>진행상태</th>
                    <th>제출</th>
                    <th>점수</th>
                    <th>배점</th>
                    <th>제출마감일</th>
                    <th class="width_reset"></th>
                </tr>
                <tr>
                    <td>2023-S0056</td>
                    <td><a href="/classinfo/assignmentadd">알고리즘의 이해</a></td>
                    <td>진행중 / 종료</td>
                    <td>미제출 / 제출완료</td>
                    <td>79 / 비공개</td>
                    <td>10</td>
                    <td>2023-09-30 23:59</td>
                    <td>
                        <div class="accordion_btn">

                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
<%--        <div class="subassign_table2">--%>
<%--            <table>--%>
<%--                <tbody>--%>
<%--                <tr><th>과제설명</th><td>이 과제는 어렵다.</td></tr>--%>
<%--                <tr><th>과제파일</th><td><div class="file_box"><input type="text" value="과제" disabled><button type="">다운로드</button></div></td></tr>--%>
<%--                <tr><th>과제제출</th><td><div class="file_box"><input type="text" value="파일" disabled><button type="">업로드</button><button type="">파일삭제</button></div></td></tr>--%>
<%--                <tr><th>제출일시</th><td><input type="text" value="2023-09-30 12:48" disabled></td></tr>--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--        </div>--%>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
