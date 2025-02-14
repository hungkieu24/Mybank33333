/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.SalaryDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Asset;
import model.Salary;

/**
 *
 * @author tiend
 */
@WebServlet(name="ListSalary", urlPatterns={"/manager/listSalary"})
public class ListSalary extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ListAsset</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListAsset at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        SalaryDAO dao = new SalaryDAO();
        List<Salary>data = dao.selectAllSalary();
        request.setAttribute("data", data);
        request.getRequestDispatcher("manageSalary.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("salaryid");
                SalaryDAO dao = new SalaryDAO();
        try {
            int idd = Integer.parseInt(id);
            Salary a = dao.getSalaryById(idd);
            System.out.println(id + "...............................");
            System.out.println(action + "...............................");
            System.out.println(a.toString());
            switch (action) {
                case "accept":
                    a.setStatus(true);
                    dao.updateSalary(a);
                    break;
                case "deny":
                    a.setStatus(false);
                    dao.updateSalary(a);

                    break;
                case "notConform":
                    a.setVerification(false);
                    dao.updateSalary(a);
                    break;
                case "conform":
                    a.setVerification(true);
                    dao.updateSalary(a);
                    break;
            }
            List<Salary> data = dao.selectAllSalary();
            request.setAttribute("data", data);
            request.getRequestDispatcher("manageSalary.jsp").forward(request, response);

        } catch (Exception e) {
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
