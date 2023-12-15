package Controllers;

import static Controllers.SendEmailServlet.OTP;
import DAO.ProfileDAO;
import Models.Profile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author trand
 */
@WebServlet(name = "ForgotPassController", urlPatterns = {"/ForgotPassController"})
public class ForgotPassController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String MaOTP = request.getParameter("otp");
        String password = request.getParameter("password-new");
        String us = request.getParameter("username");
        String repass = request.getParameter("password-re");
        if(MaOTP.equals("") || password.equals("") || us.equals("") || repass.equals("")){
            request.setAttribute("error", "Không được để trống thông tin");
            request.getRequestDispatcher("/views/forgotpass.jsp").forward(request, response);
        }
        else if(ProfileDAO.selectByUsername(us) == null){
            request.setAttribute("error", "Tên đăng nhập không tồn tại");
            request.getRequestDispatcher("/views/forgotpass.jsp").forward(request, response);
        }
        else if(!password.equalsIgnoreCase(repass)){
            request.setAttribute("message", "mật khẩu không trùng");
            request.getRequestDispatcher("/views/forgotpass.jsp").forward(request, response);
        }
        else if (MaOTP.equalsIgnoreCase(SendEmailServlet.OTP)) {
            if (ProfileDAO.selectByUsername(us) != null) {
                Profile pf = ProfileDAO.selectByUsername(us);
                System.out.println(pf.getPassword());
                pf.setPassword(password);
                if (ProfileDAO.updateProfile(pf)) {
                    System.out.println(pf.getPassword());
                    System.out.println(password);          
                    response.sendRedirect(request.getContextPath() + "/views/login.jsp");
                }
            }
        }
        else {
            request.setAttribute("error", "Mã OTP không chính xác");
            request.getRequestDispatcher("/views/forgotpass.jsp").forward(request, response);
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
