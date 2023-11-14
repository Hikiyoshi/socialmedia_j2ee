/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

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
@WebServlet(name = "FriendListServlet", urlPatterns = {"/FriendListServlet"})
public class FriendListServlet extends HttpServlet {

//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        // Lấy username từ session hoặc request parameter (tùy vào cách bạn thiết kế)
//        String username = "user1"; // Thay đổi thành cách lấy username thực tế của bạn
//
//        // Lấy danh sách bạn bè từ cơ sở dữ liệu
//        List<String> friendList = getFriendList(username);
//
//        // Đặt danh sách bạn bè vào request để hiển thị trên JSP
//        request.setAttribute("friendList", friendList);
//
//        // Chuyển hướng đến trang JSP để hiển thị danh sách bạn bè
//        request.getRequestDispatcher("friendList.jsp").forward(request, response);
//    }
//
//    private List<String> getFriendList(String username) {
//        List<String> friendList = new ArrayList<>();
//        // Sử dụng DataSource để lấy kết nối từ Connection Pool
//        DataSource dataSource
//                = // Lấy từ nguồn dữ liệu của bạn
//        try (Connection connection = dataSource.getConnection()) {
//            String sql = "SELECT friend_username FROM friendships WHERE username = ?";
//            try (PreparedStatement statement = connection.prepareStatement(sql)) {
//                statement.setString(1, username);
//                try (ResultSet resultSet = statement.executeQuery()) {
//                    while (resultSet.next()) {
//                        friendList.add(resultSet.getString("friend_username"));
//                    }
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            // Xử lý lỗi nếu cần
//        }
//        return friendList;
//    }

}
