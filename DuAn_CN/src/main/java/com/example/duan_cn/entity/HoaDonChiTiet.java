package com.example.duan_cn.entity;

import jakarta.persistence.*;
import java.util.*;
@Entity
@Table(name = "HoaDonChiTiet")
public class HoaDonChiTiet {
  @Id
  @ManyToOne
  @JoinColumn(name = "MaHoaDon")
  private HoaDon maHoaDon;

  @Id
  @ManyToOne
  @JoinColumn(name = "MaSanPham")
  private SanPham maSanPham;

  @Column(name = "SoLuong")
  private int soLuong;

  @Column(name = "DonGia")
  private double donGia;

  @Column(name = "GhiChu")
  private String ghiChu;

  @Column(name = "TrangThai")
  private int trangThai;

  public HoaDonChiTiet() {
  }

  public HoaDonChiTiet(HoaDon maHoaDon, SanPham maSanPham, int soLuong, double donGia,
      String ghiChu,
      int trangThai) {
    this.maHoaDon = maHoaDon;
    this.maSanPham = maSanPham;
    this.soLuong = soLuong;
    this.donGia = donGia;
    this.ghiChu = ghiChu;
    this.trangThai = trangThai;
  }

  public HoaDon getMaHoaDon() {
    return maHoaDon;
  }

  public void setMaHoaDon(HoaDon maHoaDon) {
    this.maHoaDon = maHoaDon;
  }

  public SanPham getMaSanPham() {
    return maSanPham;
  }

  public void setMaSanPham(SanPham maSanPham) {
    this.maSanPham = maSanPham;
  }

  public int getSoLuong() {
    return soLuong;
  }

  public void setSoLuong(int soLuong) {
    this.soLuong = soLuong;
  }

  public double getDonGia() {
    return donGia;
  }

  public void setDonGia(double donGia) {
    this.donGia = donGia;
  }

  public String getGhiChu() {
    return ghiChu;
  }

  public void setGhiChu(String ghiChu) {
    this.ghiChu = ghiChu;
  }

  public int getTrangThai() {
    return trangThai;
  }

  public void setTrangThai(int trangThai) {
    this.trangThai = trangThai;
  }
}
