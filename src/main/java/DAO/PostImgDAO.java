/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.PostComment;
import Models.PostImage;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

/**
 *
 * @author Admin
 */
public class PostImgDAO {
    
    public static boolean createPostImg(PostImage pi){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            em.persist(pi);
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
    
    public static List<PostImage> readAll(){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            String jpql = "SELECT pi FROM PostImage pi";
            
            TypedQuery<PostImage> query = em.createQuery(jpql, PostImage.class);
            
            List<PostImage> list = query.getResultList();
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
    
    public static String updatePostImage(PostImage pi){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            if(em.find(PostImage.class, pi.getId()) != null){
                em.merge(pi);
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
    
    public static boolean deletePostImage(String idPimg){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            PostImage entity = em.find(PostImage.class, idPimg);
            
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
    
    public static PostImage findById(String id){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            
            PostImage entity = em.find(PostImage.class, id);
            
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
}
