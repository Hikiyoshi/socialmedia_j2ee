/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utilities;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

/**
 *
 * @author Admin
 */
public class JpaUtils {
    private static EntityManagerFactory factory;
    
    public static EntityManager createManager(){
        if(factory == null || !factory.isOpen()){
            factory = Persistence.createEntityManagerFactory("social_media");
        }
        
        return factory.createEntityManager();
    }
    
    public static void shutdown(EntityManager manager){
        manager.close();
        factory.close();
    }
    
}
