<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dao.StudentDao" %>
<%@ page import="com.bean.Student" %>
<html>
<head>
    <title>修改学生信息</title>
</head>
<body>
<div style = "text-align: center">

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Student stu = StudentDao.getStudent(id);
%>
<form action="updateCheck.jsp?id=<%=id%>" method="post" onsubmit="return isnull()">
    学号： <input type="text" name="id" value="<%=stu.getId()%>"><br>
    姓名： <input type="text" name="name" value="<%=stu.getName()%>"><br>
    密码： <input type="text" name="password" value="<%=stu.getPassword()%>"><br>
    <input type="submit" value="修改">
    <input type="reset" value="重置">
</form>
</div>
<script>
    function isnull() {
        var id = document.getElementById("id").value;
        var name = document.getElementById("name").value;
        var pwd = document.getElementById("password").value;

        if(id==""){
            alert("学号不能为空！");
            return false;
        }
        if(name==""){
            alert("姓名不能为空！");
            return false;
        }
        if(pwd==""){
            alert("密码不能为空！");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
