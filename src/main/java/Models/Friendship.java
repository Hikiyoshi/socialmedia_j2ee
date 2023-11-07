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
import lombok.Data;

/**
 *
 * @author Admin
 */
@Data
@Entity
@Table(name = "friendship")
public class Friendship {
    @Id
    @Column(name = "userrequest")
    private String userrequest;
    
    @Id
    @Column(name = "useraccept")
    private String useraccept;
    
    private int state;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userrequest", insertable=false, updatable=false)
    private Profile profile_request_friendships;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "useraccept", insertable=false, updatable=false)
    private Profile profile_acpect_friendships;
    
    public String getUserrequest() {
        return userrequest;
    }

    public Profile getProfile_request_friendships() {
		return profile_request_friendships;
	}

	public Profile getProfile_acpect_friendships() {
		return profile_acpect_friendships;
	}

	public void setProfile_request_friendships(Profile profile_request_friendships) {
		this.profile_request_friendships = profile_request_friendships;
	}

	public void setProfile_acpect_friendships(Profile profile_acpect_friendships) {
		this.profile_acpect_friendships = profile_acpect_friendships;
	}

	public void setUserrequest(String userrequest) {
        this.userrequest = userrequest;
    }

    public String getUseraccept() {
        return useraccept;
    }

    public void setUseraccept(String useraccept) {
        this.useraccept = useraccept;
    }
     public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
