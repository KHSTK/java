<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bean.Student" %>
<%@ page import="com.dao.StudentDao" %>
<html>
<head>
    <title>检查添加学生信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id")) ;
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    Student student = new Student();
    student.setId(id);
    student.setName(name);
    student.setPassword(password);
    StudentDao.add(student);
    response.sendRedirect("private/index.jsp");
%>
</body>
</html>
