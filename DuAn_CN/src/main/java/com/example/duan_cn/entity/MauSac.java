package com.example.duan_cn.entity;
import jakarta.persistence.*;
@Entity
@Table(name = "mausac")
public class MauSac {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maMauSac")
    private Long maMauSac;

    @Column(name = "mauSac")
    private String mauSac;

  public MauSac() {
  }

  public MauSac(Long maMauSac, String mauSac) {
    this.maMauSac = maMauSac;
    this.mauSac = mauSac;
  }

  public Long getMaMauSac() {
    return maMauSac;
  }

  public void setMaMauSac(Long maMauSac) {
    this.maMauSac = maMauSac;
  }

  public String getMauSac() {
    return mauSac;
  }

  public void setMauSac(String mauSac) {
    this.mauSac = mauSac;
  }
}
