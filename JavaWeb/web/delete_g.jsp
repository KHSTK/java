<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dao.GradeDao" %>
<html>
<head>
    <title>删除成绩信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    GradeDao.delete(id);
    response.sendRedirect("private/grade_t.jsp");
%>
</body>
</html>