package com.example.duan_cn.entity;
import jakarta.persistence.*;
import java.util.*;
@Entity
@Table(name = "GioHang")
public class GioHang {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "MaGioHang")
  private UUID maGioHang;

  @Column(name = "NgayTao")
  private Date ngayTao;

  @Column(name = "NgayCapNhap")
  private Date ngayCapNhap;

  @ManyToOne
  @JoinColumn(name = "NguoiSoHuu")
  private KhachHang nguoiSoHuu;

  @Column(name = "GhiChu")
  private String ghiChu;

  @Column(name = "TrangThai")
  private int trangThai;
  @OneToMany(mappedBy = "gioHang")
  private Set<GioHangChiTiet> gioHangChiTiets;
  public GioHang() {
  }

  public GioHang(UUID maGioHang, Date ngayTao, Date ngayCapNhap, KhachHang nguoiSoHuu,
      String ghiChu,
      int trangThai, Set<GioHangChiTiet> gioHangChiTiets) {
    this.maGioHang = maGioHang;
    this.ngayTao = ngayTao;
    this.ngayCapNhap = ngayCapNhap;
    this.nguoiSoHuu = nguoiSoHuu;
    this.ghiChu = ghiChu;
    this.trangThai = trangThai;
    this.gioHangChiTiets = gioHangChiTiets;
  }

  public Set<GioHangChiTiet> getGioHangChiTiets() {
    return gioHangChiTiets;
  }

  public void setGioHangChiTiets(Set<GioHangChiTiet> gioHangChiTiets) {
    this.gioHangChiTiets = gioHangChiTiets;
  }

  public UUID getMaGioHang() {
    return maGioHang;
  }

  public void setMaGioHang(UUID maGioHang) {
    this.maGioHang = maGioHang;
  }

  public Date getNgayTao() {
    return ngayTao;
  }

  public void setNgayTao(Date ngayTao) {
    this.ngayTao = ngayTao;
  }

  public Date getNgayCapNhap() {
    return ngayCapNhap;
  }

  public void setNgayCapNhap(Date ngayCapNhap) {
    this.ngayCapNhap = ngayCapNhap;
  }

  public KhachHang getNguoiSoHuu() {
    return nguoiSoHuu;
  }

  public void setNguoiSoHuu(KhachHang nguoiSoHuu) {
    this.nguoiSoHuu = nguoiSoHuu;
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

