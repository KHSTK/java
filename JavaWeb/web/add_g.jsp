<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生</title>
</head>
<body>
<div style = "text-align: center;margin: 100px">
<form action="addCheck_g.jsp" method="post" onsubmit="return isnull()">
    学号：<input type="text" id="id" name="id"><br>
    课程：
    <select id="Cname" name="Cname">
        <option value="JavaWeb">JavaWeb</option>
        <option value="软件测试">软件测试</option>
        <option value="体系结构">体系结构</option>
    </select><br>
    成绩：<input type="text" id="Gmark" name="Gmark"><br>
    <input type="submit" value="提交">
    <input type="reset" value="重置">
</form>
</div>
<script>
    function isnull() {
        var id = document.getElementById("id").value;
        var Cname = document.getElementById("Cname").value;
        var Gmark = document.getElementById("Gmark").value;

        if(id==""){
            alert("学号不能为空！");
            return false;
        }
        if(Cname==""){
            alert("课程不能为空！");
            return false;
        }
        if(Gmark==""){
            alert("成绩不能为空！");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
