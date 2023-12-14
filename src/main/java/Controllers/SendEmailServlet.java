package Controllers;

import DAO.ProfileDAO;
import Models.Profile;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Random;

@WebServlet(urlPatterns = {"/sendemail"})
public class SendEmailServlet extends HttpServlet {

    static public String OTP;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("user");
        if (username.equals("")) {
            response.getWriter().write("Không được để trống");
        } else {
            try {
                if (ProfileDAO.selectByUsername(username) != null) {
                    Profile p = ProfileDAO.selectByUsername(username);
                    String email = p.getEmail();
                    sendOTP(request, response, email);
                } else {
                    response.getWriter().write("Tên đăng nhâp không tồn tại");
                }

            } catch (Exception e) {
                System.out.println("Lỗi: " + e);
            }
        }
    }

    public void sendOTP(HttpServletRequest req, HttpServletResponse resp, String email) throws IOException {

        try {

            OTP = getRandom();
            System.out.println(OTP);
            String from = "ShopBanSachNhom9@gmail.com";
            String pass = "bxux rtqq uhso hjzi";
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from, pass);
                }
            };
            Session session = Session.getInstance(props, auth);
            MimeMessage msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML;charset=UTF-8");
            msg.setFrom(from);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            msg.setSubject("OTP lấy lại mật khẩu");
            msg.setSentDate(new Date());
            msg.setText("Mã OTP : " + OTP, "UTF-8");
            resp.setContentType("text/plain");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write("Mã OTP đã được gửi đến " + email);
            Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
}
