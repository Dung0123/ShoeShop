package com.example.duan_cn.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "SanPham")
public class SanPham {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "MaSanPham")
  private Long maSanPham;

  @Column(name = "TenSanPham")
  private String tenSanPham;


  @Column(name = "GiaHienHanh")
  private Double giaHienHanh;
  @Column(name = "size")
  private Integer size;
  @Column(name = "SoLuongTon")
  private Integer soLuongTon;

  @Column(name = "MoTa")
  private String moTa;

  @ManyToOne
  @JoinColumn(name = "maDanhMuc")
  private DanhMuc loaiSanPhamEntity;

  @ManyToOne
  @JoinColumn(name = "maChatLieu")
  private ChatLieu chatLieuEntity;

  @ManyToOne
  @JoinColumn(name = "maMauSac")
  private MauSac mauSacEntity;

  @ManyToOne
  @JoinColumn(name = "maNhaSanXuat")
  private NhaSanXuat nhaSanXuatEntity;
  @Column(name = "trangthai")
  private Integer trangthai;
  @ManyToOne(cascade = CascadeType.PERSIST)
  @JoinColumn(name = "maAnhSanPham")
  private AnhSanPham anhSanPhamEntity;
  // Getters and setters
  @Column(insertable=false, updatable=false)
  private Long maAnhSanpham;
  public SanPham() {
  }

  public Long getMaAnhSanpham() {
    return maAnhSanpham;
  }

  public void setMaAnhSanpham(Long maAnhSanpham) {
    this.maAnhSanpham = maAnhSanpham;
  }

  public long getMaSanPham() {
    return maSanPham;
  }
  public SanPham(Long maSanPham, String tenSanPham, Double giaHienHanh, Integer size,
      Integer soLuongTon, String moTa, DanhMuc loaiSanPhamEntity, ChatLieu chatLieuEntity,
      MauSac mauSacEntity, NhaSanXuat nhaSanXuatEntity, Integer trangthai,
      AnhSanPham anhSanPhamEntity) {
    this.maSanPham = maSanPham;
    this.tenSanPham = tenSanPham;
    this.giaHienHanh = giaHienHanh;
    this.size = size;
    this.soLuongTon = soLuongTon;
    this.moTa = moTa;
    this.loaiSanPhamEntity = loaiSanPhamEntity;
    this.chatLieuEntity = chatLieuEntity;
    this.mauSacEntity = mauSacEntity;
    this.nhaSanXuatEntity = nhaSanXuatEntity;
    this.trangthai = trangthai;
    this.anhSanPhamEntity = anhSanPhamEntity;
  }

  public SanPham(Long maSanPham, String tenSanPham, String chatLieu, BigDecimal giaHienHanh,
      Integer size, Integer soLuongTon, String moTa, String danhMucSanPham, String chatLieu1,
      String mauSac, String nhaSanXuat, Integer trangthai, String newAnh) {

  }


  public void setMaSanPham(Long maSanPham) {
    this.maSanPham = maSanPham;
  }

  public String getTenSanPham() {
    return tenSanPham;
  }

  public void setTenSanPham(String tenSanPham) {
    this.tenSanPham = tenSanPham;
  }

  public Double getGiaHienHanh() {
    return giaHienHanh;
  }

  public void setGiaHienHanh(Double giaHienHanh) {
    this.giaHienHanh = giaHienHanh;
  }

  public Integer getSize() {
    return size;
  }

  public void setSize(Integer size) {
    this.size = size;
  }

  public Integer getSoLuongTon() {
    return soLuongTon;
  }

  public void setSoLuongTon(Integer soLuongTon) {
    this.soLuongTon = soLuongTon;
  }

  public String getMoTa() {
    return moTa;
  }

  public void setMoTa(String moTa) {
    this.moTa = moTa;
  }

  public DanhMuc getLoaiSanPhamEntity() {
    return loaiSanPhamEntity;
  }

  public void setLoaiSanPhamEntity(DanhMuc loaiSanPhamEntity) {
    this.loaiSanPhamEntity = loaiSanPhamEntity;
  }

  public ChatLieu getChatLieuEntity() {
    return chatLieuEntity;
  }

  public void setChatLieuEntity(ChatLieu chatLieuEntity) {
    this.chatLieuEntity = chatLieuEntity;
  }

  public MauSac getMauSacEntity() {
    return mauSacEntity;
  }

  public void setMauSacEntity(MauSac mauSacEntity) {
    this.mauSacEntity = mauSacEntity;
  }

  public NhaSanXuat getNhaSanXuatEntity() {
    return nhaSanXuatEntity;
  }

  public void setNhaSanXuatEntity(NhaSanXuat nhaSanXuatEntity) {
    this.nhaSanXuatEntity = nhaSanXuatEntity;
  }

  public Integer getTrangthai() {
    return trangthai;
  }

  public void setTrangthai(Integer trangthai) {
    this.trangthai = trangthai;
  }

  public AnhSanPham getAnhSanPhamEntity() {
    return anhSanPhamEntity;
  }

  public void setAnhSanPhamEntity(AnhSanPham anhSanPhamEntity) {
    this.anhSanPhamEntity = anhSanPhamEntity;
  }
}
