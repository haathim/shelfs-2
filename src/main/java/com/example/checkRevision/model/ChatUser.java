package com.example.checkRevision.model;

import java.util.Objects;

public class ChatUser {

    private String username;
    private String fullName;

    public ChatUser(String username, String fullName) {
        this.username = username;
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ChatUser chatUser = (ChatUser) o;
        return Objects.equals(username, chatUser.username) && Objects.equals(fullName, chatUser.fullName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(username, fullName);
    }
}
