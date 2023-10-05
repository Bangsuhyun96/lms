<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<%=request.getContextPath()%>/resources/css/admin/assignments/assignments.css" rel="stylesheet">
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
            <button class="btn-default">삭제</button>
        </div>
        <!--  선택 테이블 구조 1 -->
        <div class="select_table_1">
            <table>
                <tbody>
                <tr>
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">정규과정</option>
                                <option value="">특별과정</option>
                                <option value="">야간과정</option>
                                <option value="">번역아틀리에</option>
                                <option value="">문화콘텐츠 번역실무 고급과정</option>
                                <option value="">심화과정</option>
                                <option value="">단기과정</option>
                                <option value="">한국문학 번역가</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">정규과정</option>
                                <option value="">특별과정</option>
                                <option value="">야간과정</option>
                                <option value="">번역아틀리에</option>
                                <option value="">문화콘텐츠 번역실무 고급과정</option>
                                <option value="">심화과정</option>
                                <option value="">단기과정</option>
                                <option value="">한국문학 번역가</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">정규과정</option>
                                <option value="">특별과정</option>
                                <option value="">야간과정</option>
                                <option value="">번역아틀리에</option>
                                <option value="">문화콘텐츠 번역실무 고급과정</option>
                                <option value="">심화과정</option>
                                <option value="">단기과정</option>
                                <option value="">한국문학 번역가</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">정규과정</option>
                                <option value="">특별과정</option>
                                <option value="">야간과정</option>
                                <option value="">번역아틀리에</option>
                                <option value="">문화콘텐츠 번역실무 고급과정</option>
                                <option value="">심화과정</option>
                                <option value="">단기과정</option>
                                <option value="">한국문학 번역가</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">정규과정</option>
                                <option value="">특별과정</option>
                                <option value="">야간과정</option>
                                <option value="">번역아틀리에</option>
                                <option value="">문화콘텐츠 번역실무 고급과정</option>
                                <option value="">심화과정</option>
                                <option value="">단기과정</option>
                                <option value="">한국문학 번역가</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
                        </div>
                    </td>
                    <td><label>과정구분</label></td>
                    <td>
                        <div class="select_box">
                            <select name="fruits" class="select">
                                <option value=" ">(전체)</option>
                                <option value="">정규과정</option>
                                <option value="">특별과정</option>
                                <option value="">야간과정</option>
                                <option value="">번역아틀리에</option>
                                <option value="">문화콘텐츠 번역실무 고급과정</option>
                                <option value="">심화과정</option>
                                <option value="">단기과정</option>
                                <option value="">한국문학 번역가</option>
                            </select>
                            <span class="icoArrow"><img src="<%=request.getContextPath()%>/resources/image/icon-selectbtn.png" alt=""></span>
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
                    <table>
                        <tbody>
                        <!-- 헤더 -->
                        <tr>
                            <th>강좌번호</th>
                            <th>개설강좌명</th>
                            <th>언어권</th>
                            <th>교원</th>
                            <th>수강인원</th>
                            <th>과제건수</th>
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
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
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
            <div>
                <div class="div_title_1">
                    <p><img src="<%=request.getContextPath()%>/resources/image/bullet-main.png" alt=""><span>과제정보&nbsp;</span>검색결과:0000건</p>
                </div>
                <div class="select_view_table_1">
                    <table>
                        <tbody>
                        <!-- 헤더 -->
                        <tr>
                            <th>체크박스</th>
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
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                            <td>내용</td>
                        </tr>
                        <tr>
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
        </div>
    </div>
</body>
</html>