
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import lombok.Data;

/**
 *
 * @author Admin
 */
@Data
@Entity
@Table(name="post")
public class Post {
    @Id
    @Column(name="idPost")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPost;
    
    @Column(name="username") 
    private String username;
    
    @Column(name="content")
    private String content;
    
    @Column(name="datecreated")
    private Date dateCreated;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "username" , insertable = false , updatable = false)
    private Profile profile_uploaded;
    
    @OneToMany(mappedBy = "post_commented", fetch = FetchType.LAZY)
    private List<PostComment> post_comment = new ArrayList<>();
    
    @OneToMany(mappedBy = "img_post", fetch = FetchType.LAZY)
    private List<PostImage> post_img = new ArrayList<>();

    @OneToMany(mappedBy = "reactPost", fetch = FetchType.LAZY)
    private List<Reaction> reactions = new ArrayList<>();
    
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

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }
    
    public List<Reaction> getReactions() {
		return reactions;
	}

	public void setReactions(List<Reaction> reactions) {
		this.reactions = reactions;
	}

    public Post( String username, String content, Date dateCreated) {

        this.username = username;
        this.content = content;
        this.dateCreated = dateCreated;
        
    }

    public Post() {
    }
}
