<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/main/lectoer/lectoer_schedule.css" rel="stylesheet">
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/main/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/main/common/lectoer_header.jsp" %>
<div class="body_wrap">
    <div class="myclass_wrap">
        <div class="myclass_title">
            <p>나의강의현황</p>
        </div>
        <div class="myclass_contents">
            <div class="myclass_contents_1">
                <p>년도</p>
                <input type="text" value="2023" disabled>
            </div>
            <div class="myclass_contents_1">
                <p>학기</p>
                <input type="text" value="1학기" disabled>
            </div>
        </div>
        <div class="myclass_title margin_top50 border_bottom2">
            <p>과정명 : 2023년 1학기 정규과정</p>
        </div>
        <div class="enroll_wrap">
            <div class="myclass_enroll">
                <div class="myclass_enroll_contents">
                    <p><a href="#" class="show_btn">· 마이크로프로세서 ( 강의코드 ex) 00087427 )</a></p>
                    <div class="myclass_enroll_btn">
                        <button type="submit" onclick="location.href='/lectoer/plan'">강의계획서</button>
                        <button type="submit" onclick="location.href='/lectoer/attendance'">출결</button>
                    </div>
                </div>
            </div>
            <div class="myclass_enroll">
                <div class="myclass_enroll_contents">
                    <p><a href="#" class="show_btn">· 알고리즘 ( 강의코드 ex) 00087427 )</a></p>
                    <div class="myclass_enroll_btn">
                        <button type="submit" onclick="location.href='/classinfo/syllabus'">강의계획서</button>
                        <button type="submit" onclick="location.href='/classinfo/attendance'">출결</button>
                        <button type="submit" onclick="location.href='/classinfo/subassign'">과제</button>
                    </div>
                </div>
            </div>
            <div class="myclass_enroll">
                <div class="myclass_enroll_contents">
                    <p><a href="#" class="show_btn">· 정보보안 ( 강의코드 ex) 00087427 )</a></p>
                    <div class="myclass_enroll_btn">
                        <button type="submit" onclick="location.href='/classinfo/syllabus'">강의계획서</button>
                        <button type="submit" onclick="location.href='/classinfo/attendance'">출결</button>
                        <button type="submit" onclick="location.href='/classinfo/subassign'">과제</button>
                    </div>
                </div>
            </div>
            <div class="myclass_enroll">
                <div class="myclass_enroll_contents">
                    <p><a href="#" class="show_btn">· 컴퓨터 네트워크 ( 강의코드 ex) 00087427 )</a></p>
                    <div class="myclass_enroll_btn">
                        <button type="submit" onclick="location.href='/classinfo/syllabus'">강의계획서</button>
                        <button type="submit" onclick="location.href='/classinfo/attendance'">출결</button>
                        <button type="submit" onclick="location.href='/classinfo/subassign'">과제</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%@ include file="/WEB-INF/view/main/common/footer.jsp" %>
<script>
    const showButtons = document.querySelectorAll('.show_btn');

    showButtons.forEach((button) => {
        button.addEventListener('click', () => {
            const parentContents = button.closest('.myclass_enroll_contents');
            const allEnrollBtns = document.querySelectorAll('.myclass_enroll_btn');
            allEnrollBtns.forEach((enrollBtn) => {
                enrollBtn.classList.remove('show');
            });
            const enrollBtn = parentContents.querySelector('.myclass_enroll_btn');
            enrollBtn.classList.toggle('show');
        });
    });
</script>
</body>
</html>
