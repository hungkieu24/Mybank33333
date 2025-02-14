package controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author SCN
 */
@WebServlet(name = "SortListUserByFullName", urlPatterns = {"/admin/sort_fullname"})
public class SortListUserByFullName extends HttpServlet {

    private UserDAO uDao;

    public void init() throws ServletException {
        uDao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String typeOfSort = request.getParameter("type");
        List<User> listUser;

        int page = 1; // trang Ä‘áº§u tiÃªn
        int pageSize = 10; // 1 trang cÃ³ 10 users

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        listUser = uDao.sortListUser("FullName", typeOfSort, page, pageSize);

        int totalUsers = uDao.getTotalUsers(null, null);
        int totalPages = (int) Math.ceil((double) totalUsers / pageSize);

        // số lượng của user theo từng role
        int numOfAdmin = uDao.getTotalUsers("RoleID", 1);
        int numOfSeller = uDao.getTotalUsers("RoleID", 2);
        int numOfManager = uDao.getTotalUsers("RoleID", 3);
        int numOfProviderInsurance = uDao.getTotalUsers("RoleID", 4);
        int numOfCustomer = uDao.getTotalUsers("RoleID", 5);

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("numOfAdmin", numOfAdmin);
        request.setAttribute("numOfSeller", numOfSeller);
        request.setAttribute("numOfManager", numOfManager);
        request.setAttribute("numOfProviderInsurance", numOfProviderInsurance);
        request.setAttribute("numOfCustomer", numOfCustomer);

        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("listUsers", listUser);
        request.setAttribute("typeOfSort", typeOfSort);
        request.getRequestDispatcher("ManagementUsers.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
