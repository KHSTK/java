<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生</title>
</head>
<body>
<div style = "text-align: center;margin: 100px">
<form action="addCheck.jsp" method="post" onsubmit="return isnull()">
    学号：<input type="text" id="id" name="id"><br>
    姓名：<input type="text" id="name" name="name"><br>
    密码：<input type="password" id="password" name="password"><br>
    <input type="submit" value="提交">
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
