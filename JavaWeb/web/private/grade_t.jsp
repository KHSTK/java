<%@ page import="com.bean.Grade" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.dao.GradeDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style = "text-align: center">
    <table border="px" align="center">
        <tr>
            <td>学号</td>
            <td>课程</td>
            <td>成绩</td>
            <td width="200px"><a href="../add_g.jsp">增加成绩</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">查看学生</a>
            </td>
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
            <td width="100px">
                <a href="../delete_g.jsp?id=<%=grade.getId() %>">删除</a>&nbsp;&nbsp;
                <a href="../updateGmark.jsp?id=<%=grade.getId()%>">修改</a>
            </td>
        </tr>
        <tr>

        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
