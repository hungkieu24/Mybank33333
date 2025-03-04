/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AssetDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Asset;

/**
 *
 * @author tiend
 */
@WebServlet(name = "SortAssetServlet", urlPatterns = {"/manager/sort"})
public class SortAssetServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SortAssetServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortAssetServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        AssetDAO dao = new AssetDAO();
        String sortOrder = request.getParameter("sortOrder");
        String sortDate = request.getParameter("sortDate");
        String status = request.getParameter("status");
        String verify = request.getParameter("verify");
        String search = request.getParameter("search");
        try {
            List<Asset> data = new ArrayList<>();
            if (sortOrder != null) {
                data = dao.getAssetsSortedByValue(sortOrder);
                request.setAttribute("data", data);
            }
            if (sortDate != null) {
                data = dao.getAssetsSortedByDate(sortDate);
                request.setAttribute("data", data);
            }
            if (status != null) {
                boolean st = Boolean.parseBoolean(status);
                data = dao.getAssetsByStatus(st);
                request.setAttribute("data", data);
            }
            if (verify != null) {
                boolean vt = Boolean.parseBoolean(verify);
                data = dao.getAssetsByVerify(vt);
                request.setAttribute("data", data);
            }
            if (search != null) {
                data = dao.searchAssetsByDescription(search);
                request.setAttribute("data", data);
            }

            request.getRequestDispatcher("manageAsset.jsp").forward(request, response);
        } catch (SQLException ex) {
        }

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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
