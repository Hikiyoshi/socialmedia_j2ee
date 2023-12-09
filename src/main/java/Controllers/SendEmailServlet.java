package Controllers;

import cc.kkon.jwt.Jwts;
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
@WebServlet(urlPatterns = {"/SendEmailServlet"})
public class SendEmailServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String toEmail = request.getParameter("toEmail");
       

        // Gửi email
        sendEmail(toEmail);

        // Chuyển hướng đến trang thông báo hoặc có thể thực hiện các xử lý khác
        
    }

    private void sendEmail(String toEmail) {
        final String username = "trandinhtoan2610@gmail.com"; // Thay bằng địa chỉ email của bạn
        final String password = "jdjnxdygippcsotg"; // Thay bằng mật khẩu của bạn

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("confirm");
            message.setText("Confirm code: " + getRandom());

            Transport.send(message);

            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
}