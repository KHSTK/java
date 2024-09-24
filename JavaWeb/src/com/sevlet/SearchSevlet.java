package com.sevlet;

import com.bean.Grade;
import com.dao.GradeDao;
import com.dao.StudentDao;
import com.bean.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@WebServlet("/search")
public class SearchSevlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        int id = Integer.parseInt(req.getParameter("id"));
        List<Student> Slist = StudentDao.getStudentList(id);
        List<Grade> Glist = GradeDao.getGradeList(id);
        req.setAttribute("Slist", Slist);
        req.setAttribute("Glist", Glist);
        req.getRequestDispatcher("searchStudent.jsp").forward(req, resp);


        super.doPost(req, resp);
    }
}
