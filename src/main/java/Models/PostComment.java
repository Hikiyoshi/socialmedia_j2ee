/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import lombok.Data;

@Data
@Entity
@Table(name = "postcomment")
public class PostComment {
    @Id
    @Column(name = "idComment")
    private int idComment;
    
    @Column(name = "idPost")
    private int idPost;
    
    @Column(name = "username")
    private String username;
    
    @Column(name = "content")
    private String content;
    
    @Column(name = "datecreated")
    private LocalDateTime datecreated;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "username", insertable = false, updatable = false)
    private Profile commented_profile;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idPost", insertable = false, updatable = false)
    private Post commented_post;

	public int getIdComment() {
		return idComment;
	}

	public void setIdComment(int idComment) {
		this.idComment = idComment;
	}

	public int getIdPost() {
		return idPost;
	}

	public void setIdPost(int idPost) {
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
        
        public String toString(){
            return "IdComment: " + idComment + " IdPost: " + idPost + " Username: " + username + " Content: " + content +" DateCreated: " + datecreated;
        }
}
