/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import model.Account;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {

    private AccountDAO dao = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String user = null;
        String pwd = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("rememberUser")) {
                    user = cookie.getValue();
                }
                if (cookie.getName().equals("rememberPwd")) {
                    pwd = cookie.getValue();
                }
            }
        }
        if (user == null || pwd == null) {
            request.setAttribute("username", user);
            forward(request, response, "login.jsp");
        }
        Account u = dao.login(user, pwd);
        if (u == null) {
            forward(request, response, "login.jsp");
            return;
        }
        HttpSession session = request.getSession();
        session.setAttribute("user", u);
        if (u.getRoleId() == 1) {
            out.println("Admin");
            return;
        }
        response.sendRedirect("home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String user = getParameter("user", request);
        String pwd = getParameter("pwd", request);
        boolean remember = "true".equals(request.getParameter("remember"));

        Account u = dao.login(user, pwd);
        if (u == null) {
            request.setAttribute("error", "Wrong username or password!");
            forward(request, response, "login.jsp");
            return;
        }
        if (remember) {
            Cookie cuser = new Cookie("rememberUser", u.getUsername());
            Cookie cpwd = new Cookie("rememberPwd", u.getPassword());
            cuser.setMaxAge(60 * 60 * 24 * 7 * 4); // cookie  1 month
            cuser.setMaxAge(60 * 60 * 24 * 7); // cookie  1 week
            response.addCookie(cuser);
            response.addCookie(cpwd);
        }
        HttpSession session = request.getSession();
        session.setAttribute("user", u);
        if (u.getRoleId() == 1) {
            out.println("Admin");
            return;
        }
        response.sendRedirect("home.jsp");
    }

    private String getParameter(String name, HttpServletRequest request) {
        return request.getParameter(name);
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
        request.getRequestDispatcher(path).forward(request, response);
    }

}
