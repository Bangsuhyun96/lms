<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kor">
<%@ include file="/WEB-INF/view/admin/common/front_header.jsp" %>
<body>
<%@ include file="/WEB-INF/view/admin/common/header.jsp" %>
    <div class="wrap">
        <%@ include file="/WEB-INF/view/admin/common/aside.jsp" %>
        <div class="main_contents_right">
            <iframe src="/admin/page" width="1523px" height="900px" frameborder="0"></iframe>

        </div>
    </div>
</body>
</html>