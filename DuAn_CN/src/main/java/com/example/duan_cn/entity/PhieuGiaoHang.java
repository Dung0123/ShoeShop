package com.example.duan_cn.entity;

import jakarta.persistence.*;
import java.util.*;

@Entity
@Table(name = "PhieuGiaoHang")
public class PhieuGiaoHang {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "MaPhieuGiao")
  private UUID maPhieuGiao;

  @Column(name = "NguoiNhan")
  private String nguoiNhan;

  @Column(name = "SdtNhan")
  private String sdtNhan;

  @Column(name = "NguoiGiao")
  private String nguoiGiao;

  @Column(name = "SdtGiao")
  private String sdtGiao;

  @Column(name = "NgayGiao")
  private Date ngayGiao;

  @Column(name = "NgayNhan")
  private Date ngayNhan;
  @Column(name = "NguoiTao")
  private String nguoiTao;

  @Column(name = "PhiGiaoHang")
  private double phiGiaoHang;

  @ManyToOne
  @JoinColumn(name = "HoaDonGiao")
  private HoaDon hoaDonGiao;

  @ManyToOne
  @JoinColumn(name = "DiaChiGiao")
  private DiaChi diaChiGiao;

  @Column(name = "GhiChu")
  private String ghiChu;

  @Column(name = "TrangThai")
  private int trangThai;

  public PhieuGiaoHang() {
  }

  public PhieuGiaoHang(UUID maPhieuGiao, String nguoiNhan, String sdtNhan, String nguoiGiao,
      String sdtGiao, Date ngayGiao, Date ngayNhan, String nguoiTao, double phiGiaoHang,
      HoaDon hoaDonGiao, DiaChi diaChiGiao, String ghiChu, int trangThai) {
    this.maPhieuGiao = maPhieuGiao;
    this.nguoiNhan = nguoiNhan;
    this.sdtNhan = sdtNhan;
    this.nguoiGiao = nguoiGiao;
    this.sdtGiao = sdtGiao;
    this.ngayGiao = ngayGiao;
    this.ngayNhan = ngayNhan;
    this.nguoiTao = nguoiTao;
    this.phiGiaoHang = phiGiaoHang;
    this.hoaDonGiao = hoaDonGiao;
    this.diaChiGiao = diaChiGiao;
    this.ghiChu = ghiChu;
    this.trangThai = trangThai;
  }

  public UUID getMaPhieuGiao() {
    return maPhieuGiao;
  }

  public void setMaPhieuGiao(UUID maPhieuGiao) {
    this.maPhieuGiao = maPhieuGiao;
  }

  public String getNguoiNhan() {
    return nguoiNhan;
  }

  public void setNguoiNhan(String nguoiNhan) {
    this.nguoiNhan = nguoiNhan;
  }

  public String getSdtNhan() {
    return sdtNhan;
  }

  public void setSdtNhan(String sdtNhan) {
    this.sdtNhan = sdtNhan;
  }

  public String getNguoiGiao() {
    return nguoiGiao;
  }

  public void setNguoiGiao(String nguoiGiao) {
    this.nguoiGiao = nguoiGiao;
  }

  public String getSdtGiao() {
    return sdtGiao;
  }

  public void setSdtGiao(String sdtGiao) {
    this.sdtGiao = sdtGiao;
  }

  public Date getNgayGiao() {
    return ngayGiao;
  }

  public void setNgayGiao(Date ngayGiao) {
    this.ngayGiao = ngayGiao;
  }

  public Date getNgayNhan() {
    return ngayNhan;
  }

  public void setNgayNhan(Date ngayNhan) {
    this.ngayNhan = ngayNhan;
  }

  public String getNguoiTao() {
    return nguoiTao;
  }

  public void setNguoiTao(String nguoiTao) {
    this.nguoiTao = nguoiTao;
  }

  public double getPhiGiaoHang() {
    return phiGiaoHang;
  }

  public void setPhiGiaoHang(double phiGiaoHang) {
    this.phiGiaoHang = phiGiaoHang;
  }

  public HoaDon getHoaDonGiao() {
    return hoaDonGiao;
  }

  public void setHoaDonGiao(HoaDon hoaDonGiao) {
    this.hoaDonGiao = hoaDonGiao;
  }

  public DiaChi getDiaChiGiao() {
    return diaChiGiao;
  }

  public void setDiaChiGiao(DiaChi diaChiGiao) {
    this.diaChiGiao = diaChiGiao;
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