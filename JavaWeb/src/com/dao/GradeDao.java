package com.dao;

import com.bean.Grade;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class GradeDao {

    public static List<Grade> getList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Grade> list = new ArrayList<>();
        try {
            conn = BaseDao.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM grade order by Cname desc ,Gmark desc ");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Grade grade = new Grade();
                grade.setId(rs.getInt(1));
                grade.setCname(rs.getString(2));
                grade.setGmark(rs.getString(3));
                list.add(grade);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
        return list;
    }

    public static void add(Grade grade) {
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;
        try {
            con = BaseDao.getConnection();
            pStmt = con.prepareStatement("insert into grade(id,Cname,Gmark) values(?,?,?)");
            pStmt.setInt(1, grade.getId());
            pStmt.setString(2, grade.getCname());
            pStmt.setString(3, grade.getGmark());
            pStmt.executeUpdate();//更新数据
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id) {
        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = BaseDao.getConnection();
            pStmt = con.prepareStatement("delete from grade where id=?");
            pStmt.setInt(1, id);
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static Grade getGrade(int id) {
        Grade s = new Grade();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = BaseDao.getConnection();
            stmt = conn.prepareStatement("select * from grade where id=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setCname(rs.getString("Cname"));
                s.setGmark(rs.getString("Gmark"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
        return s;
    }

    public static void updateGrade(Grade grade) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = BaseDao.getConnection();
            String sql = "UPDATE grade SET id=?,Cname=?,Gmark=? where id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, grade.getId());
            stmt.setString(2, grade.getCname());
            stmt.setString(3, grade.getGmark());
            stmt.setInt(4, grade.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
    }

    public static List<Grade> getGradeList(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Grade> allStudent = new ArrayList<>();
        try {
            conn = BaseDao.getConnection();
            stmt = conn.prepareStatement("select * from grade where id like ?");
            stmt.setString(1, "%" + id + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Grade grade = new Grade();
                grade.setId(rs.getInt(1));
                grade.setCname(rs.getString(2));
                grade.setGmark(rs.getString(3));
                allStudent.add(grade);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
        return allStudent;
    }
}
