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

@Data
@Entity
@Table(name = "postimage")
public class PostImage {
    @Id
    @Column(name = "id")
    private int id;
    
    @Column(name = "idPost")
    private String idPost;
    
    @Column(name = "img")
    private String img;
}
