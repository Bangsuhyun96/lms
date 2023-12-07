<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <div class="main_contents_left">
    <div class="search_bx">
      <input type="text" placeholder="검색어를 입력하세요." id="" name=""/>
      <button><p><i class="fa-solid fa-magnifying-glass" style="color: #444444;"></i></p></button>
    </div>
    <div class="menu_tree">
      <table>
        <tbody>
        <tr><td><a href="" ><p><i class="fa-solid fa-folder"></i><span>&nbsp;공통관리</span></p></a></td></tr>
        <tr><td><a href="/admin/member/management" ><p><i class="fa-solid fa-folder-open text-indent"></i><span>&nbsp;사용자정보관리</span></p></a></td></tr>
        <tr><td><a href="/admin/curriculumList" ><p><i class="fa-solid fa-folder-open text-indent"></i><span>&nbsp;교육과정관리</span></p></a></td></tr>
        <tr><td><a href="/admin/lwm" ><p><i class="fa-solid fa-folder-open text-indent"></i><span>&nbsp;수업주차관리</span></p></a></td></tr>
        <tr><td><a href="/admin/subjectList" ><p><i class="fa-solid fa-folder-open text-indent"></i><span>&nbsp;교과목마스터</span></p></a></td></tr>
        <tr><td><a href="/admin/curriSubList" ><p><i class="fa-solid fa-folder-open text-indent"></i><span>&nbsp;교육과정교과목</span></p></a></td></tr>
        <tr><td><a href="/admin/moli" ><p><i class="fa-solid fa-folder-open text-indent"></i><span>&nbsp;개설강좌관리</span></p></a></td></tr>
        <tr><td><a href="/admin/schedule" ><p><i class="fa-solid fa-folder-open text-indent"></i><span>&nbsp;수업일정정보</span></p></a></td></tr>
        <tr><td><a href="/admin/lecture/apply/subject" ><p><i class="fa-solid fa-folder-open text-indent"></i><span>&nbsp;수강신청관리</span></p></a></td></tr>
        <tr><td><a href="/admin/assignments" ><p><i class="fa-solid fa-folder-open text-indent"></i><span>&nbsp;과제관리</span></p></a></td></tr>
        <tr><td><a href="/admin/lectureAttend" ><p><i class="fa-solid fa-folder-open text-indent"></i><span>&nbsp;출강강의관리</span></p></a></td></tr>

        </tbody>
      </table>

    </div>
    <div class="menu_btn">
      <button>← 메뉴숨기기</button>
    </div>
  </div>