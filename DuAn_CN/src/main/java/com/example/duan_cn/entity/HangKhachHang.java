package com.example.duan_cn.entity;

import jakarta.persistence.*;
@Entity
@Table(name = "HangKhachHang")
public class HangKhachHang {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "MaHang")
  private int maHang;

  @Column(name = "TenHang")
  private String tenHang;

  @Column(name = "MoTa")
  private String moTa;

  @Column(name = "DiemToiThieu")
  private int diemToiThieu;

  @Column(name = "TrangThai")
  private int trangThai;

  public HangKhachHang() {
  }

  public HangKhachHang(int maHang, String tenHang, String moTa, int diemToiThieu, int trangThai) {
    this.maHang = maHang;
    this.tenHang = tenHang;
    this.moTa = moTa;
    this.diemToiThieu = diemToiThieu;
    this.trangThai = trangThai;
  }

  public int getMaHang() {
    return maHang;
  }

  public void setMaHang(int maHang) {
    this.maHang = maHang;
  }

  public String getTenHang() {
    return tenHang;
  }

  public void setTenHang(String tenHang) {
    this.tenHang = tenHang;
  }

  public String getMoTa() {
    return moTa;
  }

  public void setMoTa(String moTa) {
    this.moTa = moTa;
  }

  public int getDiemToiThieu() {
    return diemToiThieu;
  }

  public void setDiemToiThieu(int diemToiThieu) {
    this.diemToiThieu = diemToiThieu;
  }

  public int getTrangThai() {
    return trangThai;
  }

  public void setTrangThai(int trangThai) {
    this.trangThai = trangThai;
  }
}
