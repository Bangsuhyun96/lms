<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/class_info/enroll.css" rel="stylesheet">
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
                <p>년도 / 학기</p>
                <input type="text" value="2023" disabled>
                <input type="text" value="1학기" disabled>
            </div>
        </div>
        <div class="enroll_table">
            <table>
                <tbody>
                <tr>
                    <th>년도</th>
                    <th>개설강좌명</th>
                    <th>학점</th>
                    <th>교수명</th>
                    <th>강의시간</th>
                    <th>강의명</th>
                    <th>신청인원</th>
                    <th>신청버튼</th>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>한국어</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>월요일 1교시</td>
                    <td>601호</td>
                    <td>30명</td>
                    <td><button type="submit">신청</button></td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>한국어</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>월요일 1교시</td>
                    <td>601호</td>
                    <td>30명</td>
                    <td><button type="submit">신청</button></td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>한국어</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>월요일 1교시</td>
                    <td>601호</td>
                    <td>30명</td>
                    <td><button type="submit">신청</button></td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>한국어</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>월요일 1교시</td>
                    <td>601호</td>
                    <td>30명</td>
                    <td><button type="submit">신청</button></td>
                </tr>
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
                    <th>년도</th>
                    <th>개설강좌명</th>
                    <th>학점</th>
                    <th>교수명</th>
                    <th>강의시간</th>
                    <th>강의명</th>
                    <th>신청인원</th>
                    <th>삭제버튼</th>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>한국어</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>월요일 1교시</td>
                    <td>601호</td>
                    <td>30명</td>
                    <td><button type="submit">삭제</button></td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>한국어</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>월요일 1교시</td>
                    <td>601호</td>
                    <td>30명</td>
                    <td><button type="submit">삭제</button></td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>한국어</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>월요일 1교시</td>
                    <td>601호</td>
                    <td>30명</td>
                    <td><button type="submit">삭제</button></td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>한국어</td>
                    <td>3</td>
                    <td>서지환</td>
                    <td>월요일 1교시</td>
                    <td>601호</td>
                    <td>30명</td>
                    <td><button type="submit">삭제</button></td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
