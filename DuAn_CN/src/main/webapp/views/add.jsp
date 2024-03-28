<%@page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <!-- Thêm Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search"
                           placeholder="Nhập Tên Sản Phẩm" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm Kiếm
                    </button>
                </form>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <h2>Thêm Sản Phẩm</h2>
    <form action="/addSanPham" method="post" enctype="multipart/form-data">
        <button type="submit" class="btn btn-success">Thêm sản phẩm</button>
        <div class="row">
            <div class="col-md-6">
                <!-- Các trường bên trái -->
                <div class="mb-3">
                    <label for="anhsanPham" class="form-label">Ảnh sản phẩm:</label>
                    <p><img alt="" src="/getimage/${sp.anhSanPhamEntity.anhSanpham}" width="100"
                            height="120"></p>
                    <input type="file" class="form-control" id="anhsanPham" name="photo">
<%--                    <td><form:errors path="sp.anhSanPhamEntity.anhsanPham" cssStyle="color: red"/></td>--%>
                </div>
                <div class="mb-3">
                    <label for="tenSanPham" class="form-label">Tên sản phẩm:</label>
                    <input type="text" class="form-control" id="tenSanPham"
                           placeholder="Nhập tên sản phẩm" name="tenSanPham"
                           value="${sp.tenSanPham}">
                    <td><form:errors path="sp.tenSanPham" cssStyle="color: red"/></td>
                </div>
                <div class="mb-3">
                    <label for="size" class="form-label">Kích thước:</label>
                    <input type="number" class="form-control" id="size"
                           placeholder="Nhập kích thước" name="size" value="36">
                    <td><form:errors path="sp.size" cssStyle="color: red"/></td>
                </div>

            </div>
            <div class="col-md-6">
                <!-- Các trường bên phải -->
                <div class="mb-3">
                    <label for="giaHienHanh" class="form-label">Giá hiện hành:</label>
                    <input type="number" class="form-control" id="giaHienHanh"
                           placeholder="Nhập giá hiện hành" name="giaHienHanh"
                           value="${sp.giaHienHanh}">
                    <td><form:errors path="sp.giaHienHanh" cssStyle="color: red"/></td>
                </div>
                <div class="mb-3">
                    <label for="soLuongTon" class="form-label">Số lượng tồn:</label>
                    <input type="number" class="form-control" id="soLuongTon"
                           placeholder="Nhập số lượng tồn" name="soLuongTon"
                           value="${sp.soLuongTon}">
                    <td><form:errors path="sp.soLuongTon" cssStyle="color: red"/></td>
                </div>
                <div class="mb-3">
                    <label for="moTa" class="form-label">Mô tả:</label>
                    <textarea class="form-control" id="moTa" placeholder="Nhập mô tả"
                              name="moTa">${sp.moTa}</textarea>
                    <td><form:errors path="sp.moTa" cssStyle="color: red"/></td>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Các trường bên trái -->
                            <div class="mb-3">
                                <!-- Chất liệu -->
                                <label for="chatLieu" class="form-label">Chất liệu:</label>
                                <select class="form-select" id="chatLieu" name="chatLieuEntity">
                                    <c:forEach items="${listChatLieu}" var="i">
                                        <option value="${i.maChatLieu}"
                                                <c:if test="${sp.chatLieuEntity.chatLieu == i.chatLieu}">selected</c:if>>${i.chatLieu}</option>
                                    </c:forEach>
                                </select>
                                <td><form:errors path="sp.chatLieuEntity.chatLieu"
                                                 cssStyle="color: red"/></td>
                            </div>
                            <div class="mb-3">
                                <!-- Loại sản phẩm -->
                                <label for="loaiSanPham" class="form-label">Loại sản phẩm:</label>
                                <select class="form-select" id="loaiSanPham"
                                        name="loaiSanPhamEntity">
                                    <c:forEach items="${listLoaiSanPham}" var="i">
                                        <option value="${i.maDanhMuc}"
                                                <c:if test="${sp.loaiSanPhamEntity.danhMucSanPham == i.danhMucSanPham}">selected</c:if>>${i.danhMucSanPham}</option>
                                    </c:forEach>
                                </select>
                                <td><form:errors path="sp.loaiSanPhamEntity.danhMucSanPham"
                                                 cssStyle="color: red"/></td>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Các trường bên phải -->
                            <div class="mb-3">
                                <!-- Màu sắc -->
                                <label for="mauSac" class="form-label">Màu sắc:</label>
                                <select class="form-select" id="mauSac" name="mauSacEntity">
                                    <c:forEach items="${listMauSac}" var="i">
                                        <option value="${i.maMauSac}"
                                                <c:if test="${sp.mauSacEntity.mauSac == i.mauSac}">selected</c:if>>${i.mauSac}</option>
                                    </c:forEach>
                                </select>
                                <td><form:errors path="sp.mauSacEntity.mauSac"
                                                 cssStyle="color: red"/></td>
                            </div>
                            <div class="mb-3">
                                <!-- Nhà sản xuất -->
                                <label for="nhaSanXuat" class="form-label">Nhà sản xuất:</label>
                                <select class="form-select" id="nhaSanXuat" name="nhaSanXuatEntity">
                                    <c:forEach items="${listNhaSanXuat}" var="i">
                                        <option value="${i.maNhaSanXuat}"
                                                <c:if test="${sp.nhaSanXuatEntity.nhaSanXuat == i.nhaSanXuat}">selected</c:if>>${i.nhaSanXuat}</option>
                                    </c:forEach>
                                </select>
                                <td><form:errors path="sp.nhaSanXuatEntity.nhaSanXuat"
                                                 cssStyle="color: red"/></td>
                            </div>
                        </div>
                    </div>
                    <!-- Add other input fields as necessary -->
                    <br>
                </div>
            <!-- Add other input fields as necessary -->
            </div>
        </div>
    </form>
    <br>
</div>

<!-- Thêm Bootstrap JS và các thư viện phụ thuộc -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
