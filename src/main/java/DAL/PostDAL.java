/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Post;
import jakarta.persistence.EntityManager;



/**
 *
 * @author Admin
 */
public class PostDAL {
    
    public boolean createPost(Post p){
        EntityManager em = JpaUtils.createManager();
        
        try {
            em.getTransaction().begin();
            em.persist(p);
            em.getTransaction().commit();
            
            return true;
        } catch (Exception e) {

            em.getTransaction().rollback();
            return false;
        } finally{
            JpaUtils.shutdown(em);
        }
    }
}
