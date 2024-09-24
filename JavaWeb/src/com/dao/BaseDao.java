package com.dao;
import java.sql.*;

public class BaseDao {
    static{
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection(){
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rj2142zk?useUnicode=yes&characterEncoding=utf8", "root", "wlgxsjdfm");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    public static void closeAll(ResultSet rs,PreparedStatement pStmt,Connection conn){
        if(rs != null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(pStmt != null){
            try {
                pStmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
