<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/admin_csm.css" rel="stylesheet">
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
            <button class="btn_pos">조회</button>
            <button class="btn-default">신규</button>
            <button class="btn-default">저장</button>
            <button class="btn-default">삭제</button>
        </div>
        <!--  선택 테이블 구조 1 -->
        <div class="select_table_1">
            <table>
                <tbody>
                <tr>
                    <td><label>수업년도/학기</label></td>
                    <td>
                        <div class="select_box select_2">
                            <select name="" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">2020</option>
                                <option value="">2021</option>
                                <option value="">2022</option>
                                <option value="">2023</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td>
                        <div class="select_box select_2">
                            <select name="" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">봄학기</option>
                                <option value="">여름학기</option>
                                <option value="">가을학기</option>
                                <option value="">겨울학기</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">봄학기</option>
                                <option value="">여름학기</option>
                                <option value="">가을학기</option>
                                <option value="">겨울학기</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>기수코드</label></td>
                    <td>
                        <div class="select_box">
                            <select name="" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">봄학기</option>
                                <option value="">여름학기</option>
                                <option value="">가을학기</option>
                                <option value="">겨울학기</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--  타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>수업주차정보&nbsp;</span>검색결과:0000건</p>
        </div>
        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                    <!-- 헤더 -->
                    <tr>
                        <th>수업년도</th>
                        <th>학기</th>
                        <th>과정구분</th>
                        <th>기수명</th>
                        <th>일정적용단위</th>
                        <th>일정종류</th>
                        <th>시작일시</th>
                        <th>종료일시</th>
                        <th>개설강좌</th>
                        <th>비고</th>
                    </tr>
                    <!-- 헤더 끝-->
                    <!--  출력  -->
                    <tr>
                        <td>2023</td>
                        <td>가을학기</td>
                        <td>정규과정</td>
                        <td>-</td>
                        <td>과정기수</td>
                        <td>교육기간</td>
                        <td>2023-10-05 00:00</td>
                        <td>2023-12-31 23:59 </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2023</td>
                        <td>가을학기</td>
                        <td>정규과정</td>
                        <td>-</td>
                        <td>과정기수</td>
                        <td>강의계획서입력</td>
                        <td>2023-10-05 00:00</td>
                        <td>2023-12-31 23:59 </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2023</td>
                        <td>가을학기</td>
                        <td>정규과정</td>
                        <td>-</td>
                        <td>과정기수</td>
                        <td>수강신청</td>
                        <td>2023-10-05 00:00</td>
                        <td>2023-12-31 23:59 </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2023</td>
                        <td>가을학기</td>
                        <td>정규과정</td>
                        <td>-</td>
                        <td>과정기수</td>
                        <td>성적입력</td>
                        <td>2023-10-05 00:00</td>
                        <td>2023-12-31 23:59 </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2023</td>
                        <td>가을학기</td>
                        <td>정규과정</td>
                        <td>-</td>
                        <td>과정기수</td>
                        <td>성적정정</td>
                        <td>2023-10-05 00:00</td>
                        <td>2023-12-31 23:59 </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2023</td>
                        <td>가을학기</td>
                        <td>정규과정</td>
                        <td>-</td>
                        <td>과정기수</td>
                        <td>성적조회</td>
                        <td>2023-10-05 00:00</td>
                        <td>2023-12-31 23:59 </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2023</td>
                        <td>가을학기</td>
                        <td>정규과정</td>
                        <td>-</td>
                        <td>과정기수</td>
                        <td>강의평가</td>
                        <td>2023-10-05 00:00</td>
                        <td>2023-12-31 23:59 </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2023</td>
                        <td>가을학기</td>
                        <td>정규과정</td>
                        <td>-</td>
                        <td>과정기수</td>
                        <td>운영만족도조사</td>
                        <td>2023-10-05 00:00</td>
                        <td>2023-12-31 23:59 </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>2023</td>
                        <td>가을학기</td>
                        <td>정규과정</td>
                        <td>-</td>
                        <td>과정기수</td>
                        <td>결과물제출기간</td>
                        <td>2023-10-05 00:00</td>
                        <td>2023-12-31 23:59 </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <!--  출력 끝 -->
                </tbody>
            </table>
        </div>

        <div class="free_paging">
            <ul>
                <li><a href="">&lt; 이전</a></li>
                <li><a href="">1</a></li>
                <li><a href="">2</a></li>
                <li><a href="">3</a></li>
                <li><a href="">4</a></li>
                <li><a href="">5</a></li>
                <li><a href="">6</a></li>
                <li><a href="">7</a></li>
                <li><a href="">8</a></li>
                <li><a href="">9</a></li>
                <li><a href="">10</a></li>
                <li><a href="">다음 &gt;</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>