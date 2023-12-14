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
import java.util.ArrayList;
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
        
        String idPostLike = request.getParameter("idPostLike");
        String userLike = request.getParameter("userLike");
        String action = request.getParameter("action");
        
        if(action != null){
            switch (action) {
                case "like":
                    Reaction reaction = new Reaction();
                    reaction.setIdPost(idPostLike);
                    reaction.setUsername(userLike);
                    
                    if(ReactionDAO.createReaction(reaction)){
                        System.out.println("Like thanh cong");
                    }
                    else{
                        System.out.println("Like that bai");
                    }
                    
                    break;
                case "unlike":
                    
                    List<Reaction> reactions = new ArrayList<>();
                    reactions = ReactionDAO.getLike(idPostLike, userLike);
                    
                    if(!reactions.isEmpty()){
                        Reaction r = reactions.get(0);
                        String idReact = String.valueOf(r.getIdReact());
                        
                        if(ReactionDAO.deleteReaction(idReact)){
                            System.out.println("UnLike thanh cong");
                        }
                        else{
                            System.out.println("UnLike that bai");
                        }
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
