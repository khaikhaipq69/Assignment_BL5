/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CommonDAO;
import Model.RoomType;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class BookingController extends HttpServlet {

    private CommonDAO dao = new CommonDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!checklogin(request, response)) {
            return;
        }
        List<RoomType> roomTypes = dao.getListRoomType();
        request.setAttribute("ls", roomTypes);
        dispatch(request, response, "booking.jsp");
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
        HttpSession ses = request.getSession();
        ses.setAttribute("rtid", request.getParameter("rtid"));
        response.sendRedirect("createbooking");
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        request.getRequestDispatcher(url).forward(request, response);
    }

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
    }

}
