/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAO.PostDAO;
import Models.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.time.LocalDate;
import java.util.Date;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet("/postController")
public class postController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/postBaiViet.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        File dir = new File(request.getServletContext().getRealPath("/icons"));
        if(!dir.exists()) { // tạo nếu chưa tồn tại
        dir.mkdirs();
}
        String content = request.getParameter("content");
        String username = request.getParameter("username");
         // Lấy hình ảnh từ trường input file
         Part filePart = request.getPart("image");
        File file = new File(dir, filePart.getSubmittedFileName());
        filePart.write(file.getAbsolutePath());
          Date currentDate = new Date();
         Post post = new Post();
         post.setUsername(username);
        post.setContent(content);
       post.setDateCreated(currentDate);
         request.setAttribute("post", post);
          request.setAttribute("imageStream", file);
          
          PostDAO.createPost(post);
//         Post p  = new Post("1","3",LocalDate.now());
         request.getRequestDispatcher("/views/postResult.jsp").forward(request, response);
    }
   
}
