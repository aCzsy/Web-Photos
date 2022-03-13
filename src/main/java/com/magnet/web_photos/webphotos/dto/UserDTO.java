package com.magnet.web_photos.webphotos.dto;

import com.magnet.web_photos.webphotos.entity.Role;

import java.util.HashSet;
import java.util.Set;

public class UserDTO {
    private Long id;
    private String username;
    private String password;
    private String firstname;
    private String lastname;
    private Set<Role> roles = new HashSet<>();
    private byte [] user_image;

    public UserDTO(){

    }

    public UserDTO(Long id, String username, String password, String firstname, String lastname, Set<Role> roles) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.roles = roles;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public byte[] getUser_image() {
        return user_image;
    }

    public void setUser_image(byte[] user_image) {
        this.user_image = user_image;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
