package com.example.duan_cn.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "ChatLieu")
public class ChatLieu {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "maChatLieu")
  private Long maChatLieu;

  @Column(name = "chatLieu")
  private String chatLieu;

  public ChatLieu() {
  }

  public ChatLieu(Long maChatLieu, String chatLieu) {
    this.maChatLieu = maChatLieu;
    this.chatLieu = chatLieu;
  }

  public Long getMaChatLieu() {
    return maChatLieu;
  }

  public void setMaChatLieu(Long maChatLieu) {
    this.maChatLieu = maChatLieu;
  }

  public String getChatLieu() {
    return chatLieu;
  }

  public void setChatLieu(String chatLieu) {
    this.chatLieu = chatLieu;
  }
}

