<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.bean.Grade" %>
<%@ page import="com.dao.GradeDao" %>
<html>
<head>
    <title>成绩信息</title>
</head>
<body>
<div style = "text-align: center">
<table border="1px" align="center" >
    <tr>
        <td>学号</td>
        <td>课程</td>
        <td>成绩</td>

    </tr>
    <%
        List<Grade> list = GradeDao.getList();
        Iterator<Grade> iter = list.iterator();

        while (iter.hasNext()) {
            Grade grade = iter.next();
    %>
    <tr>
        <td width="100px"><%=grade.getId()%>
        </td>
        <td width="100px"><%=grade.getCname()%>
        </td>
        <td width="100px"><%=grade.getGmark()%>
        </td>
    </tr>
    <%
        }
    %>
</table>
<a href="../searchStudent.jsp">查询学生</a></td>
</div>
</body>
</html>