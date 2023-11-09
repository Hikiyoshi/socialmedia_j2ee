/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Post;
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
    
    public static List<Post> readAllPost(){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            String jpql = "SELECT p FROM Post p";
            
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
}
