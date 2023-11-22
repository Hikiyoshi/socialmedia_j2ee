/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAO.PostDAO;
import Models.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import Models.Profile;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Home", urlPatterns = { "/" })
public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        Profile p = (Profile)session.getAttribute("user");
        
        if(p == null){
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
        else{
            // merge from VQ
            request.setAttribute("avatar", p.getImgAvatar().split("[.]")[0]);
            request.setAttribute("username", p.getUsername());
            request.setAttribute("fullname", p.getFirstname() + " " + p.getSurname());
            //merge from DD
            List<Post> listPost = PostDAO.findByUsernamePages(p.getUsername(), 0, 5);
            request.setAttribute("ListPost", listPost);
            request.getRequestDispatcher("/views/index.jsp").forward(request, response);
        }
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        processRequest(request, response);
    }
}
