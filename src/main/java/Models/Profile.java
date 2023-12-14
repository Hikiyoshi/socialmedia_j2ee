/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
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
@Table(name = "profile")
public class Profile {

    @Id
    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "surname")
    private String surname;

    @Column(name = "firstname")
    private String firstname;

    @Column(name = "imgAvatar")
    private String imgAvatar;

    @Column(name = "dateBirth")
    private Date dateBirth;

    @Column(name = "gender")
    private int gender;

    @Column(name = "phoneNumber")
    private String phonenumber;

    @Column(name = "email")
    private String email;

    @Column(name = "introduction")
    private String introduction;

   

    @OneToMany(mappedBy = "profile_request_friendships", fetch = FetchType.LAZY)
    private List<Friendship> request_friendships = new ArrayList<>();

    @OneToMany(mappedBy = "profile_acpect_friendships", fetch = FetchType.LAZY)
    private List<Friendship> acpect_friendships = new ArrayList<>();

    @OneToMany(mappedBy = "profile_uploaded", fetch = FetchType.LAZY)
    private List<Post> profile_post = new ArrayList<>();

    @OneToMany(mappedBy = "reactUsername", fetch = FetchType.LAZY)
    private List<Reaction> reactions = new ArrayList<>();

    @OneToMany(mappedBy = "profile_commented", fetch = FetchType.LAZY)
    private List<PostComment> profile_commented = new ArrayList<>();

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getImgAvatar() {
        return imgAvatar;
    }

    public void setImgAvatar(String imgAvatar) {
        this.imgAvatar = imgAvatar;
    }

    public Date getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(Date dateBirth) {
        this.dateBirth = dateBirth;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

  

    public List<Friendship> getRequest_friendships() {
        return request_friendships;
    }

    public void setRequest_friendships(List<Friendship> request_friendships) {
        this.request_friendships = request_friendships;
    }

    public List<Friendship> getAcpect_friendships() {
        return acpect_friendships;
    }

    public void setAcpect_friendships(List<Friendship> acpect_friendships) {
        this.acpect_friendships = acpect_friendships;
    }

    public List<Reaction> getReactions() {
        return reactions;
    }

    public void setReactions(List<Reaction> reactions) {
        this.reactions = reactions;
    }

    public String getFullname() {
        return firstname + " " + surname;
    }

}
