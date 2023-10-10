<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/admin_moli.css" rel="stylesheet">
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
                        <div class="select_box_flex">
                            <div class="select_box">
                                <select name="" class="select">
                                    <option value=" ">(전체)</option>
                                    <option value="">2020</option>
                                    <option value="">2021</option>
                                    <option value="">2022</option>
                                    <option value="">2023</option>
                                </select>
                                <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                            </div>
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
                        </div>
                    </td>
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="" class="select">
                                <option value="">정규과정</option>
                                <option value="">야간과정</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>수강학년</label></td>
                    <td>
                        <div class="select_box">
                            <select name="" class="select">
                                <option value="">1학년</option>
                                <option value="">2학년</option>
                                <option value="">3학년</option>
                                <option value="">4학년</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label>과목구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="" class="select">
                                <option value="">(전체)</option>
                                <option value="">공통과목</option>
                                <option value="">언어권과목</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>개설강좌명</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" />
                        </div>
                    </td>
                    <td><label>대표교원성명</label></td>
                    <td>
                        <div class="text_box">
                            <input type="text" />
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--  타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>개설강좌목록&nbsp;</span>검색결과:0000건</p>
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
                    <th>상세과정</th>
                    <th>개설강좌명</th>
                    <th>분반</th>
                    <th>수강학년</th>
                    <th>과목구분</th>
                    <th>언어권</th>
                    <th>연수</th>
                    <th>일반</th>
                    <th>그룹</th>
                    <th>학점</th>
                    <th>시수</th>
                    <th>시간</th>
                    <th>총강의주</th>
                    <th>강의실</th>
                    <th>대표교원</th>
                    <th>진행상태</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <tr>
                    <td>2023</td>
                    <td>가을학기</td>
                    <td>정규과정</td>
                    <td>없음</td>
                    <td>알고리즘과 이해</td>
                    <td>A반</td>
                    <td>4학년</td>
                    <td>필요?</td>
                    <td>필요?</td>
                    <td>필수</td>
                    <td>필수</td>
                    <td></td>
                    <td>3</td>
                    <td>3</td>
                    <td>3</td>
                    <td>15주차</td>
                    <td>601호</td>
                    <td>방수현</td>
                    <td>강좌개설확정</td>
                </tr>
                <!-- 출력 끝-->
                </tbody>
            </table>
        </div>
        <!--  타이틀 2  -->
        <div class="div_title_2">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>개설강좌정보&nbsp;</span></p>
            <input type="text" />
            <button>분반생성</button>
        </div>
        <!--  출력 테이블 구조 1 -->
        <div class="select_table_1">
            <table>
                <tbody>
                    <tr>
                        <td><label>개설강좌정보</label></td>
                        <td>
                            <div class="text_box">
                                <input type="text">
                            </div>
                        </td>
                        <td><label>수업년도/학기</label></td>
                        <td>
                            <div class="select_box_flex">
                                <div class="select_box">
                                    <select name="" class="select">
                                        <option value=" ">(전체)</option>
                                        <option value="">2020</option>
                                        <option value="">2021</option>
                                        <option value="">2022</option>
                                        <option value="">2023</option>
                                    </select>
                                    <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                                </div>
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
                            </div>
                        </td>
                        <td><label>과정구분</label></td>
                        <td>
                            <div class="text_box">
                                <input type="text">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><label>교과목코드</label></td>
                        <td>
                            <div class="select_box">
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
                        <td><label>개설강좌명</label></td>
                        <td>
                            <div class="text_box">
                                <input type="text">
                            </div>
                        </td>
                        <td><label>상세과정구분</label></td>
                        <td>
                            <div class="text_box">
                                <input type="text">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><label>과목구분</label></td>
                        <td>
                            <div class="select_box">
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
                        <td><label>언어권구분</label></td>
                        <td>
                            <div class="select_box">
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
                        <td><label>수강학년</label></td>
                        <td>
                            <div class="select_box">
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
                    </tr>
                    <tr>
                        <td><label>학점</label></td>
                        <td>
                            <div class="text_box">
                                <input type="text">
                            </div>
                        </td>
                        <td><label>분반</label></td>
                        <td>
                            <div class="select_box">
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
                        <td><label>대표교원</label></td>
                        <td>
                            <div class="select_box">
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
                    </tr>
                    <tr>
                        <td><label>강의시수/수업시간</label></td>
                        <td>
                            <div class="text_box">
                                <input type="text">
                            </div>
                        </td>
                        <td><label>수강제한인원</label></td>
                        <td>
                            <div class="text_box">
                                <input type="text">
                            </div>
                        </td>
                        <td><label>강의주차</label></td>
                        <td>
                            <div class="select_box">
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
                    </tr>
                    <tr>
                        <td><label>수업시간표</label></td>
                        <td>
                            <div class="text_box">
                                <input type="text">
                            </div>
                        </td>
                        <td><label>진행상태</label></td>
                        <td>
                            <div class="select_box">
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
                    </tr>
                </tbody>
            </table>
        </div>
        <!--  타이틀 1  -->
        <div class="div_title_1">
            <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>교원정보등록&nbsp;</span>검색결과:0000건</p>
        </div>
        <!--  출력 테이블 구조 1 -->
        <div class="select_view_table_1">
            <table>
                <tbody>
                <!-- 헤더 -->
                <tr>
                    <th>교원구분</th>
                    <th>교원번호</th>
                    <th>교원성명</th>
                    <th>소속기관명</th>
                    <th>강의시수단가</th>
                    <th>과제심사비지급</th>
                    <th>회당과제심사료</th>
                    <th>소득구분</th>
                    <th>성적정정신청서</th>
                </tr>
                <!-- 헤더 끝-->

                <!--  출력  -->
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <tr>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                    <td>d</td>
                </tr>
                <!-- 출력 끝-->
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>