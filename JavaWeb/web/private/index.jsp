<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bean.Student" %>
<%@ page import="com.dao.StudentDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <title>学生信息</title>
</head>
<body>
<table border="1px" align="center">
    <tr>
        <td>学号</td>
        <td>姓名</td>
        <td>密码</td>
        <td width="250px"><a href="../add.jsp">增加学生</a>
            <a href="grade_t.jsp">查看成绩</a>
        </td>
    </tr>
    <%
        List<Student> list = StudentDao.getList();
        Iterator<Student> iter = list.iterator();

        while (iter.hasNext()) {
            Student student = iter.next();
    %>
    <tr>
        <td width="100px"><%=student.getId()%>
        </td>
        <td width="100px"><%=student.getName()%>
        </td>
        <td width="100px"><%=student.getPassword()%>
        </td>
        <td width="100px">
            <a href="../delete.jsp?id=<%=student.getId() %>">删除</a>&nbsp;&nbsp;
            <a href="../updateStudent.jsp?id=<%=student.getId()%>">修改</a>
        </td>
    </tr>
    <tr>

    </tr>
    <%
        }
    %>
</table>
</body>
</html>
