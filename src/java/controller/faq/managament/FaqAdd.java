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
import java.util.Set;
import model.FAQ;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="FaqAdd", urlPatterns={"/seller/faq-add"})
public class FaqAdd extends HttpServlet {
   
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
            out.println("<title>Servlet FaqAdd</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FaqAdd at " + request.getContextPath () + "</h1>");
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
        FAQDAO faqDao = new FAQDAO();
        Set<String> listType = faqDao.getFAQType();

        request.setAttribute("listType", listType);
        request.getRequestDispatcher("faq-add.jsp").forward(request, response);
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
            
         // Lấy dữ liệu từ form
        String type = request.getParameter("type");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");

        // Tạo đối tượng FAQ từ dữ liệu form
        FAQ newFAQ = new FAQ();
        newFAQ.setType(type);
        newFAQ.setQuestion(question);
        newFAQ.setAnswer(answer);

        // Thêm FAQ vào cơ sở dữ liệu
        FAQDAO faqDao= new FAQDAO();
        boolean isAdded = faqDao.addFAQBoolean(newFAQ);
        HttpSession session = request.getSession();
        if (isAdded) {
            session.setAttribute("message", "FAQ added successfully!");
        } else {
            session.setAttribute("message", "Failed to add FAQ. Please try again.");
        }

        // Chuyển hướng người dùng về trang quản lý FAQ
        response.sendRedirect("/timibank/seller/faq-management");
         
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
