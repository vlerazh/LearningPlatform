package com.example.demo.helpers;

import java.io.Serializable;

public class LoginHelper implements Serializable {

    private  String email;
    private String password;

    public LoginHelper(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getUsername() {
        return email;
    }

    public void setUsername(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
