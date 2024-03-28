package com.example.duan_cn.Controller;

import com.example.duan_cn.Repository.GioHangInterface;
import com.example.duan_cn.Repository.InterfaceRepositoryNSX;
import com.example.duan_cn.Repository.InterfaceReposonsitoryMauSac;
import com.example.duan_cn.Repository.InterfaceResonsitoryAnhSanPham;
import com.example.duan_cn.Repository.InterfaceResonsitoryLoaiSanPham;
import com.example.duan_cn.Repository.InterfaceResponsitoryChatLieu;
import com.example.duan_cn.Repository.SanPhamInterfaceRepository;
import com.example.duan_cn.Services.GioHangServices;
import com.example.duan_cn.entity.AnhSanPham;
import com.example.duan_cn.entity.ChatLieu;
import com.example.duan_cn.entity.GioHang;
import com.example.duan_cn.entity.GioHangChiTiet;
import com.example.duan_cn.entity.DanhMuc;
import com.example.duan_cn.entity.MauSac;
import com.example.duan_cn.entity.NhaSanXuat;
import com.example.duan_cn.entity.SanPham;
import jakarta.validation.Valid;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.StreamSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SanPhamController {

  @Autowired
  private GioHangInterface gioHangServices;
  private SanPhamInterfaceRepository repository;
  private InterfaceRepositoryNSX repositoryNSX;
  private InterfaceReposonsitoryMauSac reposonsitoryMauSac;
  private InterfaceResonsitoryLoaiSanPham resonsitoryLoaiSanPham;
  private InterfaceResponsitoryChatLieu responsitoryChatLieu;
  private InterfaceResonsitoryAnhSanPham resonsitoryAnhSanPham;

  public SanPhamController(SanPhamInterfaceRepository repository,
      InterfaceRepositoryNSX repositoryNSX, InterfaceReposonsitoryMauSac reposonsitoryMauSac,
      InterfaceResonsitoryLoaiSanPham resonsitoryLoaiSanPham,
      InterfaceResponsitoryChatLieu responsitoryChatLieu,
      InterfaceResonsitoryAnhSanPham resonsitoryAnhSanPham) {
    this.repository = repository;
    this.repositoryNSX = repositoryNSX;
    this.reposonsitoryMauSac = reposonsitoryMauSac;
    this.resonsitoryLoaiSanPham = resonsitoryLoaiSanPham;
    this.responsitoryChatLieu = responsitoryChatLieu;
    this.resonsitoryAnhSanPham = resonsitoryAnhSanPham;
  }

  @GetMapping("/trangChu")
  public String trangChu(Model model, @RequestParam("p") Optional<Integer> p) {
    int pageNumber = p.orElse(0);
    long totalElements = repository.count();
    int totalPages = (int) Math.ceil((double) totalElements / 12);
    if (pageNumber >= totalPages) {
      pageNumber = totalPages - 1;
    }
    Pageable pageable = PageRequest.of(pageNumber, 12);
    Page<SanPham> listSanPham = repository.findAll(pageable);
    System.out.println(listSanPham);
    model.addAttribute("sanPham", listSanPham);
    return "index";
  }

  @GetMapping("/trung-bay")
  public String trungbay(Model model) {
    List<SanPham> listSanPham = repository.findAll();
    model.addAttribute("sanPham", listSanPham);
    return "sanPham";
  }

  @GetMapping("/edit/{maSanPham}")
  public String chiTietSanPham(@PathVariable(name = "maSanPham") SanPham sanPham, Model model) {
    List<SanPham> listSanPham = repository.findAll();
    model.addAttribute("sanPham", listSanPham);
    model.addAttribute("sp", sanPham);
    return "chitietSP";
  }

  @GetMapping("/gio-hang")
  public String gioHang(ModelMap modelMap) {
    modelMap.addAttribute("listGioHang", gioHangServices.findAll());
    modelMap.addAttribute("TOTAL", this.getAmount());
    System.out.println(this.getAmount() + " tổng giá giỏ hàng");
    return "giohang";
  }

  @PostMapping("/search")
//  Tim kiemc cho quan li san pham
  public String Search(@RequestParam("search") String InputSearch,ModelMap modelMap) {
   modelMap.addAttribute("sanPham",this.timKiem(InputSearch));
    return "viewSanPham";
  }
  @PostMapping("/search2")
//  Tim kiemc cho quan li san pham
  public String Search2(@RequestParam("search") String InputSearch,ModelMap modelMap) {
    modelMap.addAttribute("sanPham",this.timKiem(InputSearch));
    return "sanPham";
  }
  @PostMapping("/search3")
//  Tim kiemc cho quan li san pham
  public String Search3(@RequestParam("search") String InputSearch,ModelMap modelMap) {
    modelMap.addAttribute("sanPham",this.timKiem(InputSearch));
    return "chitietSP";
  }
//  public List<SanPham> timKiem2(String sanPhamName) {
//    List<SanPham> sanPhamList = repository.findAll();
//    List<SanPham> sanPhams = new ArrayList<>();
//    for (SanPham sp : sanPhamList) {
//      if (sanPhamName.contains(sp.getTenSanPham())) {
//        sanPhams.add(sp);
//      }
//    }
//    return sanPhams;
//  }
  public List<SanPham> timKiem(String sanPhamName) {
    List<SanPham> sanPhamList = repository.findAll();
    List<SanPham> sanPhams = new ArrayList<>();
    for (SanPham sp : sanPhamList) {
      if (sanPhamName.contains(sp.getTenSanPham())) {
        sanPhams.add(sp);
      }
    }
    return sanPhams;
  }
  @PostMapping("/updateSoLuong")
  public String updateSoLuong(@RequestParam("id") Long id, @RequestParam("soLuong") Integer soLuong) {
    GioHangChiTiet gioHangChiTiet = this.update(id, soLuong);
    if (gioHangChiTiet != null) {
      return "redirect:/gio-hang";
    } else {
      // Xử lý trường hợp không tìm thấy sản phẩm
      return "redirect:/gio-hang";
    }
  }

  public GioHangChiTiet update(Long maSanPham, int soLuong) {
    GioHangChiTiet gioHangChiTiet = findSpToupdate(maSanPham);
    if (gioHangChiTiet != null) {
      gioHangChiTiet.setSoLuong(soLuong);
      gioHangServices.save(gioHangChiTiet);
    }
    return gioHangChiTiet;
  }

  public GioHangChiTiet findSpToupdate(Long maSanpham) {
    for (GioHangChiTiet sp : gioHangServices.findAll()) {
      if (maSanpham.equals(sp.getSanPham().getMaSanPham())) {
        return sp; // Trả về sản phẩm tìm thấy
      }
    }
    return null; // Trả về null nếu không tìm thấy sản phẩm nào khớp với UUID
  }

  public GioHangChiTiet findSp(Long uuid) {
    for (GioHangChiTiet sp : gioHangServices.findAll()) {
      if (uuid.equals(sp.getSanPham().getMaSanPham())) {
        sp.setUuid(sp.getUuid());
        sp.setSoLuong(sp.getSoLuong() + 1);
        return sp; // Trả về sản phẩm tìm thấy với số lượng đã cập nhật
      }
    }
    return null; // Trả về null nếu không tìm thấy sản phẩm nào khớp với UUID
  }
  public double getAmount() {
    Iterable<GioHangChiTiet> gioHangs = gioHangServices.findAll();
    return StreamSupport.stream(gioHangs.spliterator(), false)
        .mapToDouble(giohang -> giohang.getSoLuong() *
            giohang.getSanPham().getGiaHienHanh().doubleValue())
        .sum();
  }
  @GetMapping("/addSpToGioHang/{maSanPham}")
  public String addSanPhamToGioHang(@PathVariable("maSanPham") Long maSanPham) {
    Optional<SanPham> sp = repository.findById(Integer.parseInt(String.valueOf(maSanPham)));
    SanPham sanPhamTonTai = sp.get();
    if (sanPhamTonTai != null) {
      Long maSanPham1 = sanPhamTonTai.getMaSanPham();
      GioHangChiTiet gioHangChiTietOptional = findSp(maSanPham1);
      if (gioHangChiTietOptional != null && gioHangChiTietOptional.getSanPham() != null) {
        if (gioHangChiTietOptional.getSanPham().getMaSanPham() == sanPhamTonTai.getMaSanPham()) {
          GioHangChiTiet gioHangChiTietTonTai = gioHangChiTietOptional;
          gioHangChiTietTonTai.setUuid(gioHangChiTietTonTai.getUuid());
          gioHangChiTietTonTai.setSoLuong(gioHangChiTietTonTai.getSoLuong());
          gioHangServices.save(gioHangChiTietTonTai);
        }
        return "redirect:/gio-hang";
      } else {
        GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
        gioHangChiTiet.setSanPham(sanPhamTonTai);
        gioHangChiTiet.setSoLuong(1);
        gioHangServices.save(gioHangChiTiet);
        return "redirect:/gio-hang";
      }
    } else {
      return "sanPham";
    }
  }
  @GetMapping("/clear")
  public String clearGioHang() {
    gioHangServices.deleteAll();
    return "redirect:/gio-hang";
  }
  @GetMapping("/deleteGiohang/{uuid}")
  public String xoaSanPhaGH(@PathVariable("uuid") UUID id) {
    gioHangServices.deleteById(id);
    return "redirect:/gio-hang";
  }
  @GetMapping("/quan-ly-san-pham")
  public String qlSanPham(Model model) {
    List<SanPham> listSanPham = repository.findAll();
    model.addAttribute("sanPham", listSanPham);
    return "viewSanPham";
  }
  @GetMapping("/detail/{maSanPham}")
  public String Detailedit(@PathVariable(name = "maSanPham") SanPham sanPham, ModelMap modelMap) {
    List<NhaSanXuat> listNhaSanXuat = repositoryNSX.findAll();
    List<DanhMuc> listLoaiSanPham = resonsitoryLoaiSanPham.findAll();
    List<MauSac> listMauSac = reposonsitoryMauSac.findAll();
    List<ChatLieu> listChatLieu = responsitoryChatLieu.findAll();
    List<AnhSanPham> listAnhSanPham = resonsitoryAnhSanPham.findAll();
    modelMap.addAttribute("listNhaSanXuat", listNhaSanXuat);
    modelMap.addAttribute("listLoaiSanPham", listLoaiSanPham);
    modelMap.addAttribute("listMauSac", listMauSac);
    modelMap.addAttribute("listChatLieu", listChatLieu);
    modelMap.addAttribute("listAnhSanPham", listAnhSanPham);
    modelMap.addAttribute("sp", sanPham);
    System.out.println("vào tới đây " + sanPham.getMaSanPham());
    return "detailSanPham";
  }
  @GetMapping("/add")
  public String add(ModelMap modelMap) {
    List<NhaSanXuat> listNhaSanXuat = repositoryNSX.findAll();
    List<DanhMuc> listLoaiSanPham = resonsitoryLoaiSanPham.findAll();
    List<MauSac> listMauSac = reposonsitoryMauSac.findAll();
    List<ChatLieu> listChatLieu = responsitoryChatLieu.findAll();
    List<AnhSanPham> listAnhSanPham = resonsitoryAnhSanPham.findAll();
    modelMap.addAttribute("listNhaSanXuat", listNhaSanXuat);
    modelMap.addAttribute("listLoaiSanPham", listLoaiSanPham);
    modelMap.addAttribute("listMauSac", listMauSac);
    modelMap.addAttribute("listChatLieu", listChatLieu);
    modelMap.addAttribute("listAnhSanPham", listAnhSanPham);
    return "add";
  }

  @PostMapping("/addSanPham")
  public String addSanPham(@Valid @ModelAttribute("sp") SanPham updatesanPham,
      @RequestParam("photo") MultipartFile photo,
      BindingResult bindingResult, ModelMap modelMap) {
    List<NhaSanXuat> listNhaSanXuat = repositoryNSX.findAll();
    List<DanhMuc> listLoaiSanPham = resonsitoryLoaiSanPham.findAll();
    List<MauSac> listMauSac = reposonsitoryMauSac.findAll();
    List<ChatLieu> listChatLieu = responsitoryChatLieu.findAll();
    List<AnhSanPham> listAnhSanPham = resonsitoryAnhSanPham.findAll();
    modelMap.addAttribute("listNhaSanXuat", listNhaSanXuat);
    modelMap.addAttribute("listLoaiSanPham", listLoaiSanPham);
    modelMap.addAttribute("listMauSac", listMauSac);
    modelMap.addAttribute("listChatLieu", listChatLieu);
    modelMap.addAttribute("listAnhSanPham", listAnhSanPham);
    // Kiểm tra xem có lỗi dữ liệu không
    System.out.println("Oke tới đây");
    if (bindingResult.hasErrors()) {
      return "add";
    } else {
//    khởi tạo một đối tượng mới
      SanPham newSanPham = new SanPham();
//    khởi tạo đối tượng ảnh
      AnhSanPham Anh = new AnhSanPham();
      // Kiểm tra xem có tải lên ảnh mới không
      if (!photo.isEmpty()) {
        // Cập nhật thông tin sản phẩm với các giá trị mới từ form
        newSanPham.setTenSanPham(updatesanPham.getTenSanPham());
        newSanPham.setChatLieuEntity(updatesanPham.getChatLieuEntity());
        newSanPham.setGiaHienHanh(updatesanPham.getGiaHienHanh());
        newSanPham.setSize(updatesanPham.getSize());
        newSanPham.setSoLuongTon(updatesanPham.getSoLuongTon());
        newSanPham.setMoTa(updatesanPham.getMoTa());
        newSanPham.setLoaiSanPhamEntity(updatesanPham.getLoaiSanPhamEntity());
        newSanPham.setChatLieuEntity(updatesanPham.getChatLieuEntity());
        newSanPham.setMauSacEntity(updatesanPham.getMauSacEntity());
        newSanPham.setNhaSanXuatEntity(updatesanPham.getNhaSanXuatEntity());
        newSanPham.setTrangthai(0);
        newSanPham.setAnhSanPhamEntity(Anh);
        // Lưu sản phẩm đã cập nhật vào cơ sở dữ liệu
        SanPham maSanPham = repository.save(newSanPham);
        Long maSanphamSavePhoto = Long.valueOf(maSanPham.getMaSanPham());
        try {
          Path path = Paths.get("E:/School/Java/JV6/DuAn_CN/src/main/resources/static/Images/");
          // Lưu ảnh vào thư mục Images và cập nhật thông tin ảnh của sản phẩm
          String newAnh = photo.getOriginalFilename();
          Anh.setAnhSanpham(newAnh);
//          Anh.setMaSanPham(maSanphamSavePhoto);
//          Anh.setMaAnhSanPham(maSanphamSavePhoto);
          InputStream inputStream = photo.getInputStream();
          Files.copy(inputStream, path.resolve(Objects.requireNonNull(photo.getOriginalFilename())),
              StandardCopyOption.REPLACE_EXISTING);
          resonsitoryAnhSanPham.save(Anh);
        } catch (IOException e) {
          e.printStackTrace();
          System.out.println("// Xử lý lỗi tải ảnh");
          return "add";
        }
      } else {
        newSanPham.setTenSanPham(updatesanPham.getTenSanPham());
        newSanPham.setChatLieuEntity(updatesanPham.getChatLieuEntity());
        newSanPham.setGiaHienHanh(updatesanPham.getGiaHienHanh());
        newSanPham.setSize(updatesanPham.getSize());
        newSanPham.setSoLuongTon(updatesanPham.getSoLuongTon());
        newSanPham.setMoTa(updatesanPham.getMoTa());
        newSanPham.setLoaiSanPhamEntity(updatesanPham.getLoaiSanPhamEntity());
        newSanPham.setChatLieuEntity(updatesanPham.getChatLieuEntity());
        newSanPham.setMauSacEntity(updatesanPham.getMauSacEntity());
        newSanPham.setNhaSanXuatEntity(updatesanPham.getNhaSanXuatEntity());
        newSanPham.setTrangthai(0);
        newSanPham.setAnhSanPhamEntity(Anh);
        // Lưu sản phẩm đã cập nhật vào cơ sở dữ liệu
        repository.save(newSanPham);
      }
      // Chuyển hướng người dùng về trang quản lý sản phẩm
      return "redirect:/quan-ly-san-pham";
    }
  }

  @GetMapping("/delete/{maSanPham}")
  public String Xoa(@Valid @ModelAttribute("sp") SanPham deletesanPham) {
    Optional<SanPham> optionalSanPham = Optional.ofNullable(repository.findById(
        Math.toIntExact(deletesanPham.getMaSanPham())).orElse(null));
    SanPham sanPhamTonTai = optionalSanPham.get();
    if (sanPhamTonTai != null) {
      if (sanPhamTonTai.getTrangthai() == 1) {
        sanPhamTonTai.setTrangthai(0);
        this.repository.save(sanPhamTonTai);
        return "redirect:/quan-ly-san-pham";
      } else {
        sanPhamTonTai.setTrangthai(1);
        this.repository.save(sanPhamTonTai);
        return "redirect:/quan-ly-san-pham";
      }
    }
    return "viewSanPham";
  }

  @PostMapping("/update/{maSanPham}")
  public String updateSanpham(@Valid @ModelAttribute("sp") SanPham updatesanPham,
      @RequestParam("photo") MultipartFile photo,
      BindingResult bindingResult, ModelMap modelMap) {
    List<NhaSanXuat> listNhaSanXuat = repositoryNSX.findAll();
    List<DanhMuc> listLoaiSanPham = resonsitoryLoaiSanPham.findAll();
    List<MauSac> listMauSac = reposonsitoryMauSac.findAll();
    List<ChatLieu> listChatLieu = responsitoryChatLieu.findAll();
    List<AnhSanPham> listAnhSanPham = resonsitoryAnhSanPham.findAll();
    modelMap.addAttribute("listNhaSanXuat", listNhaSanXuat);
    modelMap.addAttribute("listLoaiSanPham", listLoaiSanPham);
    modelMap.addAttribute("listMauSac", listMauSac);
    modelMap.addAttribute("listChatLieu", listChatLieu);
    modelMap.addAttribute("listAnhSanPham", listAnhSanPham);
    // Kiểm tra xem có lỗi dữ liệu không
    if (bindingResult.hasErrors()) {
      return "detailSanPham";
    }
    // Lấy thông tin sản phẩm từ cơ sở dữ liệu dựa trên mã sản phẩm
    Optional<SanPham> optionalSanPham = Optional.ofNullable(repository.findById(
        Math.toIntExact(updatesanPham.getMaSanPham())).orElse(null));
    if (optionalSanPham.isEmpty()) {
      // Trả về trang lỗi nếu không tìm thấy sản phẩm
      return "detailSanPham";
    }
    // Lấy sản phẩm từ Optional
    SanPham sanPhamTonTai = optionalSanPham.get();
    AnhSanPham Anh = new AnhSanPham();
    // Kiểm tra xem có tải lên ảnh mới không
    if (sanPhamTonTai.getMaAnhSanpham() == null) {
      if (photo.isEmpty()) {
        // Cập nhật thông tin sản phẩm với các giá trị mới từ form
        return "detailSanPham";
      } else {
        try {
          Path path = Paths.get("E:/School/Java/JV6/DuAn_CN/src/main/resources/static/Images/");
          // Lưu ảnh vào thư mục Images và cập nhật thông tin ảnh của sản phẩm
          String newAnh = photo.getOriginalFilename();
          Anh.setAnhSanpham(newAnh);
//          Anh.setMaSanPham(String.valueOf(updatesanPham.getMaSanPham()));
          InputStream inputStream = photo.getInputStream();
          Files.copy(inputStream, path.resolve(photo.getOriginalFilename()),
              StandardCopyOption.REPLACE_EXISTING);
          sanPhamTonTai.setTenSanPham(updatesanPham.getTenSanPham());
          sanPhamTonTai.setChatLieuEntity(updatesanPham.getChatLieuEntity());
          sanPhamTonTai.setGiaHienHanh(updatesanPham.getGiaHienHanh());
          sanPhamTonTai.setSize(updatesanPham.getSize());
          sanPhamTonTai.setSoLuongTon(updatesanPham.getSoLuongTon());
          sanPhamTonTai.setMoTa(updatesanPham.getMoTa());
          sanPhamTonTai.setLoaiSanPhamEntity(updatesanPham.getLoaiSanPhamEntity());
          sanPhamTonTai.setChatLieuEntity(updatesanPham.getChatLieuEntity());
          sanPhamTonTai.setMauSacEntity(updatesanPham.getMauSacEntity());
          sanPhamTonTai.setNhaSanXuatEntity(updatesanPham.getNhaSanXuatEntity());
          sanPhamTonTai.setTrangthai(updatesanPham.getTrangthai());
          sanPhamTonTai.setAnhSanPhamEntity(Anh);
          // Lưu sản phẩm đã cập nhật vào cơ sở dữ liệu
          repository.save(sanPhamTonTai);
          resonsitoryAnhSanPham.save(Anh);
        } catch (IOException e) {
          e.printStackTrace();
          System.out.println("// Xử lý lỗi tải ảnh");
          return "detailSanPham";
        }
        return "redirect:/quan-ly-san-pham";
      }
    } else {
      if (photo.isEmpty()) {
        return "redirect:/quan-ly-san-pham";
      } else {
        try {
          Path path = Paths.get("E:/School/Java/JV6/DuAn_CN/src/main/resources/static/Images/");
          // Lưu ảnh vào thư mục Images và cập nhật thông tin ảnh của sản phẩm
          String newAnh = photo.getOriginalFilename();
          Anh.setAnhSanpham(newAnh);
//          Anh.setMaSanPham(String.valueOf(updatesanPham.getMaSanPham()));
          InputStream inputStream = photo.getInputStream();
          Files.copy(inputStream, path.resolve(photo.getOriginalFilename()),
              StandardCopyOption.REPLACE_EXISTING);
          sanPhamTonTai.setTenSanPham(updatesanPham.getTenSanPham());
          sanPhamTonTai.setChatLieuEntity(updatesanPham.getChatLieuEntity());
          sanPhamTonTai.setGiaHienHanh(updatesanPham.getGiaHienHanh());
          sanPhamTonTai.setSize(updatesanPham.getSize());
          sanPhamTonTai.setSoLuongTon(updatesanPham.getSoLuongTon());
          sanPhamTonTai.setMoTa(updatesanPham.getMoTa());
          sanPhamTonTai.setLoaiSanPhamEntity(updatesanPham.getLoaiSanPhamEntity());
          sanPhamTonTai.setChatLieuEntity(updatesanPham.getChatLieuEntity());
          sanPhamTonTai.setMauSacEntity(updatesanPham.getMauSacEntity());
          sanPhamTonTai.setNhaSanXuatEntity(updatesanPham.getNhaSanXuatEntity());
          sanPhamTonTai.setTrangthai(updatesanPham.getTrangthai());
          sanPhamTonTai.setAnhSanPhamEntity(Anh);
          // Lưu sản phẩm đã cập nhật vào cơ sở dữ liệu
          repository.save(sanPhamTonTai);
          resonsitoryAnhSanPham.save(Anh);
        } catch (IOException e) {
          e.printStackTrace();
          System.out.println("// Xử lý lỗi tải ảnh");
          return "detailSanPham";
        }
        return "redirect:/quan-ly-san-pham";
      }
    }
  }
}