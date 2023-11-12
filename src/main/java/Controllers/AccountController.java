/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAO.ProfileDAO;
import Models.Profile;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author trand
 */

@WebServlet(name = "AccountController", urlPatterns = {"/sign_in"})
public class AccountController extends HttpServlet {
    protected void processRequest (HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        String uri = req.getRequestURI();
        if(uri.contains("sign_in")){
            this.doSignIn(req,resp);
        }
        else if (uri.contains("sign-up")){
            this.doSignUp(req,resp);
        }
        else if(uri.contains("sign-out")){}
        else if(uri.contains("forgot-password")) {}
        else if(uri.contains("change-password")) {}
        else if(uri.contains("edit-profile")) {
            this.doEditProfile(req, resp);
        }
    }
//    private void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
//        String method = req.getMethod();
//        if(method.equalsIgnoreCase("POST")){
//            String id = req.getParameter("username");
//        String pw = req.getParameter("password");
//        try {
//        ProfileDAO dao = new ProfileDAO();
//        Profile p = dao.selectByUsername(id);
//        if(!p.getPassword().equals(pw)){
//        req.setAttribute("message", "Sai mật khẩu!");
//        }
//        else {
//        req.setAttribute("message", "Đăng nhập thành công!");
//        req.getSession().setAttribute("user", p);
//        }
//        } catch (Exception e) {
//        req.setAttribute("message", "Sai tên đăng nhập!");
//        }
//        }
//        req.getRequestDispatcher("/views/Thanhcong.jsp").forward(req,resp);
//    }
    
    private void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String method = req.getMethod();

    if (method.equalsIgnoreCase("POST")) {
        String id = req.getParameter("username");
        String pw = req.getParameter("password");

        try {
            ProfileDAO dao = new ProfileDAO();
            Profile p = dao.selectByUsername(id);

            if (p != null && p.getPassword().equals(pw)) {
                // Password is correct
                req.getSession().setAttribute("user", p);
                req.getRequestDispatcher("/views/Thanhcong.jsp").forward(req, resp);
                return; // Stop further processing
            } else {
                // Incorrect username or password
                req.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
            }
        } catch (Exception e) {
            // Exception occurred (e.g., database error)
            req.setAttribute("message", "Đã xảy ra lỗi khi đăng nhập!");
        }
    }

    // If the code reaches here, it means there was an error or an incorrect login attempt
    
    req.getRequestDispatcher("/views/sign_in.jsp").forward(req, resp);
}

    
    
    private void doSignUp (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String method = req.getMethod();
        if(method.equalsIgnoreCase("POST")){
            
        }
        req.getRequestDispatcher("/view/sign_up.jsp").forward(req,resp);
    }
    
    private void doEditProfile (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        Profile pf = (Profile) req.getSession().getAttribute("pf");
        String method = req.getMethod();
        if(method.equalsIgnoreCase("POST")){
            
        }
        req.getRequestDispatcher("/view/login_register.jsp").forward(req,resp);
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
