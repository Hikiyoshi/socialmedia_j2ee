/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAO.PostDAO;
import java.io.IOException;

import DAO.ProfileDAO;
import Models.Profile;
import Utilities.AvatarUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author haidu
 */
@MultipartConfig
@WebServlet(name = "Profile", urlPatterns = { "/profile" })
public class ProfileController extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Profile p = getCurrentProfile(request);

		if (p != null) {
			String avatarImage = AvatarUtils.verifyAvatarDeployment(request, p.getImgAvatar());
			
			request.setAttribute("username", p.getUsername());
			request.setAttribute("avatarImage", avatarImage);
			request.setAttribute("firstName", p.getFirstname());
			request.setAttribute("surname", p.getSurname());
			request.setAttribute("fullName", p.getFullname());
			request.setAttribute("introduction", p.getIntroduction());
                        
                        //getMaxpages for showPost
                        int maxPages = PostDAO.countMaxPagefindByUsernamePages(p.getUsername(), 2);
                        request.setAttribute("maxPage", maxPages);
			
			System.out.println("Set profile attributes complete!");
		}

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
		
		ProfileDAO.updateProfile(p);
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
		System.out.println("doGet called.");
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		boolean saveProfile = request.getParameter("saveButton") != null;
		
		System.out.println(saveProfile);
		
		if (saveProfile)
			updateProfile(request);
		
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
