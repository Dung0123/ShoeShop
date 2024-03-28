package com.example.duan_cn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "NhaSanXuat")
public class NhaSanXuat {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "maNhaSanXuat")
  private Long maNhaSanXuat;

  @Column(name = "nhaSanXuat")
  private String nhaSanXuat;

  public NhaSanXuat() {
  }

  public NhaSanXuat(Long maNhaSanXuat, String nhaSanXuat) {
    this.maNhaSanXuat = maNhaSanXuat;
    this.nhaSanXuat = nhaSanXuat;
  }

  public Long getMaNhaSanXuat() {
    return maNhaSanXuat;
  }

  public void setMaNhaSanXuat(Long maNhaSanXuat) {
    this.maNhaSanXuat = maNhaSanXuat;
  }

  public String getNhaSanXuat() {
    return nhaSanXuat;
  }

  public void setNhaSanXuat(String nhaSanXuat) {
    this.nhaSanXuat = nhaSanXuat;
  }
}
