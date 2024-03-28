<%@page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Web Của Bạn</title>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

<!-- Navbar với hộp tìm kiếm -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/trangChu">LogoCôngTy</a>
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
                <a class="nav-link" href="/gio-hang">Giỏ Hàng</a>
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
<hr>
<body>
<%--<div class="jumbotron ">--%>
<%--    <h1 class="display-8">Chào mừng đến với trang web của chúng tôi!</h1>--%>
<%--    <p class="lead">Slogan hoặc thông điệp nổi bật của bạn.</p>--%>
<%--</div>--%>
<div class="container">
    <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
        <%--            <span class="carousel-control-prev-icon" aria-hidden="true"></span>--%>
        <%--            <span class="sr-only" style="color: black">Previous</span>--%>
    </a>
    <a class="carousel-control-next" href="#carouselExample" role="button" data-slide="next">
        <%--            <span class="carousel-control-next-icon" aria-hidden="true"></span>--%>
        <%--            <span class="sr-only" style="color: black"></span>--%>
    </a>
    <div id="carouselExample" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <h3>chào mừng đến với website của chúng tôi </h3>
            <c:forEach items="${sanPham.content}" var="sanPham" varStatus="loop">
                <div class="carousel-item <c:if test="${loop.first}">active</c:if>">
                    <div class="row">
                        <div class="col-md-4 mb-4">
                            <a href="/edit/${sanPham.maSanPham}" style="color: black">
                                <div class="card">
                                    <img src="/getimage/${sanPham.anhSanPhamEntity.anhSanpham}"
                                         class="card-img-top" alt="${sanPham.tenSanPham}"
                                         width="400" height="300">
                                </div>
                            </a>
                                <%--                            <h5 class="card-title">${sanPham.tenSanPham}</h5>--%>
                                <%--                            <p class="card-text">Giá: ${sanPham.giaHienHanh}</p>--%>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<div class="container">
    <h3>Hiển thị bộ lọc</h3>
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <div class="card-header">Bộ lọc</div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <label for="size">Size:</label>
                            <select class="form-control" id="size">
                                <option value="40">40</option>
                                <option value="36">36</option>
                                <option value="37">37</option>
                                <option value="38">38</option>
                                <option value="39">39</option>
                                <option value="40">40</option>
                                <option value="41">41</option>
                                <option value="42">42</option>
                                <option value="43">43</option>
                                <option value="44">44</option>
                                <option value="45">45</option>
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="color">Màu sắc:</label>
                            <select class="form-control" id="color">
                                <option value="">Chọn màu sắc</option>
                                <option value="Đen">Đen</option>
                                <option value="Trắng">Trắng</option>
                                <option value="Đỏ">Đỏ</option>
                                <!-- Thêm các tùy chọn màu sắc khác nếu cần -->
                            </select>
                        </div>
                        <button type="submit" class="btn btn-danger">Tìm kiếm</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <!-- Phần hiển thị sản phẩm nỗi bật-->
            <div class="row">
                <c:forEach items="${sanPham.content}" var="sanPham">
                    <div class="col-md-3 mb-4">
                        <a href="/edit/${sanPham.maSanPham}" style="color: black">
                            <div class="card border">
                                <img src="/getimage/${sanPham.anhSanPhamEntity.anhSanpham}"
                                     class="card-img-top" alt="${sanPham.tenSanPham}" width="50"
                                     height="200">
                                <h5 class="card-title">${sanPham.tenSanPham}</h5>
                                <p class="card-text">Giá: ${sanPham.giaHienHanh}</p>
                            </div>
                        </a>
                        <a href="/addSpToGioHang/${sanPham.maSanPham}">
                            <button class="btn btn-success">
                                <i class="bi bi-bag-plus-fill"></i> Thêm vào giỏ hàng
                            </button>
                        </a>
                        <a> <button class="btn btn-light">
                            <i class="bi bi-heart-fill"></i> Yêu thích ❤️
                        </button></a>
                    </div>

                </c:forEach>
            </div>
            <!-- Đây là nơi hiển thị danh sách sản phẩm dựa trên bộ lọc -->
        </div>
    </div>
</div>
<%--  Kết thúc ở đây--%>
</div>
<!-- Footer -->
<footer class="bg-dark text-light text-center py-3">
    <p>© 2024 Tên Công Ty. Đã đăng ký bản quyền.</p>
</footer>
</body>
</html>
