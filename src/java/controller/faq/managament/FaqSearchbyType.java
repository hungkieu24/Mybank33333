/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.faq.managament;

import dal.FAQDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.FAQ;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="FaqSearchbyType", urlPatterns={"/seller/faq-search-type"})
public class FaqSearchbyType extends HttpServlet {
   
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
            out.println("<title>Servlet FaqSearchbyType</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FaqSearchbyType at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
     HttpSession session = request.getSession();
        String[] faqTypes = request.getParameterValues("faqType");

      
        FAQDAO dao = new FAQDAO();
        Map<String, List<FAQ>> faqMap = dao.getAllFAQsByType();
        List<FAQ> filteredFAQs = new ArrayList<>();

        // Lọc theo loại câu hỏi
        if (faqTypes != null && faqTypes.length > 0) {
            for (String type : faqTypes) {
                if (faqMap.containsKey(type)) {
                    filteredFAQs.addAll(faqMap.get(type));
                }
            }
        } else {
            // Nếu không chọn loại nào, lấy tất cả câu hỏi
            for (List<FAQ> faqList : faqMap.values()) {
                filteredFAQs.addAll(faqList);
            }
        }

        

        request.setAttribute("listFAQ", filteredFAQs);
        request.getRequestDispatcher("faq-management.jsp").forward(request, response);

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
