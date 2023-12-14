/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAO.FriendshipDAO;
import static DAO.FriendshipDAO.totalPages;
import Models.Profile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author haidu
 */
@WebServlet(name = "FriendshipController", urlPatterns = {"/friend"})
public class FriendshipController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try {
            String action = request.getParameter("btnFriend");
            HttpSession session = request.getSession();
            Profile p = (Profile) session.getAttribute("user");
            if (null != action) {
                switch (action) {
//                    case "Search":
//                        doSearch(request, response);
//                        break;
                    case "Xóa lời mời":
                        doDeleteFriend(request, response,p,0);
                        break;
                    case "Kết bạn":
                        doAddFriend(request, response, p);
                        break;
                    case "Xóa bạn bè":
                        doDeleteFriend(request, response,p,1);
                        break;
                    default:
                        loadData(request, response);
                        break;
                }
            } else {
                loadData(request, response);
            }
        } catch (ServletException | IOException e) {
        }
    }

//    private void doSearch(HttpServletRequest req, HttpServletResponse resp)
//            throws ServletException, IOException {
//        String method = req.getMethod();
//        List<Profile> list = new ArrayList<>();
//        if (method.equalsIgnoreCase("POST")) {
//            String q = req.getParameter("q");
//            try {
//                list = FriendshipDAO.searchFriendShip(1, 10, q, "honggam", 1);
//            } catch (Exception e) {
//                req.setAttribute("message", "Lỗi!");
//            }
//        }
//        req.setAttribute("friends", list);
//        req.getRequestDispatcher("/views/friend.jsp").forward(req, resp);
//    }
    private void doAddFriend(HttpServletRequest req, HttpServletResponse resp, Profile p)
            throws ServletException, IOException {
        String method = req.getMethod();
        if (method.equalsIgnoreCase("POST")) {
            String username = req.getParameter("username");
            if (username == null || username.isEmpty() || "".equals(username.trim())) {
                req.setAttribute("message", "Lỗi!");
            } else {
                try {
                    String message = FriendshipDAO.createFriendShip( p.getUsername(),username);
                    req.setAttribute("message", message);
                } catch (Exception e) {
                    req.setAttribute("message", "Lỗi!");
                }
            }
        }
        loadData(req, resp);
        String previousPage = req.getHeader("referer");
        resp.sendRedirect(previousPage);
    }
    //Nếu state =1 thì có nghĩ là xóa bạn bè, nếu bằng 0 thì có nghĩ là xóa lời mời kết bạn
    private void doDeleteFriend(HttpServletRequest req, HttpServletResponse resp, Profile p,int state)
            throws ServletException, IOException {
        String method = req.getMethod();
        if (method.equalsIgnoreCase("POST")) {
            String username = req.getParameter("username");
            if (username == null || username.isEmpty() || "".equals(username.trim())) {
                req.setAttribute("message", "Lỗi!");
            } else {
                try {
                    String message = FriendshipDAO.deleteFriendShip(username, p.getUsername(), state);
                    req.setAttribute("message", message);
                } catch (Exception e) {
                    req.setAttribute("message", "Lỗi!");
                }
            }
        }
        loadData(req, resp);
//        resp.sendRedirect("/socialmedia_j2ee/profile?username=" + p.getUsername());
        String previousPage = req.getHeader("referer");
        resp.sendRedirect(previousPage);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public void loadData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        String path = req.getRequestURI();
        req.setAttribute("path", path);
        List<Profile> users = FriendshipDAO.getListFriendship(Integer.parseInt(page), Integer.parseInt(limit), "honggam");
        pagination(req, resp, users, page, limit);
        req.setAttribute("friends", users);
//        String newUrl = req.getRequestURL() + "?q="+q+"&page=" + page + "&limit=" + limit;
//        resp.sendRedirect(newUrl);

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
