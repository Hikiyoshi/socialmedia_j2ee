/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
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
    private LocalDateTime datecreated;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "username", insertable=false, updatable=false)
    private Profile reactUsername;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idPost", insertable=false, updatable=false)
    private Post reactPost;

	public int getIdReact() {
		return idReact;
	}

	public void setIdReact(int idReact) {
		this.idReact = idReact;
	}

	public String getIdPost() {
		return idPost;
	}

	public void setIdPost(String idPost) {
		this.idPost = idPost;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getDatecreated() {
		return datecreated;
	}

	public void setDatecreated(LocalDateTime datecreated) {
		this.datecreated = datecreated;
	}

	public Profile getReactUsername() {
		return reactUsername;
	}

	public void setReactUsername(Profile reactUsername) {
		this.reactUsername = reactUsername;
	}

	public Post getReactPost() {
		return reactPost;
	}

	public void setReactPost(Post reactPost) {
		this.reactPost = reactPost;
	}
    
    
}
