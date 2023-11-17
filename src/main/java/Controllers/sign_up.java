/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
 * @author Admin
 */
@WebServlet(name = "sign_up", urlPatterns = {"/sign_up"})
public class sign_up extends HttpServlet {
private static final long serialVersionUID = 1L;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try  {
            response.sendRedirect("/views/sign_in.jsp");
        }
        catch(IOException e){
            System.out.println(e);
        }
    }
    
    
    private boolean doSignUp(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String method = req.getMethod();

        if (method.equalsIgnoreCase("POST")) {
            // Lấy thông tin từ form
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String surname = req.getParameter("surname");
            String firstname = req.getParameter("firstname");
            String imgAvatar = req.getParameter("imgAvatar");
            String dateBirth = req.getParameter("date");
            String genderString = req.getParameter("gender");
            String phoneNumber = req.getParameter("phoneNumber");
            String email = req.getParameter("email");

            try {
                // Chuyển đổi chuỗi ngày sinh thành đối tượng java.sql.Date
                java.sql.Date dateBirt = java.sql.Date.valueOf(dateBirth);

                // Chuyển đổi chuỗi giới tính thành số nguyên
                int gender = Integer.parseInt(genderString);

                // Tạo đối tượng Profile và đặt giá trị
                Profile profile = new Profile();
                profile.setUsername(username);
                profile.setPassword(password);
                profile.setSurname(surname);
                profile.setFirstname(firstname);
                profile.setImgAvatar(imgAvatar);
                profile.setDateBirth(dateBirt);
                profile.setGender(gender);
                profile.setPhonenumber(phoneNumber);
                profile.setEmail(email);

                // Lưu thông tin vào cơ sở dữ liệu sử dụng ProfileDAO (giả sử bạn đã định nghĩa ProfileDAO)
                
                ProfileDAO.createProfile(profile);

                return true;

            } catch (Exception e) {
                // Xử lý lỗi nếu có
                System.out.println("Lỗi: " + e);
            }
        }
        req.getRequestDispatcher("/views/sign_up.jsp").forward(req, resp);
        return false;
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       if (doSignUp(request, response)) {
            // Chuyển hướng đến trang thành công hoặc thực hiện các thao tác khác nếu cần
            response.sendRedirect(request.getContextPath() + "/views/sign_in.jsp");
        } else {
            // Chuyển hướng đến trang đăng ký nếu có lỗi hoặc dữ liệu không hợp lệ
            response.sendRedirect(request.getContextPath() + "/views/sign_up.jsp");
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
