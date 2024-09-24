<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bean.Grade" %>
<%@ page import="com.dao.GradeDao" %>
<html>
<head>
    <title>检查添加成绩信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id")) ;
    String Cname = request.getParameter("Cname");
    String Gmark = request.getParameter("Gmark");
    Grade grade = new Grade();
    grade.setId(id);
    grade.setCname(Cname);
    grade.setGmark(Gmark);
    GradeDao.add(grade);
    response.sendRedirect("private/grade_t.jsp");
%>
</body>
</html>
