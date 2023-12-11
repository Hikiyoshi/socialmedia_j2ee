/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAO.PostCommentDAO;
import Models.PostComment;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name="CommentController", urlPatterns={"/comment"})
public class CommentController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String idPost = request.getParameter("idPost");
        
        if(idPost != null){
            String username = request.getParameter("userComment");
            String addComment = request.getParameter("add");
            String contentComment = request.getParameter("content");

            //Create Comment
            if(username != null && addComment != null && addComment.equals("true")){
                //Get Time Commented
                LocalDateTime CurrentDateTime = LocalDateTime.now();
                
                PostComment pc = new PostComment();
                pc.setIdPost(Integer.parseInt(idPost));
                pc.setUsername(username);
                pc.setContent(contentComment);
                pc.setDatecreated(CurrentDateTime);
                
                if(PostCommentDAO.createPostComment(pc)){
                    System.out.println("Them binh luan thanh cong");
                }
                else{
                    System.out.println("Them binh luan that bai");
                }
                return;
            }
            
            
//            Get List Comment find by IDPOST
            List<PostComment> listComments = PostCommentDAO.findByPost(idPost);
            for (PostComment listComment : listComments) {
                System.out.println(listComment.toString());
            }
            request.setAttribute("listComments", listComments);
            request.getRequestDispatcher("/components/postComment.jsp").forward(request, response);
        }
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
