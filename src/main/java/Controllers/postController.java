/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import DAO.PostDAO;
import Models.Post;
import Models.PostImage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/postController")
public class postController extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/postBaiViet.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		File dir = new File(request.getServletContext().getRealPath("/images"));
        if(!dir.exists()) { // tạo nếu chưa tồn tại
        dir.mkdirs();
}
        String content = request.getParameter("content");
        String username = request.getParameter("username");
        
        LocalDateTime currentDateTime = LocalDateTime.now();
          Post post = new Post();
          post.setUsername(username);
          post.setContent(content);
        
        
          post.setDateCreated(currentDateTime);
          request.setAttribute("post", post);
          
          
          PostDAO.createPost(post);
          
          // Lấy hình ảnh từ trường input file
         Part filePart = request.getPart("image");
         if(filePart != null && filePart.getSize() > 0){
             
            File file = new File(dir, filePart.getSubmittedFileName());
            filePart.write(file.getAbsolutePath());
            
            request.setAttribute("imageStream", file);
            
            PostImage pi = new PostImage();
            pi.setIdPost(post.getIdPost());
            pi.setImg(file.getName());
            PostDAO.createImage(pi);
            
         }
          
//         Post p  = new Post("1","3",LocalDate.now());
         //request.getRequestDispatcher("/").forward(request, response);
         response.sendRedirect("/socialmedia_j2ee/index");
	}
}
