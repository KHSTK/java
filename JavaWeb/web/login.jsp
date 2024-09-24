<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生成绩管理系统</title>
</head>
<body>
<div style = "text-align: center;margin: 100px">
    <h1>学生成绩管理系统</h1>
<form action="checkLogin.jsp" method="post" onsubmit="return isnull()">
    账号：<input type="text" name="id" id="id"><br>
    密码：<input type="password" name="password" id="password"><br>
    教师<input type="radio" checked="checked" value="teacher" name="select">
    学生<input type="radio" checked="checked" value="student" name="select"><br>
    <input type="submit" value="登入">
</form>
</div>
<script>
    function isnull() {
        var id_1 = document.getElementById("id").value;
        var pwd_2 = document.getElementById("password").value;
        if(id_1==""){
            alert("账号不能为空！");
            return false;
        }
        if(pwd_2==""){
            alert("密码不能为空！");
            return false;
        }
        return true;
    }

</script>
</body>
</html>
