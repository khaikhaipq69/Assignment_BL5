/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CommonDAO;
import Model.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewInfoController extends HttpServlet {

    private CommonDAO dao = new CommonDAO();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("lsTerm", dao.getListTerm());
        request.getRequestDispatcher("usage.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!checklogin(request, response)) {
            return;
        }
        int tid = Integer.parseInt(request.getParameter("tid"));
        int aid = ((Account) request.getSession().getAttribute("acc")).getAccountId();
        request.setAttribute("info", dao.getInfomation(aid, tid));
        request.setAttribute("lsTerm", dao.getListTerm());
        request.setAttribute("selectedid", tid);

        request.getRequestDispatcher("usage.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    private boolean checklogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("acc") == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return false;
        }
        return true;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
