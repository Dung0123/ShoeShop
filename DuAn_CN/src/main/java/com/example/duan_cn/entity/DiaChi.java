package com.example.duan_cn.entity;

import jakarta.persistence.*;
import java.util.*;

@Entity
@Table(name = "DiaChi")
public class DiaChi {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "MaDiaChi")
  private UUID maDiaChi;

  @Column(name = "TenDiaChi")
  private String tenDiaChi;

  @Column(name = "MoTaChiTiet")
  private String moTaChiTiet;

  @Column(name = "TinhThanhPho")
  private String tinhThanhPho;

  @Column(name = "QuanHuyen")
  private String quanHuyen;

  @Column(name = "PhuongXa")
  private String phuongXa;

  @Column(name = "DuongPho")
  private String duongPho;

  @ManyToOne
  @JoinColumn(name = "KhachHang")
  private KhachHang khachHang;

  public DiaChi() {
  }

  public DiaChi(UUID maDiaChi, String tenDiaChi, String moTaChiTiet, String tinhThanhPho,
      String quanHuyen, String phuongXa, String duongPho, KhachHang khachHang) {
    this.maDiaChi = maDiaChi;
    this.tenDiaChi = tenDiaChi;
    this.moTaChiTiet = moTaChiTiet;
    this.tinhThanhPho = tinhThanhPho;
    this.quanHuyen = quanHuyen;
    this.phuongXa = phuongXa;
    this.duongPho = duongPho;
    this.khachHang = khachHang;
  }

  public UUID getMaDiaChi() {
    return maDiaChi;
  }

  public void setMaDiaChi(UUID maDiaChi) {
    this.maDiaChi = maDiaChi;
  }

  public String getTenDiaChi() {
    return tenDiaChi;
  }

  public void setTenDiaChi(String tenDiaChi) {
    this.tenDiaChi = tenDiaChi;
  }

  public String getMoTaChiTiet() {
    return moTaChiTiet;
  }

  public void setMoTaChiTiet(String moTaChiTiet) {
    this.moTaChiTiet = moTaChiTiet;
  }

  public String getTinhThanhPho() {
    return tinhThanhPho;
  }

  public void setTinhThanhPho(String tinhThanhPho) {
    this.tinhThanhPho = tinhThanhPho;
  }

  public String getQuanHuyen() {
    return quanHuyen;
  }

  public void setQuanHuyen(String quanHuyen) {
    this.quanHuyen = quanHuyen;
  }

  public String getPhuongXa() {
    return phuongXa;
  }

  public void setPhuongXa(String phuongXa) {
    this.phuongXa = phuongXa;
  }

  public String getDuongPho() {
    return duongPho;
  }

  public void setDuongPho(String duongPho) {
    this.duongPho = duongPho;
  }

  public KhachHang getKhachHang() {
    return khachHang;
  }

  public void setKhachHang(KhachHang khachHang) {
    this.khachHang = khachHang;
  }
}
