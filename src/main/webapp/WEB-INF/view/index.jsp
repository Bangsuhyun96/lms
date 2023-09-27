<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
    <div class="wrap">
        <%@ include file="/WEB-INF/view/common/aside.jsp" %>
        <div class="main_contents_right">
            <iframe src="/page"  frameborder="0"></iframe>
        </div>
    </div>
</body>
</html>