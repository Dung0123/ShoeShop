<%@page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Trang Thanh Toán</title>
    <!-- Thêm Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/trangChu">LogoCôngTy</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Trang Chủ <span class="sr-only">(hiện tại)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/trung-bay">Sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/gio-hang">Giỏ Hàng</a>
            </li>

            <!-- Hộp tìm kiếm -->
            <li class="nav-item">
                <form class="form-inline my-2 my-lg-0" action="/search" method="post">
                    <input name="search" class="form-control mr-sm-2" type="search"
                           placeholder="Nhập Tên Sản Phẩm" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm Kiếm
                    </button>
                </form>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <br>
    <table class="table">
        <br>
        <h4>Danh Sách Sản phẩm</h4>
        <thead>
        <tr>
            <th>Mã Sản Phẩm</th>
            <th>Tên Sản Phẩm</th>
            <th>Ảnh sản phẩm</th>
            <th>Giá Sản Phẩm</th>
            <th>Số Lượng</th>
            <th>Thành Tiền</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="i" items="${listGioHang}">
            <form action="/updateSoLuong" method="post" >
                <input type="hidden" name="id" value="${i.sanPham.maSanPham}" />
                <hr/>
                <tr>
                    <td>${i.sanPham.maSanPham }</td>
                    <td>${i.sanPham.tenSanPham}</td>
                    <td><img src="/getimage/${i.sanPham.anhSanPhamEntity.anhSanpham}" alt="${i.sanPham.tenSanPham}" width="50"></td>
                    <td>${i.sanPham.giaHienHanh}</td>
                    <td><input type="number" name="soLuong" value="${i.soLuong}" onblur="this.form.submit()" style="width: 50px;"></td>
                    <td>${i.sanPham.giaHienHanh * i.soLuong}</td>
                    <td><a class="btn btn-danger" href="/deleteGiohang/${i.uuid}">Remove</a></td>
                </tr>
        </c:forEach>
            </form>
        </tbody>
        <p>Tổng Tiền: ${TOTAL}</p>

        <a class="btn btn-danger" href="/clear">Xóa hết</a>
        <a class="btn btn-success " href="/trung-bay">Mua Thêm</a>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>