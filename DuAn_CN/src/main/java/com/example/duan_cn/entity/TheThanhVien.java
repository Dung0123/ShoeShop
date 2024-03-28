package com.example.duan_cn.entity;
import jakarta.persistence.*;
import java.util.*;

@Entity
@Table(name = "TheThanhVien")
public class TheThanhVien {
  @Id
  @Column(name = "MaThe")
  private String maThe;

  @Column(name = "MauThe")
  private String mauThe;

  @Column(name = "LoaiThe")
  private String loaiThe;

  @Column(name = "NgayPhatHanh")
  private Date ngayPhatHanh;

  @Column(name = "NgayHuy")
  private Date ngayHuy;

  @Column(name = "TrangThai")
  private int trangThai;

  @ManyToOne
  @JoinColumn(name = "NguoiSoHuu")
  private KhachHang nguoiSoHuu;

  public TheThanhVien() {
  }

  public TheThanhVien(String maThe, String mauThe, String loaiThe, Date ngayPhatHanh, Date ngayHuy,
      int trangThai, KhachHang nguoiSoHuu) {
    this.maThe = maThe;
    this.mauThe = mauThe;
    this.loaiThe = loaiThe;
    this.ngayPhatHanh = ngayPhatHanh;
    this.ngayHuy = ngayHuy;
    this.trangThai = trangThai;
    this.nguoiSoHuu = nguoiSoHuu;
  }
}
