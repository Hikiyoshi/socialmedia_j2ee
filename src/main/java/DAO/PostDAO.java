/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Post;
import Models.PostImage;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TemporalType;
import jakarta.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



/**
 *
 * @author Admin
 */
public class PostDAO {
    
    public static boolean createPost(Post p){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            em.persist(p);
            em.getTransaction().commit();
            System.out.println("Thêm thành công");
            
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Thêm thất bại");
            return false;
        } finally{
            JpaUtils.shutdown(em);
        }
    }
    
  public static boolean createImage(PostImage p){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            em.persist(p);
            em.getTransaction().commit();
            System.out.println("Thêm thành công");
            
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Thêm thất bại");
            return false;
        } finally{
            JpaUtils.shutdown(em);
        }
    }
    public static List<PostImage> findImageById(int idPost){
        EntityManager em = JpaUtils.createManager();
    try {
        em.getTransaction().begin();
        // Giả sử có một trường 'post' trong entity PostImage thể hiện quan hệ nhiều-đến-một với bài viết.
        String jpql = "SELECT pi FROM PostImage pi WHERE pi.idPost = :id";
        
        TypedQuery<PostImage> query = em.createQuery(jpql, PostImage.class);
        query.setParameter("id", idPost);
        List<PostImage> images = query.getResultList();
        em.getTransaction().commit();
        System.out.println("Tìm kiếm hình ảnh thành công!");
        return images;
    } catch (Exception e) {
        em.getTransaction().rollback();
        System.out.println("Tìm kiếm hình ảnh thất bại!");
        return null;
    } finally {
        JpaUtils.shutdown(em);
    }
    }
    
    public static List<Post> readAllPost(){
        EntityManager em = JpaUtils.createManager();
        try {
            em.getTransaction().begin();
            
            String jpql = "SELECT p FROM Post p ORDER BY p.dateCreated DESC";
            
            TypedQuery<Post> query = em.createQuery(jpql, Post.class);
            List<Post> list = query.getResultList();
            em.getTransaction().commit();
            System.out.println("Doc thanh cong");
            return list;
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("doc that bai");
            return null;
        } finally {
            JpaUtils.shutdown(em);
        }
    }
    
    public static String updatePost(Post p){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            if(em.find(Post.class, p.getIdPost()) != null){
                em.merge(p);
                em.getTransaction().commit();
                return "Sua thanh cong";
            }
            else
                return "Khong tim thay bai viet muon sua";
        } catch (Exception e) {
            em.getTransaction().rollback();
            return "Sua that bai";
        } finally {
            JpaUtils.shutdown(em);
        }
    }
    
    public static boolean deletePost(String idPost){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            Post entity = em.find(Post.class, idPost);
            
            em.remove(entity);
            
            em.getTransaction().commit();
            System.out.println("Xoa thanh cong");
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Xoa that bai");
            return false;
        } finally {
            JpaUtils.shutdown(em);
        }
    }
    
    public static List<Post> findContent(String content){
        EntityManager em = JpaUtils.createManager();
        List<Post> list = new ArrayList<>();
        
        try {
            em.getTransaction().begin();
            
            String jpql = "SELECT p FROM Post p WHERE p.content like :find";
            
            TypedQuery<Post> query = em.createQuery(jpql, Post.class);
            query.setParameter("find", "%"+ content +"%");
            list = query.getResultList();
            
            em.getTransaction().commit();
            System.out.println("Tim kiem content thanh cong");
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Tim kiem content that bai");
        } finally {
            JpaUtils.shutdown(em);
        }
        
        return list;
    }
    
    public static Post findById(String id){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            Post entity = em.find(Post.class, id);
            
            em.getTransaction().commit();
            System.out.println("Tim kiem id thanh cong!");
            
            return entity;
            
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Tim kiem id that bai!");
            return null;
        } finally {
            JpaUtils.shutdown(em);
        }
    }
    
    public static List<Post> findByDate(Date start, Date end){
        List<Post> list = new ArrayList<>();
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            String spql = "SELECT p FROM Post p WHERE p.datecreated between :startDate and :endDate";
            
            TypedQuery<Post> query = em.createQuery(spql,Post.class);
            query.setParameter("startDate", start, TemporalType.DATE);
            query.setParameter("endDate", end, TemporalType.DATE);
            
            list = query.getResultList();
            
            em.getTransaction().commit();
            
            System.out.println("Tim kiem ngay thanh cong!");
            
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
            System.out.println("Tim kiem ngay that bai!");
        } finally {
            JpaUtils.shutdown(em);
        }
        
        return list;
    }
    
    public static List<Post> findByUsernamePages(String username,int page, int limit){
        EntityManager em = JpaUtils.createManager();
        List<Post> list = new ArrayList<>();
        
            try {
                em.getTransaction().begin();
                
                String sqpl = "SELECT p FROM Post p WHERE p.username = :username ORDER BY p.dateCreated DESC";
                
                TypedQuery<Post> query = em.createQuery(sqpl, Post.class);
                query.setParameter("username", username);
                
                //with page is the number of first position in list post, start with 0
                //limit is the max number of post which we wanna read 
                query.setFirstResult(page*limit);
                query.setMaxResults(limit);
                
                list = query.getResultList();
                
                em.getTransaction().commit();
            } catch (Exception e) {
                e.printStackTrace();
                em.getTransaction().rollback();
                System.out.println("Tim that bai");
            } finally {
                JpaUtils.shutdown(em);
            }
        
        return list;
    }
    
    public static int countMaxPagefindByUsernamePages(String username,int limited){
        EntityManager em = JpaUtils.createManager();
        int result = 0;
        
            try {
                em.getTransaction().begin();
                
                String sqpl = "SELECT COUNT(p) FROM Post p WHERE p.username = :username";
                
                TypedQuery<Long> query = em.createQuery(sqpl, Long.class);
                query.setParameter("username", username);
                
                Long TotalAmuont = query.getSingleResult();
                result = (int) Math.ceil((double)TotalAmuont/limited);
                
                em.getTransaction().commit();
            } catch (Exception e) {
                e.printStackTrace();
                em.getTransaction().rollback();
                System.out.println("Dem that bai");
            } finally {
                JpaUtils.shutdown(em);
}
        
        return result;
    }
}
