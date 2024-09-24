package com.dao;

import com.bean.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class StudentDao {

    public static List<Student> getList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Student> list = new ArrayList<>();
        try {
            conn = BaseDao.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM student");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Student stu = new Student();
                stu.setId(rs.getInt(1));
                stu.setName(rs.getString(2));
                stu.setPassword(rs.getString(3));
                list.add(stu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
        return list;
    }

    public static void add(Student stu) {
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;
        try {
            con = BaseDao.getConnection();
            pStmt = con.prepareStatement("insert into student(id,name,password) values(?,?,?)");
            pStmt.setInt(1, stu.getId());
            pStmt.setString(2, stu.getName());
            pStmt.setString(3, stu.getPassword());
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
            pStmt = con.prepareStatement("delete from student where id=?");
            pStmt.setInt(1, id);
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static Student getStudent(int id) {
        Student s = new Student();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = BaseDao.getConnection();
            stmt = conn.prepareStatement("select * from student where id=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
        return s;
    }

    public static void updateStudent(Student student) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = BaseDao.getConnection();
            String sql = "UPDATE student SET id=?,name=?,password=? where id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, student.getId());
            stmt.setString(2, student.getName());
            stmt.setString(3, student.getPassword());
            stmt.setInt(4, student.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
    }

    public static List<Student> getStudentList(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Student> allStudent = new ArrayList<>();
        try {
            conn = BaseDao.getConnection();
            stmt = conn.prepareStatement("select * from student where id like ?");
            stmt.setString(1, "%" + id + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Student stu = new Student();
                stu.setId(rs.getInt(1));
                stu.setName(rs.getString(2));
                stu.setPassword(rs.getString(3));
                allStudent.add(stu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDao.closeAll(rs, stmt, conn);
        }
        return allStudent;
    }
}
