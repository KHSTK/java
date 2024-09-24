<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dao.GradeDao" %>
<%@ page import="com.bean.Grade" %>
<html>
<head>
    <title>修改成绩信息</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Grade grade = GradeDao.getGrade(id);
%>
<div style = "text-align: center;margin: 100px">
    <form action="updateCheck_g.jsp?id=<%=id%>" method="post">
        学号： <input type="text" name="id" value="<%=grade.getId()%>"><br>
        课程： <input type="text" name="Cname" value="<%=grade.getCname()%>"><br>
        成绩： <input type="text" name="Gmark" value="<%=grade.getGmark()%>"><br>
        <input type="submit" value="修改">
        <input type="reset" value="重置">
    </form>
</div>
</body>
</html>
