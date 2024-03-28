<%@page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Web Của Bạn</title>
    <!-- Thêm Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<!-- Navbar với hộp tìm kiếm -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/trangChu">LogoCôngTy</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/quan-ly-san-pham">Trang Chủ <span class="sr-only">(hiện tại)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Quản lí hóa Đơn</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/quan-ly-san-pham">Quản lí sản phẩm</a>
            </li>
            <!-- Hộp tìm kiếm -->
            <li class="nav-item">
                <form class="form-inline my-2 my-lg-0" action="/search2" method="post">
                    <input name="search" class="form-control mr-sm-2" type="search" placeholder="Nhập Tên Sản Phẩm" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm Kiếm</button>
                </form>
            </li>
        </ul>
    </div>
</nav>
<div class="container"  >
    <br>
    <a href="/add" style="color: black">
        <button class="btn btn-success">Thêm Sản Phẩm</button>
    </a>
    <table class="table">
        <br>
        <h4>Danh Sách Sản phẩm</h4>
        <br>
        <thead>
        <tr>
            <th>Mã Sản Phẩm</th>
            <th>Ảnh</th>
            <th>Tên Sản Phẩm</th>
            <th>Kích Thước</th>
            <th>Giá</th>
            <th>Số Lượng Tồn</th>
            <th>Màu Sắc</th>
            <th>Trạng Thái</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sanPham}" var="sanPham">
            <tr>
                <td>${sanPham.maSanPham}</td>
                <td><img src="/getimage/${sanPham.anhSanPhamEntity.anhSanpham}" alt="${sanPham.tenSanPham}" width="50"></td>
                <td>${sanPham.tenSanPham}</td>
                <td>${sanPham.size}</td>
                <td>${sanPham.giaHienHanh}</td>
                <td>${sanPham.soLuongTon}</td>
                <td>${sanPham.mauSacEntity.mauSac}</td>
                <td>
                    <c:choose>
                        <c:when test="${sanPham.trangthai == 1}">
                            Đang bán
                        </c:when>
                        <c:when test="${sanPham.trangthai == 0}">
                            Dừng bán
                        </c:when>
                        <c:otherwise>
                            Trạng thái không xác định
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="/detail/${sanPham.maSanPham}" style="color: black">
                        <button class="btn btn-light">Chi Tiết 👁️</button></a>
                    <c:choose>
                        <c:when test="${sanPham.trangthai == 1}">
                            <a href="/delete/${sanPham.maSanPham}" style="color: black">
                                <button class="btn btn-danger">Dừng </button>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="/delete/${sanPham.maSanPham}" style="color: black">
                                <button class="btn btn-success">Bán</button>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- Thêm Bootstrap JS và các thư viện phụ thuộc -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
