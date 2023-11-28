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

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import Models.Profile;
import java.util.List;
import Utilities.AvatarUtils;
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
            String avatarImage = AvatarUtils.verifyAvatarDeployment(request, p.getImgAvatar());

            request.setAttribute("avatarImage", avatarImage);
            request.setAttribute("username", p.getUsername());
            request.setAttribute("fullName", p.getFullname());
            //merge from DD
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
