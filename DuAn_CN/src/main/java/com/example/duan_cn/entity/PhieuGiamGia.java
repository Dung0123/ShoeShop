package com.example.duan_cn.entity;

import jakarta.persistence.*;
import java.util.*;

@Entity
@Table(name = "PhieuGiamGia")
public class PhieuGiamGia {
  @Id
  @Column(name = "MaPhieu")
  private String maPhieu;

  @Column(name = "TenPhieu")
  private String tenPhieu;

  @Column(name = "NgayBatDau")
  private Date ngayBatDau;

  @Column(name = "NgayKetThuc")
  private Date ngayKetThuc;

  @Column(name = "GiaTriGiam")
  private double giaTriGiam;

  @Column(name = "GiaTriGiamToiDa")
  private double giaTriGiamToiDa;

  @Column(name = "HinhThucGiam")
  private boolean hinhThucGiam;

  @Column(name = "TrangThai")
  private int trangThai;

  @ManyToOne
  @JoinColumn(name = "NguoiSoHuu")
  private KhachHang nguoiSoHuu;

  public PhieuGiamGia() {
  }

  public PhieuGiamGia(String maPhieu, String tenPhieu, Date ngayBatDau, Date ngayKetThuc,
      double giaTriGiam, double giaTriGiamToiDa, boolean hinhThucGiam, int trangThai,
      KhachHang nguoiSoHuu) {
    this.maPhieu = maPhieu;
    this.tenPhieu = tenPhieu;
    this.ngayBatDau = ngayBatDau;
    this.ngayKetThuc = ngayKetThuc;
    this.giaTriGiam = giaTriGiam;
    this.giaTriGiamToiDa = giaTriGiamToiDa;
    this.hinhThucGiam = hinhThucGiam;
    this.trangThai = trangThai;
    this.nguoiSoHuu = nguoiSoHuu;
  }

  public String getMaPhieu() {
    return maPhieu;
  }

  public void setMaPhieu(String maPhieu) {
    this.maPhieu = maPhieu;
  }

  public String getTenPhieu() {
    return tenPhieu;
  }

  public void setTenPhieu(String tenPhieu) {
    this.tenPhieu = tenPhieu;
  }

  public Date getNgayBatDau() {
    return ngayBatDau;
  }

  public void setNgayBatDau(Date ngayBatDau) {
    this.ngayBatDau = ngayBatDau;
  }

  public Date getNgayKetThuc() {
    return ngayKetThuc;
  }

  public void setNgayKetThuc(Date ngayKetThuc) {
    this.ngayKetThuc = ngayKetThuc;
  }

  public double getGiaTriGiam() {
    return giaTriGiam;
  }

  public void setGiaTriGiam(double giaTriGiam) {
    this.giaTriGiam = giaTriGiam;
  }

  public double getGiaTriGiamToiDa() {
    return giaTriGiamToiDa;
  }

  public void setGiaTriGiamToiDa(double giaTriGiamToiDa) {
    this.giaTriGiamToiDa = giaTriGiamToiDa;
  }

  public boolean isHinhThucGiam() {
    return hinhThucGiam;
  }

  public void setHinhThucGiam(boolean hinhThucGiam) {
    this.hinhThucGiam = hinhThucGiam;
  }

  public int getTrangThai() {
    return trangThai;
  }

  public void setTrangThai(int trangThai) {
    this.trangThai = trangThai;
  }

  public KhachHang getNguoiSoHuu() {
    return nguoiSoHuu;
  }

  public void setNguoiSoHuu(KhachHang nguoiSoHuu) {
    this.nguoiSoHuu = nguoiSoHuu;
  }
}
