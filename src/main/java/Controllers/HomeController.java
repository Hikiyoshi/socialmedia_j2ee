/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAO.FriendshipDAO;
import static DAO.FriendshipDAO.totalPages;
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
import java.util.HashMap;
import java.util.Map;
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
            loadDataFriendRequest(request, response, p);
            //merge from DD
            
            //getMaxpages for showPost
            int maxPages = PostDAO.CountMaxFriendsandMyPost(p.getUsername(), 3);
            request.setAttribute("maxPage", maxPages);
            request.getRequestDispatcher("/views/index.jsp").forward(request, response);
        }
    }
    public void loadDataFriendRequest(HttpServletRequest req, HttpServletResponse resp, Profile p) throws ServletException, IOException {
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
//        String q = req.getParameter("q");
        try {
//            if (q == null) {
//                q = "";
//            }
            if (page == null || page.isEmpty() || "".equals(page.trim()) || Integer.parseInt(page) > totalPages) {
                page = "1";
            }
            if (limit == null || limit.isEmpty() || "".equals(limit.trim()) || Integer.parseInt(limit) > totalPages) {
                limit = "10";
            }
        } catch (NumberFormatException e) {
            page = "1";
            limit = "10";
        }
        String path= req.getRequestURI();
        req.setAttribute("path", path);
        List<Profile> users = FriendshipDAO.getListRequestFriendship(Integer.parseInt(page), Integer.parseInt(limit), p.getUsername());
        pagination(req, resp, users, page, limit);
        req.setAttribute("friendRequests", users);
    }
    
    public Map<String, Object> pagination(HttpServletRequest request, HttpServletResponse response, List<Profile> users, String page, String limit) {
        int prevPage = Integer.parseInt(page) > totalPages ? Integer.parseInt(page) - 1 : 1;
        int nextPage = Integer.parseInt(page) < totalPages ? Integer.parseInt(page) + 1 : totalPages;
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPage", totalPages);
        request.setAttribute("perPage", limit);
        request.setAttribute("prevPage", prevPage);
        request.setAttribute("nextPage", nextPage);
        Map<String, Object> data = new HashMap<>();
        data.put("currentPage", page);
        data.put("totalPage", totalPages);
        data.put("perPage", limit);
        data.put("prevPage", prevPage);
        data.put("nextPage", nextPage);
        return data;
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
