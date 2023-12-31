
package Controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import DAO.ProfileDAO;
import Models.Profile;
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
        String us = request.getParameter("your_name");
        String pw = request.getParameter("your_pass");
        try {       
            
            Profile p = ProfileDAO.selectByUsername(us);
            if (p != null && p.getPassword().equals(pw)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", p);
                request.setAttribute("user", p);
                response.sendRedirect("/socialmedia_j2ee/index");
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
