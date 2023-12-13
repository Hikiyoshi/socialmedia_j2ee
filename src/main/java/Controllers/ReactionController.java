/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAO.ReactionDAO;
import Models.Reaction;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name="ReactionController", urlPatterns={"/reaction"})
public class ReactionController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String action = request.getParameter("action");
            String idp = request.getParameter("idPostLike");
            String username = request.getParameter("userLike");
            System.out.println("<<<"+username+" "+idp);
            switch (action) {
                case "like":
                    Reaction reaction = new Reaction();
                    reaction.setIdPost(idp);
                    reaction.setUsername(username);
                    if(ReactionDAO.createReaction(reaction)){
                        System.out.println("Like Thanh Cong");
                    }
                    else{
                        System.out.println("Like That Bai");
                    }
                    break;
                case "unlike":
                    List<Reaction> reactions = ReactionDAO.findReaction(idp, username);
                    if(!reactions.isEmpty()){
                        Reaction r = reactions.get(0);
                        if(ReactionDAO.deleteReaction(String.valueOf(r.getIdReact()))){
                            System.out.println("UnLike Thanh Cong");
                        }
                        else{
                            System.out.println("UnLike That Bai");
                        }
                    }
                    else{
                        System.out.println("Khong thay Reaction");
                    }
                    break;
            }
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
