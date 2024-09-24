<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dao.StudentDao" %>
<html>
<head>
    <title>删除学生信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    StudentDao.delete(id);
    response.sendRedirect("private/index.jsp");
%>
</body>
</html>
