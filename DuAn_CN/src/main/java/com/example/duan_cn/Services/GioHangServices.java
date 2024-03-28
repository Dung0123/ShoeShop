package com.example.duan_cn.Services;

import com.example.duan_cn.Repository.GioHangInterface;
import com.example.duan_cn.entity.GioHang;
import com.example.duan_cn.entity.GioHangChiTiet;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.function.Function;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

@SessionScope
@Service
public class GioHangServices {

  Map<Integer, GioHangChiTiet> maps = new HashMap<>();
  public void addToGioHang(GioHangChiTiet gioHang) {
    GioHangChiTiet giohangItem = maps.get(gioHang.getSanPham());
    if (giohangItem == null) {
      maps.put((int)  Integer.parseInt(String.valueOf(gioHang.getSanPham().getMaSanPham())), gioHang);
    } else {
      giohangItem.setSoLuong(giohangItem.getSoLuong() + 1);
    }
  }

  public void remove(Long id) {
    maps.remove(id);
  }

  public GioHang update(Long maSanPham, int soLuong) {
    GioHangChiTiet gioHangChiTiet = maps.get(maSanPham);
    gioHangChiTiet.setSoLuong(soLuong);
    return gioHangChiTiet.getGioHang();
  }

  public void clear() {
    maps.clear();
  }

  public Collection<GioHangChiTiet> getAll() {
    return maps.values();
  }


  public int getCount() {
    return maps.values().size();

  }

  public double getAmount() {
    return maps.values().stream()
        .mapToDouble(giohang -> giohang.getSoLuong() * Integer.parseInt(
            String.valueOf(giohang.getSanPham().getGiaHienHanh()))).sum();
  }

}
