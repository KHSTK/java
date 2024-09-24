<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>检查登入信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean flag = false;
    int id = Integer.parseInt(request.getParameter("id"));
    String pwd = request.getParameter("password");
%>

<%
    String url = "jdbc:mysql://localhost:3306/rj2142zk?useUnicode=true&characterEncoding=utf8";
    String user = "root";
    String password = "wlgxsjdfm";
    String select = request.getParameter("select");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        String sql= "SELECT * FROM student WHERE id= ? AND password= ?";
        if(select.equals("teacher")) {
            sql = "SELECT * FROM teacher WHERE id= ? AND password= ?";
        }
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        pstmt.setString(2, pwd);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            flag = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
        flag = false;
    }
%>
<%
    if (flag) {
        if(select.equals("student")){
            session.setAttribute("name","student");
%>
<jsp:forward page="loginSuccess.jsp"/>

<% }
    if(select.equals("teacher")){
        session.setAttribute("name","teacher");
%>
<jsp:forward page="loginSuccess_t.jsp"/>

<%
    }} else {
%>
<jsp:forward page="loginFail.jsp"/>
<%
    }
%>
</body>
</html>
