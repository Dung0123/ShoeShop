package com.example.duan_cn.Repository;

import com.example.duan_cn.entity.GioHang;
import com.example.duan_cn.entity.GioHangChiTiet;
import com.example.duan_cn.entity.SanPham;
import jakarta.persistence.Embeddable;
import jakarta.transaction.Transactional;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GioHangInterface extends JpaRepository<GioHangChiTiet, UUID> {

//  void addToGioHang(GioHangChiTiet gioHang);
//
//  void remove(Long id);
//
//  GioHang update(Long maSanPham, int soLuong);
//
//  void clear();
//
//  Collection<GioHangChiTiet> getAll();
//
//  int getCount();
//
//  double getAmount();
}
