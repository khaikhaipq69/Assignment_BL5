/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.CommonDAO;
import Model.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CreateBookingController extends HttpServlet {

    private CommonDAO dao;

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
        dao = new CommonDAO();
        try {
            String rtidStr = (String) request.getSession().getAttribute("rtid");
            int rtid = Integer.parseInt(rtidStr);
            request.setAttribute("r", dao.getRoomTypeById(rtid));
            request.setAttribute("lsDom", dao.getListDom());
            request.setAttribute("lsTerm", dao.getListTerm());
            request.setAttribute("lsRoom", dao.getListRoomFree(rtid, 1, 1));
            dispatch(request, response, "createbooking.jsp");
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO adao = new AccountDAO();
        HttpSession ses = request.getSession();
        try {
            int aid = ((Account) request.getSession().getAttribute("acc")).getAccountId();
            int tid = Integer.parseInt(request.getParameter("tid"));
            int rid = Integer.parseInt(request.getParameter("rid"));
            dao.insertAccountRoom(aid, rid, tid);
            Account a = (Account) ses.getAttribute("acc");
            ses.setAttribute("acc",adao.getAccount(a.getAccountId()));
            
            dispatch(request, response, "dashboard.jsp");
        } catch (Exception e) {
            dispatch(request, response, "booking.jsp");
        }
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
