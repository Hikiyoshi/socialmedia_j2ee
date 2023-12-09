

package Controllers;

import DAO.ProfileDAO;
import Models.Profile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 *
 * @author trand
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String surname = request.getParameter("surname");
            String firstname = request.getParameter("firstname");
            String imgAvatar = request.getParameter("imgAvatar");
            String dateBirth = request.getParameter("date");
            String genderString = request.getParameter("gender");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("email");
            
            Profile p = ProfileDAO.selectByUsername(username);
            if(p == null){
                try {
               
                    java.sql.Date dateBirt = java.sql.Date.valueOf(dateBirth);

             
                    int gender = Integer.parseInt(genderString);

               
                    Profile profile = new Profile();
                    profile.setUsername(username);
                    profile.setPassword(password);
                    profile.setSurname(surname);
                    profile.setFirstname(firstname);
                    profile.setDateBirth(dateBirt);
                    profile.setGender(gender);
                    profile.setPhonenumber(phoneNumber);
                    profile.setEmail(email);
                
                    ProfileDAO.createProfile(profile);              
                } catch (Exception e) {
                
                    System.out.println("Loi: " + e);
                }
                response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            }else {
                request.setAttribute("message","Tài khoản đã tồn tại");
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            }       
        }
    


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
