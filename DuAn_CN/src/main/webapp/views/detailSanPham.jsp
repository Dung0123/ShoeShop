<%@page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" >
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Sản Phẩm</title>
    <!-- Thêm Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Quản Lý Sản Phẩm</h2>
    <form action="/update/${sp.maSanPham}" method="post" enctype="multipart/form-data" >
        <div class="mb-3">
            <label for="tenSanPham" class="form-label">Tên sản phẩm:</label>
            <input type="text" class="form-control" id="tenSanPham"
                   placeholder="Nhập tên sản phẩm" name="tenSanPham" value="${sp.tenSanPham}">
            <td><form:errors path="sp.tenSanPham" cssStyle="color: red"/></td>
        </div>
        <div class="mb-3">
            <label for="size" class="form-label">Kích thước:</label>
            <input type="number" class="form-control" id="size"
                   placeholder="Nhập kích thước" name="size" value="${sp.size}">
            <td><form:errors path="sp.size" cssStyle="color: red"/></td>
        </div>

        <div class="mb-3">
            <label for="giaHienHanh" class="form-label">Giá hiện hành:</label>
            <input type="number" class="form-control" id="giaHienHanh"
                   placeholder="Nhập giá hiện hành" name="giaHienHanh" value="${sp.giaHienHanh}">
            <td><form:errors path="sp.giaHienHanh" cssStyle="color: red"/></td>
        </div>

        <div class="mb-3">
            <label for="soLuongTon" class="form-label">Số lượng tồn:</label>
            <input type="number" class="form-control" id="soLuongTon"
                   placeholder="Nhập số lượng tồn" name="soLuongTon" value="${sp.soLuongTon}">
            <td><form:errors path="sp.soLuongTon" cssStyle="color: red"/></td>
        </div>

        <div class="mb-3">
            <label for="moTa" class="form-label">Mô tả:</label>
            <textarea class="form-control" id="moTa"
                      placeholder="Nhập mô tả" name="moTa">${sp.moTa}</textarea>
            <td><form:errors path="sp.moTa" cssStyle="color: red"/></td>
        </div>
        <div class="mb-3">
            <label for="chatLieu" class="form-label">Chất liệu:</label>
            <select class="form-select" id="chatLieu" name="chatLieuEntity">
                <c:forEach items="${listChatLieu}" var="i">
                    <option value="${i.maChatLieu}"<c:if test="${sp.chatLieuEntity.chatLieu == i.chatLieu}">selected</c:if> >${i.chatLieu}</option>
                </c:forEach>
            </select>
            <td><form:errors path="sp.chatLieuEntity.chatLieu" cssStyle="color: red"/></td>
        </div>

        <div class="mb-3">
            <label for="mauSac" class="form-label">Màu sắc:</label>
            <select class="form-select" id="mauSac" name="mauSacEntity">
                <c:forEach items="${listMauSac}" var="i">
                    <option value="${i.maMauSac}"<c:if test="${sp.mauSacEntity.mauSac == i.mauSac}">selected</c:if> >${i.mauSac}</option>
                </c:forEach>
            </select>
            <td><form:errors path="sp.mauSacEntity.mauSac" cssStyle="color: red"/></td>
        </div>

        <div class="mb-3">
            <label for="loaiSanPham" class="form-label">Loại sản phẩm:</label>
            <select class="form-select" id="loaiSanPham" name="loaiSanPhamEntity">
                <c:forEach items="${listLoaiSanPham}" var="i">
                    <option value="${i.maDanhMuc}"<c:if test="${sp.loaiSanPhamEntity.danhMucSanPham == i.danhMucSanPham}">selected</c:if> >${i.danhMucSanPham}</option>
                </c:forEach>
            </select>
            <td><form:errors path="sp.loaiSanPhamEntity.danhMucSanPham" cssStyle="color: red"/></td>
        </div>
        <div class="mb-3">
            <label for="nhaSanXuat" class="form-label">Nhà sản xuất:</label>
            <select class="form-select" id="nhaSanXuat" name="nhaSanXuatEntity">
                <c:forEach items="${listNhaSanXuat}" var="i">
                    <option value="${i.maNhaSanXuat}"<c:if test="${sp.nhaSanXuatEntity.nhaSanXuat == i.nhaSanXuat}">selected</c:if> >${i.nhaSanXuat}</option>
                </c:forEach>
            </select>
            <td><form:errors path="sp.nhaSanXuatEntity.nhaSanXuat" cssStyle="color: red"/></td>
        </div>

        <div class="mb-3">
            <label class="form-label">Trạng thái:</label>
            <div class="form-check">
                <input type="radio" class="form-check-input"
                       name="trangthai" id="trangthai1" value="1" ${sp.trangthai == '1' ? 'checked' : ''}>
                <label class="form-check-label" for="trangthai1">Bắt đầu bán</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input"
                       name="trangthai" id="trangthai0" value="0" ${sp.trangthai == '0' ? 'checked' : ''}>
                <label class="form-check-label" for="trangthai0">Ngừng bán</label>
            </div>
            <td><form:errors path="sp.trangthai" cssStyle="color: red"/></td>
        </div>
        <div class="mb-3">
            <label for="anhsanPham" class="form-label">Ảnh sản phẩm:</label>
<%--            <c:forEach items="${listAnhSanPham}" var="i">--%>
                <p> <img alt="" src="/getimage/${sp.anhSanPhamEntity.anhSanpham}" width="100" height="120"></p>
<%--                đang lỗi, tạm gác lại đã--%>
<%--            </c:forEach>--%>
            <input type="file" class="form-control" id="anhsanPham" name="photo" >
<%--            <td><form:errors path="sp.anhSanPhamEntity.anhsanPham" cssStyle="color: red"/></td>--%>
        </div>
        <!-- Add other input fields as necessary -->
        <button type="submit" class="btn btn-primary">Cập nhật sản phẩm</button>
    </form>
    <br>
</div>

<!-- Thêm Bootstrap JS và các thư viện phụ thuộc -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
