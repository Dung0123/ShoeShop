package com.example.duan_cn.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "AnhSanPham")
public class AnhSanPham {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long maAnhSanPham;
  @Column(name = "anhSanPham")
  private String anhSanpham;


  @Column(name = "MASANPHAM")
  private Long maSanPham;
  public AnhSanPham() {
  }

  public Long getMaSanPham() {
    return maSanPham;
  }

  public void setMaSanPham(Long maSanPham) {
    this.maSanPham = maSanPham;
  }

  public AnhSanPham(long maAnhSanPham, String anhSanpham) {
    this.maAnhSanPham = maAnhSanPham;
    this.anhSanpham = anhSanpham;
  }

  public long getMaAnhSanPham() {
    return maAnhSanPham;
  }

  public void setMaAnhSanPham(long maAnhSanPham) {
    this.maAnhSanPham = maAnhSanPham;
  }

  public String getAnhSanpham() {
    return anhSanpham;
  }

  public void setAnhSanpham(String anhSanpham) {
    this.anhSanpham = anhSanpham;
  }
}
