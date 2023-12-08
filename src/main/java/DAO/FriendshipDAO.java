/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Friendship;
import Models.Profile;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author haidu
 */
public class FriendshipDAO {

    public static int totalPages = 0;

    public static void main(String[] args) {
//        createFriendShip("duongdat", "honggam");
//        acceptFriendShip("duongdat", "honggam");
//        List<Profile> listsFriend = getListFriendship(1, 10, "honggam", 1);
//        for (Profile o : listsFriend) {
//            System.out.println("email: " + o.getEmail());
//        }
        List<Profile> listsNotFriend = getListRequestFriendship(3, 10, "honggam");
        for (Profile o1 : listsNotFriend) {
            System.out.println("email: " + o1.getEmail());
        }
//        boolean result = deleteFriendShip("duongdat", "honggam", 1);
//        System.out.println(""+result);
//        List<Profile> listSearch = searchFriendShip(1, 10, "a", "honggam", 0);
//        for (Profile o2 : listSearch) {
//            System.out.println("email: " + o2.getEmail());
//        }
//        List<Profile> listSearch1 = searchFriendShip(1, 1, "d", "honggam");
//        for (Profile o2 : listSearch1) {
//            System.out.println("email: " + o2.getEmail());
//        }
    }
    //gửi lời mời kết bạn (userrequest: bản thân mình gửi)

    public static String createFriendShip(String userrequest, String useraccept) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("social_media");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Friendship entity = new Friendship();
            entity.setUserrequest(userrequest);
            entity.setUseraccept(useraccept);
            entity.setState(0);

