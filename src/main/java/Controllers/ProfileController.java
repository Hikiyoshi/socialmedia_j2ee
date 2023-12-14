/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAO.PostDAO;
import DAO.FriendshipDAO;
import static DAO.FriendshipDAO.totalPages;
import java.io.IOException;

import DAO.ProfileDAO;
import Models.Profile;
import Utilities.AvatarUtils;
import Utilities.PasswordUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author haidu
 */
@MultipartConfig
@WebServlet(name = "Profile", urlPatterns = {"/profile"})
public class ProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        Profile p = getCurrentProfile(request);
        Profile p2 = (Profile) request.getSession().getAttribute("user");

		if (p != null) {
			String avatarImage = AvatarUtils.verifyAvatarDeployment(request, p.getImgAvatar());
			
			request.setAttribute("username", p.getUsername());
			request.setAttribute("avatarImage", avatarImage);
			request.setAttribute("firstName", p.getFirstname());
			request.setAttribute("surname", p.getSurname());
			request.setAttribute("fullName", p.getFullname());
			request.setAttribute("introduction", p.getIntroduction());
                        request.setAttribute("currentProfile", p);
                        
                        //getMaxpages for showPost
                        int maxPages = PostDAO.countMaxPagefindByUsernamePages(p.getUsername(), 3);
                        request.setAttribute("maxPage", maxPages);
			
			//MergeDuong
                        String result = "" + FriendshipDAO.isFriendRequest(p2.getUsername(), p.getUsername(),true);
                        String result1 = "" + FriendshipDAO.isFriendRequest(p2.getUsername(), p.getUsername(),false);
                        request.setAttribute("isSendRequest", result);
                        request.setAttribute("isAcceptRequest", result1);

                        if (p.getUsername().equals(p2.getUsername())) {
                            loadDataFriend(request, response, p2);
                            } else {
                                loadDataFriend(request, response, p);
                            }
                            loadDataFriendRequest(request, response, p2);
                            loadDataIsFriend(request, response, p2);
                        }

                        loadDataFriend(request, response, p);
                        loadDataFriendRequest(request, response, p);
                        
                        request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
	}
	
	protected void updateProfile(HttpServletRequest request) throws ServletException, IOException {
		Profile p = getCurrentProfile(request);
		
		String avatarFileName = AvatarUtils.writeAvatarToDisk(request, p);	
		String firstName = request.getParameter("firstName");
		String surname = request.getParameter("surname");
		String introduction = request.getParameter("introduction");
		
		p.setFirstname(firstName);
		p.setSurname(surname);
		p.setImgAvatar(avatarFileName);
		p.setIntroduction(introduction);
		
		boolean changePassword = request.getParameter("changePwChkbx") != null;
		if (changePassword) {
			String newPassword = request.getParameter("newPassword").trim();
			
			if (PasswordUtils.isValid(newPassword)) {
				String confirmPassword = request.getParameter("confirmPassword").trim();
				
				if (confirmPassword.equals(newPassword)) {
					ProfileDAO.changePassword(p.getUsername(), newPassword);
					request.setAttribute("message", "Đổi mật khẩu THÀNH CÔNG!");
				}
				else
					request.setAttribute("message", "Đổi mật khẩu THẤT BẠI! Mật khẩu nhập lại không trùng khớp.");
			}
			else {
				request.setAttribute("message", "Mật khẩu không hợp lệ, hãy đảm bảo mật khẩu thỏa các yêu cầu sau: "
											  + "có ít nhất 8 ký tự, "
											  + "chứa ít nhất 1 chữ số, "
											  + "chứa ít nhất 1 chữ cái thường, "
											  + "chứa ít nhất 1 chữ cái hoa, "
											  + "chứa ít nhất 1 ký tự đặc biệt.");
			}
		}
		
		ProfileDAO.updateProfile(p);
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
        String path = req.getRequestURI();
        req.setAttribute("path", path);
        List<Profile> users = FriendshipDAO.searchFriendShip(Integer.parseInt(page), Integer.parseInt(limit), "", p.getUsername(), 0);
        pagination(req, resp, users, page, limit);
        req.setAttribute("friendRequests", users);
    }

    public void loadDataFriend(HttpServletRequest req, HttpServletResponse resp, Profile p) throws ServletException, IOException {
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
        List<Profile> users = FriendshipDAO.getListFriendship(Integer.parseInt(page), Integer.parseInt(limit), p.getUsername());
        pagination(req, resp, users, page, limit);
        req.setAttribute("friends", users);
//        req.getRequestDispatcher("/views/friend.jsp").forward(req, resp);
    }
        
	private Profile getCurrentProfile(HttpServletRequest request) throws ServletException, IOException {
		String queryString = request.getQueryString();
		Profile p = null;
		
		if (queryString.contains("username=")) {
			String currentUser = queryString.split("&")[0].split("=")[1];
			p = ProfileDAO.selectByUsername(currentUser);
		}
		
		return p;
	}

	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		processRequest(request, response);
		request.setAttribute("message", "");
		System.out.println("doGet called.");
	}

    public void loadDataIsFriend(HttpServletRequest req, HttpServletResponse resp, Profile p) throws ServletException, IOException {
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
        List<Profile> users = FriendshipDAO.getListFriendship(Integer.parseInt(page), Integer.parseInt(limit), p.getUsername());
        pagination(req, resp, users, page, limit);
        req.setAttribute("isFriends", users);
//        req.getRequestDispatcher("/views/friend.jsp").forward(req, resp);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean saveProfile = request.getParameter("saveButton") != null;

        System.out.println(saveProfile);

        if (saveProfile) {
            updateProfile(request);
        }

        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
