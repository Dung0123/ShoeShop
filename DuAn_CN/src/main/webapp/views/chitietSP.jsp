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
    <title>Chi Tiết Sản Phẩm</title>
    <!-- Thêm Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/trangChu-store">LogoCôngTy</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/trangChu">Trang Chủ <span class="sr-only">(hiện tại)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/trung-bay">Sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Giới Thiệu</a>
            </li>
            <!-- Hộp tìm kiếm -->
            <li class="nav-item">
                <form class="form-inline my-2 my-lg-0" action="/search3" method="post">
                    <input name="search" class="form-control mr-sm-2" type="search" placeholder="Nhập Tên Sản Phẩm" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm Kiếm</button>
                </form>
            </li>
        </ul>
    </div>
</nav>
<body>
<div class="container">
    <br>
    <div class="row">
        <div class="col-md-6">
            <p><img src="/getimage/${sp.anhSanPhamEntity.anhSanpham}" class="img-fluid"
                    alt="Tên sản phẩm">
            </p>
        </div>
        <!-- Thông tin chi tiết sản phẩm -->
        <div class="col-md-6">
            <h2>Tên sản phẩm : ${sp.tenSanPham}</h2>
            <p>Giá: Giá sản phẩm : ${sp.giaHienHanh}</p>
            <p>Kích thước : ${sp.size}</p>
            <p>Mô tả: Mô tả sản phẩm : ${sp.moTa}</p>
            <!-- Nút để thêm sản phẩm vào giỏ hàng hoặc danh sách yêu thích -->
            <a href="/addSpToGioHang/${sp.maSanPham}">
                <button class="btn btn-success">
                    <i class="bi bi-bag-plus-fill"></i> Thêm vào giỏ hàng
                </button>
            </a>
            <button class="btn btn-light"><i class="bi bi-heart-fill"></i> Yêu thích ❤️</button>
            <button type="button" class="btn btn-primary" data-toggle="modal"
                    data-target="#myModal">
                Thanh Toán
            </button>
        </div>
    </div>
    <!-- Nút mở hộp thoại -->


    <!-- Hộp thoại -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Tiêu đề hộp thoại -->
                <div class="modal-header">
                    <h4 class="modal-title">Thanh Toán</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Nội dung hộp thoại -->
                <div class="modal-body">
                    <div class="input-group flex-nowrap">
                        <input type="text" class="form-control" placeholder="Địa Chỉ"
                               aria-label="Username" aria-describedby="addon-wrapping">
                    </div>


                </div>
                <!-- Chân hộp thoại -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Thanh Toán
                    </button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    <table class="table">
        <br>
        <h4>sản phẩm liên quan đến sản phẩm này</h4>
        <thead>
        <tr>
            <th>Ảnh</th>
            <th>Tên Sản Phẩm</th>
            <th>Size</th>
            <th>Màu</th>
            <th>Giá</th>
            <th>Thao tác</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sanPham}" var="sanPham">
            <tr>
                <td><img src="/getimage/${sanPham.anhSanPhamEntity.anhSanpham}"
                         alt="${sanPham.tenSanPham}" width="50"></td>
                <td>${sanPham.tenSanPham}</td>
                <td>${sanPham.size}</td>
                <td>${sanPham.mauSacEntity.mauSac}</td>
                <td>${sanPham.giaHienHanh}</td>
                <td>
                    <a href="/edit/${sanPham.maSanPham}" style="color: black">
                        <button class="btn btn-light">👀</button>
                    </a>
                    <a href="/addSpToGioHang/${sanPham.maSanPham}" style="color: black">
                        <button class="btn btn-success"> thêm vào giỏ hàng</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<br>
<footer class="bg-dark text-light text-center py-3">
    <p>© 2024 Tên Công Ty. Đã đăng ký bản quyền.</p>
</footer>
<!-- Thêm Bootstrap JS và các thư viện phụ thuộc -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
