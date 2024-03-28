package com.example.duan_cn.entity;
import jakarta.persistence.*;
import java.util.*;

@Entity
@Table(name = "HoaDon")
public class HoaDon {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "MaHoaDon")
  private long maHoaDon;

  @Column(name = "NgayLap")
  private Date ngayLap;

  @Column(name = "NguoiLap")
  private String nguoiLap;

  @Column(name = "GhiChu")
  private String ghiChu;

  @Column(name = "NgayThanhToan")
  private Date ngayThanhToan;

  @Column(name = "TrangThai")
  private int trangThai;

  @ManyToOne
  @JoinColumn(name = "NguoiMua")
  private KhachHang nguoiMua;

  public HoaDon() {
  }

  public HoaDon(long maHoaDon, Date ngayLap, String nguoiLap, String ghiChu, Date ngayThanhToan,
      int trangThai, KhachHang nguoiMua) {
    this.maHoaDon = maHoaDon;
    this.ngayLap = ngayLap;
    this.nguoiLap = nguoiLap;
    this.ghiChu = ghiChu;
    this.ngayThanhToan = ngayThanhToan;
    this.trangThai = trangThai;
    this.nguoiMua = nguoiMua;
  }

  public long getMaHoaDon() {
    return maHoaDon;
  }

  public void setMaHoaDon(long maHoaDon) {
    this.maHoaDon = maHoaDon;
  }

  public Date getNgayLap() {
    return ngayLap;
  }

  public void setNgayLap(Date ngayLap) {
    this.ngayLap = ngayLap;
  }

  public String getNguoiLap() {
    return nguoiLap;
  }

  public void setNguoiLap(String nguoiLap) {
    this.nguoiLap = nguoiLap;
  }

  public String getGhiChu() {
    return ghiChu;
  }

  public void setGhiChu(String ghiChu) {
    this.ghiChu = ghiChu;
  }

  public Date getNgayThanhToan() {
    return ngayThanhToan;
  }

  public void setNgayThanhToan(Date ngayThanhToan) {
    this.ngayThanhToan = ngayThanhToan;
  }

  public int getTrangThai() {
    return trangThai;
  }

  public void setTrangThai(int trangThai) {
    this.trangThai = trangThai;
  }

  public KhachHang getNguoiMua() {
    return nguoiMua;
  }

  public void setNguoiMua(KhachHang nguoiMua) {
    this.nguoiMua = nguoiMua;
  }
}
