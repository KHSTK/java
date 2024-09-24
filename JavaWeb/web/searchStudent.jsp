<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.Grade" %>
<html>
<head>
    <title>查询成绩信息</title>
</head>
<body>
<div style = "text-align: center;margin: 100px">
<form action="${pageContext.request.contextPath}/search" method="post" onsubmit="return isnull()">
    <input type="text" name="id" id="id" placeholder="请输入学号进行查询"><br>
    <input type="submit" value="查询">
</form>
</div>

<table border="2px" align="center">
    <tr>
        <td>学号</td>
        <td>课程</td>
        <td>成绩</td>
    </tr>
    <%
        List Glist = (List) request.getAttribute("Glist");
        if (Glist != null) {
            for (int i = 0; i < Glist.size(); i++) {
                Grade grade = (Grade) Glist.get(i);
    %>
    <tr>
        <td><%=grade.getId()%></td>
        <td><%=grade.getCname()%></td>
        <td><%=grade.getGmark()%></td>
    </tr>
    <%
            }
        }
    %>
</table>

<script type="text/javascript">
    function isnull() {
        var id = document.getElementById("id").value;
        if (id == "") {
            alert("请输入学号！");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>
</html>
