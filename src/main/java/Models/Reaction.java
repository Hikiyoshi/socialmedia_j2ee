/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

/**
 *
 * @author Admin
 */
@Data
@Entity
@Table(name = "reaction")
public class Reaction {
    @Id
    @Column(name = "idReact")
    private int idReact;
    
    @Column(name = "idPost")
    private String idPost;
    
    @Column(name = "username")
    private String username;
    
    @Column(name = "content")
    private String content;
    
    @Column(name = "datecreated")
    private String datecreaed;
    
    
}
