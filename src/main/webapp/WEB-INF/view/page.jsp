<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kor">
<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/iframe.css" rel="stylesheet">
<body>
    <table>
        <tr>
            <td><label for="">과정구분</label></td>
            <td>
                <select name="" id="" class="dwd">
                    <option value=" ">(전체)</option>
                    <option value="10">정규과정</option>
                    <option value="20">특별과정</option>
                    <option value="21">야간과정</option>
                    <option value="30">번역아틀리에</option>
                    <option value="40">문화콘텐츠 번역실무 고급과정</option>
                    <option value="50">심화과정</option>
                    <option value="60">단기과정</option>
                    <option value="70">한국문학 번역가</option>
                </select>
                <span>
                    <input autocomplete="off">
                    <a href="" tabindex="-1">
                        <span class="asd"></span>
                    </a>
                </span>
            </td>
        </tr>
    </table>
</body>
</html>
