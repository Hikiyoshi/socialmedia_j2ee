
package Controllers;

import DAO.ProfileDAO;
import Models.Profile;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String us = request.getParameter("username");
        String pw = request.getParameter("password");
        try {       
            Profile p = ProfileDAO.selectByUsername(us);

            if (p != null && p.getPassword().equals(pw)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", p);
                request.setAttribute("user", p);
                
                response.sendRedirect("/views/index.jsp");
                //request.getRequestDispatcher("/index").forward(request, response);
            } else {
                // Incorrect username or password
                request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Exception occurred (e.g., database error)
            request.setAttribute("message", "Đã xảy ra lỗi khi đăng nhập!");
        }
        //request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
