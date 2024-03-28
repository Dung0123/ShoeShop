package com.example.duan_cn.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.util.UUID;

@Entity
@Table(name = "GioHangChiTiet")
public class GioHangChiTiet {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "iD")
  private UUID uuid;

  @ManyToOne
  @JoinColumn(name = "MaGioHang")
  private GioHang gioHang;

  @ManyToOne
  @JoinColumn(name = "MaSanPham")
  private SanPham sanPham;
  @Column(name = "SoLuong")
  private int soLuong;

//  @Column(name = "GhiChu")
//  private String ghiChu;

  @Column(name = "TrangThai")
  private int trangThai;

  public GioHangChiTiet() {
  }

  public GioHangChiTiet(UUID uuid, GioHang gioHang, SanPham sanPham, int soLuong, int trangThai) {
    this.uuid = uuid;
    this.gioHang = gioHang;
    this.sanPham = sanPham;
    this.soLuong = soLuong;
    this.trangThai = trangThai;
  }

  public UUID getUuid() {
    return uuid;
  }

  public void setUuid(UUID uuid) {
    this.uuid = uuid;
  }




  public GioHang getGioHang() {
    return gioHang;
  }

  public void setGioHang(GioHang gioHang) {
    this.gioHang = gioHang;
  }

  public SanPham getSanPham() {
    return sanPham;
  }

  public void setSanPham(SanPham sanPham) {
    this.sanPham = sanPham;
  }

  public int getSoLuong() {
    return soLuong;
  }

  public void setSoLuong(int soLuong) {
    this.soLuong = soLuong;
  }

  public int getTrangThai() {
    return trangThai;
  }

  public void setTrangThai(int trangThai) {
    this.trangThai = trangThai;
  }


}
