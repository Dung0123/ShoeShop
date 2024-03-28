package com.example.duan_cn.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "DanhMuc")
public class DanhMuc {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "maDanhMuc")
  private Long maDanhMuc;

  @Column(name = "DanhMuc")
  private String danhMucSanPham;

  public DanhMuc() {
  }

  public DanhMuc(Long maDanhMuc, String danhMucSanPham) {
    this.maDanhMuc = maDanhMuc;
    this.danhMucSanPham = danhMucSanPham;
  }

  public Long getMaDanhMuc() {
    return maDanhMuc;
  }

  public void setMaDanhMuc(Long maDanhMuc) {
    this.maDanhMuc = maDanhMuc;
  }

  public String getDanhMucSanPham() {
    return danhMucSanPham;
  }

  public void setDanhMucSanPham(String danhMucSanPham) {
    this.danhMucSanPham = danhMucSanPham;
  }
}