            em.persist(entity);
            em.getTransaction().commit();
            return "Gửi lời mời kết bạn thành công!";
        } catch (Exception e) {
            em.getTransaction().rollback();
            return "Gửi lời mời kết bạn thất bại!";
        }
    }

    //chấp nhận lời mời kết bạn (useraccept: mình là người nhận)
    public static String acceptFriendShip(String userrequest, String useraccept) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("social_media");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            String jpql = "SELECT o FROM Friendship o WHERE o.userrequest=:userrequest AND o.useraccept=:useraccept";

            TypedQuery<Friendship> query = em.createQuery(jpql, Friendship.class);
            query.setParameter("userrequest", userrequest);
            query.setParameter("useraccept", useraccept);

            Friendship entity = query.getSingleResult();

            entity.setUserrequest(userrequest);
            entity.setUseraccept(useraccept);
            entity.setState(1);

            em.merge(entity);
            em.getTransaction().commit();

            return "Chấp nhận lời mời kết bạn thành công!";
        } catch (Exception e) {
            em.getTransaction().rollback();
            return "Chấp nhận lời mời kết bạn thất bại!";
        }
    }

    //Hủy kết bạn truyền state = 1 hoặc xóa lời mời kết bạn truyền state = 0
    public static String deleteFriendShip(String userrequest, String useraccept, int state) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("social_media");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            String jpql = "SELECT o FROM Friendship o WHERE (o.userrequest=:useraccept AND o.useraccept=:userrequest) OR (o.userrequest=:userrequest AND o.useraccept=:useraccept) AND o.state=:state";

            TypedQuery<Friendship> query = em.createQuery(jpql, Friendship.class);
            query.setParameter("userrequest", userrequest);
            query.setParameter("useraccept", useraccept);
            query.setParameter("state", state);

            Friendship entity = query.getSingleResult();

            em.remove(entity);
            em.getTransaction().commit();
            return "Xóa thành công!";
        } catch (Exception e) {
            em.getTransaction().rollback();
            return "Xóa thất bại!";
        }
    }

    //lấy ra danh sách lời mời kết bạn truyền state = 0 (có phân trang giới hạn là 10)
    public static List<Profile> getListRequestFriendship(int page, int limit, String userName) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("social_media");
        EntityManager em = emf.createEntityManager();
        List<Profile> listProfile = new ArrayList<>();
        try {
            em.getTransaction().begin();

            String jpql = "SELECT o FROM Friendship o WHERE o.useraccept=:userName AND o.state=0";

            TypedQuery<Friendship> query = em.createQuery(jpql, Friendship.class);
            query.setParameter("userName", userName);
            query.setFirstResult((page - 1) * limit);
            query.setMaxResults(limit);
            
            String countjpql = "SELECT COUNT(o) FROM Friendship o WHERE o.useraccept=:userName AND o.state=0";

            TypedQuery<Long> countQuery = em.createQuery(countjpql, Long.class);
            countQuery.setParameter("userName", userName);

            Long totalCount = countQuery.getSingleResult();
            totalPages = (int) Math.ceil((double) totalCount / limit);
            
            List<Friendship> list = query.getResultList();
            for (Friendship o : list) {
                if (o.getUseraccept().equals(userName)) {
                    listProfile.add(o.getProfile_request_friendships());
                }
                if (o.getUserrequest().equals(userName)) {
                    listProfile.add(o.getProfile_acpect_friendships());
                }
            }
            em.getTransaction().commit();
            System.out.println("Xuất tất cả danh sách bạn bè1 thành công!");
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Xuất tất cả danh sách bạn bè1 thất bại!");
        }
        return listProfile;
    }

    //lấy ra danh sách bạn bè truyền state = 1 (có phân trang giới hạn là 10)
    public static List<Profile> getListFriendship(int page, int limit, String userName) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("social_media");
        EntityManager em = emf.createEntityManager();
        List<Profile> listProfile = new ArrayList<>();
        try {
            em.getTransaction().begin();

            String jpql = "SELECT o FROM Friendship o WHERE (o.userrequest=:userName OR o.useraccept=:userName) AND o.state=1";

            TypedQuery<Friendship> query = em.createQuery(jpql, Friendship.class);
            query.setParameter("userName", userName);
//            query.setFirstResult((page - 1) * limit);
//            query.setMaxResults(limit);
            
            String countjpql = "SELECT COUNT(o) FROM Friendship o WHERE (o.userrequest=:userName OR o.useraccept=:userName) AND o.state=1";

            TypedQuery<Long> countQuery = em.createQuery(countjpql, Long.class);
            countQuery.setParameter("userName", userName);

            Long totalCount = countQuery.getSingleResult();
            totalPages = (int) Math.ceil((double) totalCount / limit);

            List<Friendship> list = query.getResultList();
            for (Friendship o : list) {
                if (o.getUseraccept().equals(userName)) {
                    listProfile.add(o.getProfile_request_friendships());
                }
                if (o.getUserrequest().equals(userName)) {
                    listProfile.add(o.getProfile_acpect_friendships());
                }
            }
            em.getTransaction().commit();
            System.out.println("Xuất tất cả danh sách bạn bè2 thành công!");
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Xuất tất cả danh sách bạn bè2 thất bại!");
        }
        return listProfile;
    }

    //Search danh sách bạn bè truyền state = 1 hoặc Search danh sách lời mời kết bạn truyền state = 0 (có phân trang giới hạn là 10)
    public static List<Profile> searchFriendShip(int page, int limit, String q, String userName, int state) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("social_media");
        EntityManager em = emf.createEntityManager();
        List<Profile> listProfile = new ArrayList<>();
        try {
            em.getTransaction().begin();

            String jpql = "SELECT o FROM Friendship o, Profile p WHERE (p.surname LIKE CONCAT('%', :q, '%') OR p.firstname LIKE CONCAT('%', :q, '%')) AND p.username !=:userName AND p.username= o.userrequest AND o.state = :state";

            TypedQuery<Friendship> query = em.createQuery(jpql, Friendship.class);
            query.setParameter("q", q);
            query.setParameter("userName", userName);
            query.setParameter("state", state);
            query.setFirstResult((page - 1) * limit);
            query.setMaxResults(limit);
            
            String countjpql = "SELECT COUNT(o) FROM Friendship o, Profile p WHERE (p.surname LIKE CONCAT('%', :q, '%') OR p.firstname LIKE CONCAT('%', :q, '%')) AND p.username !=:userName AND p.username= o.userrequest AND o.state = :state";

            TypedQuery<Long> countQuery = em.createQuery(countjpql, Long.class);
            countQuery.setParameter("q", q);
            countQuery.setParameter("userName", userName);
            countQuery.setParameter("state", state);

            Long totalCount = countQuery.getSingleResult();
            totalPages = (int) Math.ceil((double) totalCount / limit);

            List<Friendship> list = query.getResultList();
            for (Friendship o : list) {
                listProfile.add(o.getProfile_request_friendships());
            }
            em.getTransaction().commit();
            System.out.println("Xuất tất cả danh sách bạn bè3 thành công!");
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Xuất tất cả danh sách bạn bè3 thất bại!");
        }
        return listProfile;
    }
}
