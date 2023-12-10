/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.PostComment;
import Utilities.JpaUtils;
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
public class PostCommentDAO {
    
    public static boolean createPostComment(PostComment pm){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            em.persist(pm);
            em.getTransaction().commit();
            System.out.println("Them thanh cong");
            return true;
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Them that bai");
            return false;
        } finally {
            JpaUtils.shutdown(em);
        }
    }
    
    public static List<PostComment> readAll(){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            String jpql = "SELECT pm FROM PostComment pm";
            
            TypedQuery<PostComment> query = em.createQuery(jpql, PostComment.class);
            
            List<PostComment> list = query.getResultList();
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
    
    public static String updatePostComment(PostComment pm){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            if(em.find(PostComment.class, pm.getIdComment()) != null){
                em.merge(pm);
                em.getTransaction().commit();
                return "Sua thanh cong";
            }
            else
                return "Khong tim thay";
        } catch (Exception e) {
            em.getTransaction().rollback();
            return "Sua that bai";
        } finally {
            JpaUtils.shutdown(em);
        }
    }
    
    public static boolean deletePostComment(String idComment){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            PostComment entity = em.find(PostComment.class, idComment);
            
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
    
    public static PostComment findById(String idComment){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            PostComment entity = em.find(PostComment.class, idComment);
            
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
    
    public static List<PostComment> findContent(String content){
        EntityManager em = JpaUtils.createManager();
        List<PostComment> list = new ArrayList<>();
        
        try {
            em.getTransaction().begin();
            
            String jpql = "SELECT pm FROM PostComment pm WHERE pm.content like :find";
            
            TypedQuery<PostComment> query = em.createQuery(jpql, PostComment.class);
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
    
    public static List<PostComment> findByDate(Date start, Date end){
        List<PostComment> list = new ArrayList<>();
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            String spql = "SELECT pm FROM PostComment pm WHERE pm.datecreated between :startDate and :endDate";
            
            TypedQuery<PostComment> query = em.createQuery(spql,PostComment.class);
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
    
    public static List<PostComment> findByPost(String idPost){
        List<PostComment> result = new ArrayList<>();
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            String spql = "SELECT pm FROM PostComment pm WHERE pm.idPost = :isPost";
            
            TypedQuery<PostComment> query = em.createQuery(spql, PostComment.class);
            query.setParameter("idPost", idPost);
            
            result = query.getResultList();
            
            em.getTransaction().commit();
            System.out.println("Tim thanh cong!");
            
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Tim that bai!");
        } finally {
            JpaUtils.shutdown(em);
        }
        
        return result;
    }
}
