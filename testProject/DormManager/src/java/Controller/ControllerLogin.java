/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import Model.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControllerLogin extends HttpServlet {

    private AccountDAO adao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dispatch(request, response, "/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        adao = new AccountDAO();
        HttpSession ses = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Account a = adao.login(email, password);
            if (a != null) {
                ses.setAttribute("acc", a);
                response.sendRedirect("dashboard.jsp");
                return;
            } else {
                request.setAttribute("mes", "email or password is wrong!");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ControllerLogin.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("mes", "cannot authentication");
        }
        dispatch(request, response, "/index.jsp");
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
