package com.duoyu.servlet;
import dao.Logindao;
import daoimpl.Loginimpl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import pojo.Student;
@WebServlet("/register")
public class Register extends HttpServlet{
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException
    {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("utf-8");
        String name = req.getParameter("name");
        String passward = req.getParameter("passward");
        System.out.println(name);
        Logindao d = new Loginimpl();
        Student s = d.select(name);
        if(s != null)
        {
            if(s.getSno().equals(name) && s.getPassward().equals(passward))
            {
                System.out.println("\u7528\u6237\u5DF2\u5B58\u5728");
                req.getRequestDispatcher("/index1.jsp").forward(req, resp);
                return;
            }
        } else
        {
            int count = d.add(name, passward);
            if(count > 0)
                System.out.println("\u6CE8\u518C\u6210\u529F");
        }
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}
