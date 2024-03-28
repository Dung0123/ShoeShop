package com.example.duan_cn.entity;

import jakarta.persistence.*;
import java.util.*;

@Entity
@Table(name = "KhachHang")
public class KhachHang {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "MaKhachHang")
  private Long maKhachHang;

  @Column(name = "TenKhachHang")
  private String tenKhachHang;

  @Column(name = "SinhNhat")
  private Date sinhNhat;

  @Column(name = "DiaChi")
  private String diaChi;

  @Column(name = "SoDienThoai")
  private String soDienThoai;

  @Column(name = "Email")
  private String email;

  @Column(name = "GioiTinh")
  private boolean gioiTinh;

  @Column(name = "ChungMinhThu")
  private String chungMinhThu;

  @Column(name = "SoCanCuoc")
  private String soCanCuoc;

  @Column(name = "AnhDaiDien")
  private String anhDaiDien;

  @Column(name = "TrangThai")
  private int trangThai;

  @Column(name = "DiemTichLuy")
  private int diemTichLuy;

  @ManyToOne
  @JoinColumn(name = "HangKhachHang")
  private HangKhachHang hangKhachHang;

  @ManyToOne
  @JoinColumn(name = "NguoiGioiThieu")
  private KhachHang nguoiGioiThieu;

  public KhachHang() {
  }

  public KhachHang(Long maKhachHang, String tenKhachHang, Date sinhNhat, String diaChi,
      String soDienThoai, String email, boolean gioiTinh, String chungMinhThu, String soCanCuoc,
      String anhDaiDien, int trangThai, int diemTichLuy, HangKhachHang hangKhachHang,
      KhachHang nguoiGioiThieu) {
    this.maKhachHang = maKhachHang;
    this.tenKhachHang = tenKhachHang;
    this.sinhNhat = sinhNhat;
    this.diaChi = diaChi;
    this.soDienThoai = soDienThoai;
    this.email = email;
    this.gioiTinh = gioiTinh;
    this.chungMinhThu = chungMinhThu;
    this.soCanCuoc = soCanCuoc;
    this.anhDaiDien = anhDaiDien;
    this.trangThai = trangThai;
    this.diemTichLuy = diemTichLuy;
    this.hangKhachHang = hangKhachHang;
    this.nguoiGioiThieu = nguoiGioiThieu;
  }


  public Long getMaKhachHang() {
    return maKhachHang;
  }

  public void setMaKhachHang(Long maKhachHang) {
    this.maKhachHang = maKhachHang;
  }

  public String getTenKhachHang() {
    return tenKhachHang;
  }

  public void setTenKhachHang(String tenKhachHang) {
    this.tenKhachHang = tenKhachHang;
  }

  public Date getSinhNhat() {
    return sinhNhat;
  }

  public void setSinhNhat(Date sinhNhat) {
    this.sinhNhat = sinhNhat;
  }

  public String getDiaChi() {
    return diaChi;
  }

  public void setDiaChi(String diaChi) {
    this.diaChi = diaChi;
  }

  public String getSoDienThoai() {
    return soDienThoai;
  }

  public void setSoDienThoai(String soDienThoai) {
    this.soDienThoai = soDienThoai;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public boolean isGioiTinh() {
    return gioiTinh;
  }

  public void setGioiTinh(boolean gioiTinh) {
    this.gioiTinh = gioiTinh;
  }

  public String getChungMinhThu() {
    return chungMinhThu;
  }

  public void setChungMinhThu(String chungMinhThu) {
    this.chungMinhThu = chungMinhThu;
  }

  public String getSoCanCuoc() {
    return soCanCuoc;
  }

  public void setSoCanCuoc(String soCanCuoc) {
    this.soCanCuoc = soCanCuoc;
  }

  public String getAnhDaiDien() {
    return anhDaiDien;
  }

  public void setAnhDaiDien(String anhDaiDien) {
    this.anhDaiDien = anhDaiDien;
  }

  public int getTrangThai() {
    return trangThai;
  }

  public void setTrangThai(int trangThai) {
    this.trangThai = trangThai;
  }

  public int getDiemTichLuy() {
    return diemTichLuy;
  }

  public void setDiemTichLuy(int diemTichLuy) {
    this.diemTichLuy = diemTichLuy;
  }

  public HangKhachHang getHangKhachHang() {
    return hangKhachHang;
  }

  public void setHangKhachHang(HangKhachHang hangKhachHang) {
    this.hangKhachHang = hangKhachHang;
  }

  public KhachHang getNguoiGioiThieu() {
    return nguoiGioiThieu;
  }

  public void setNguoiGioiThieu(KhachHang nguoiGioiThieu) {
    this.nguoiGioiThieu = nguoiGioiThieu;
  }
}
