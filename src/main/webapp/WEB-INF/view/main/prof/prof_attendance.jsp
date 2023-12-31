<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/prof/prof_attendance.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/prof_header.jsp" %>
<div class="body_wrap">
    <div class="syllabus_wrap">
        <div class="syllabus_title">
            <p>강좌정보</p>
        </div>
        <div class="syllabus_contents">
            <div class="syllabus_contents_1">
                <p>년도</p>
                <input type="text" value="${profDto.lectureYear}" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>수업기간</p>
                <input type="text" value="${profDto.startDate} ~ ${profDto.endDate}" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>과정명</p>
                <input type="text" value="${profDto.curriculumName}" disabled>
            </div>
            <div class="syllabus_contents_1">
                <p>과목명</p>
                <input type="text" value="${profDto.lectureName}" disabled>
            </div>
        </div>
        <div class="prof_attendance_title4">
            <p>[00주차] 2023-10-07</p>
            <p>총 00명 [출석률 %] - 출석 00명 / 지각 00명 / 결석 00명</p>
            <a href="#"><div class="prof_attendance_title4_arrow_left"></div></a>
            <a href="#"><div class="prof_attendance_title4_arrow_right"></div></a>
        </div>

        <div class="prof_attendance_title3">
            <p>전체출결현황</p>
        </div>
        <div class="prof_attendance_wrap">
            <div>
                <div class="prof_attendance_user">
                    <div>
                        <img src="<%=request.getContextPath()%>/resources/image/pro.jpg" alt="">
                    </div>
                    <div class="prof_attendance_user_info">
                        <p>김훈규</p>
                        <p>rlagnstb019@gmail.com</p>
                        <p>지각 : 0회</p>
                        <p>결석 : 0회</p>
                        <div>
                            <button>출석</button>
                            <button>지각</button>
                            <button>결석</button>
                        </div>
                    </div>
                </div>
                <div class="prof_attendance_user">
                    <div>
                        <img src="<%=request.getContextPath()%>/resources/image/pro.jpg" alt="">
                    </div>
                    <div class="prof_attendance_user_info">
                        <p>김훈규</p>
                        <p>rlagnstb019@gmail.com</p>
                        <p>지각 : 0회</p>
                        <p>결석 : 0회</p>
                        <div>
                            <button>출석</button>
                            <button>지각</button>
                            <button>결석</button>
                        </div>
                    </div>
                </div>
                <div class="prof_attendance_user">
                    <div>
                        <img src="<%=request.getContextPath()%>/resources/image/pro.jpg" alt="">
                    </div>
                    <div class="prof_attendance_user_info">
                        <p>김훈규</p>
                        <p>rlagnstb019@gmail.com</p>
                        <p>지각 : 0회</p>
                        <p>결석 : 0회</p>
                        <div>
                            <button>출석</button>
                            <button>지각</button>
                            <button>결석</button>
                        </div>
                    </div>
                </div>
                <div class="prof_attendance_user">
                    <div>
                        <img src="<%=request.getContextPath()%>/resources/image/pro.jpg" alt="">
                    </div>
                    <div class="prof_attendance_user_info">
                        <p>김훈규</p>
                        <p>rlagnstb019@gmail.com</p>
                        <p>지각 : 0회</p>
                        <p>결석 : 0회</p>
                        <div>
                            <button>출석</button>
                            <button>지각</button>
                            <button>결석</button>
                        </div>
                    </div>
                </div>
                <div class="prof_attendance_user">
                    <div>
                        <img src="<%=request.getContextPath()%>/resources/image/pro.jpg" alt="">
                    </div>
                    <div class="prof_attendance_user_info">
                        <p>김훈규</p>
                        <p>rlagnstb019@gmail.com</p>
                        <p>지각 : 0회</p>
                        <p>결석 : 0회</p>
                        <div>
                            <button>출석</button>
                            <button>지각</button>
                            <button>결석</button>
                        </div>
                    </div>
                </div>
                <div class="prof_attendance_user">
                    <div>
                        <img src="<%=request.getContextPath()%>/resources/image/pro.jpg" alt="">
                    </div>
                    <div class="prof_attendance_user_info">
                        <p>김훈규</p>
                        <p>rlagnstb019@gmail.com</p>
                        <p>지각 : 0회</p>
                        <p>결석 : 0회</p>
                        <div>
                            <button>출석</button>
                            <button>지각</button>
                            <button>결석</button>
                        </div>
                    </div>
                </div>
                <div class="prof_attendance_user">
                    <div>
                        <img src="<%=request.getContextPath()%>/resources/image/pro.jpg" alt="">
                    </div>
                    <div class="prof_attendance_user_info">
                        <p>김훈규</p>
                        <p>rlagnstb019@gmail.com</p>
                        <p>지각 : 0회</p>
                        <p>결석 : 0회</p>
                        <div>
                            <button>출석</button>
                            <button>지각</button>
                            <button>결석</button>
                        </div>
                    </div>
                </div>
                <div class="prof_attendance_user">
                    <div>
                        <img src="<%=request.getContextPath()%>/resources/image/pro.jpg" alt="">
                    </div>
                    <div class="prof_attendance_user_info">
                        <p>김훈규</p>
                        <p>rlagnstb019@gmail.com</p>
                        <p>지각 : 0회</p>
                        <p>결석 : 0회</p>
                        <div>
                            <button>출석</button>
                            <button>지각</button>
                            <button>결석</button>
                        </div>
                    </div>
                </div>
                <div class="prof_attendance_user">
                    <div>
                        <img src="<%=request.getContextPath()%>/resources/image/pro.jpg" alt="">
                    </div>
                    <div class="prof_attendance_user_info">
                        <p>김훈규</p>
                        <p>rlagnstb019@gmail.com</p>
                        <p>지각 : 0회</p>
                        <p>결석 : 0회</p>
                        <div>
                            <button>출석</button>
                            <button>지각</button>
                            <button>결석</button>
                        </div>
                    </div>
                </div>
                <div class="prof_attendance_user">
                    <div>
                        <img src="<%=request.getContextPath()%>/resources/image/pro.jpg" alt="">
                    </div>
                    <div class="prof_attendance_user_info">
                        <p>김훈규</p>
                        <p>rlagnstb019@gmail.com</p>
                        <p>지각 : 0회</p>
                        <p>결석 : 0회</p>
                        <div>
                            <button>출석</button>
                            <button>지각</button>
                            <button>결석</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="syllabus_table">
            <table>
                <tbody>
                    <tr>
                        <th>성명</th>
                        <th>이메일</th>
                        <th>출석</th>
                        <th>지각</th>
                        <th>결석</th>
                        <th>출석률</th>
                    </tr>
                    <tr>
                        <td>방수현</td>
                        <td>bangt968712@gmail.com</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>방수현</td>
                        <td>bangt968712@gmail.com</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>방수현</td>
                        <td>bangt968712@gmail.com</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>방수현</td>
                        <td>bangt968712@gmail.com</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
</body>
</html>
