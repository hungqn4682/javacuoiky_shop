-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 11, 2022 lúc 09:06 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlbanhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiet`
--

CREATE TABLE `chitiet` (
  `id` int(11) NOT NULL,
  `tensp` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `mota` varchar(125) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `masp` int(255) NOT NULL,
  `sosao` int(3) NOT NULL,
  `binhluan` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `hoten` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `sdt` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `ngaybinhluan` int(11) NOT NULL DEFAULT 1575022835
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `danhgia`
--

INSERT INTO `danhgia` (`masp`, `sosao`, `binhluan`, `hoten`, `sdt`, `email`, `ngaybinhluan`) VALUES
(5, 4, 'hgdehfdsdf', 'duc', '854875', 'pdfd@d', 1608282774),
(7, 3, 'cũng đc', 'dddddddđ', '4445454', 'pdfd@d', 1608282841),
(7, 5, 'sản phẩm tốt', 'duc', '6735636', 'ducn@d', 1608282877),
(1, 1, 'jsdfdsj', 'ducccccc', '445', 'phap810@gmail.com', 1608282740),
(1, 5, 'Hay ', 'khanh', '3864745', 'Toi@g', 1608282714),
(1, 5, 'chghgfh', 'vn', '3424', 'phap810@gmail.com', 1608282645),
(1, 4, 'dffdfdffhgfhgf', 'vn', '6565465', 'vn@gmail.com', 1608282659),
(1, 2, 'hay', 'ddd', '35454', 'phap810@gmail.com', 1608618384),
(7, 3, 'ddddddddd', 'vn', '009883', 'phap810@gmail.com', 1609225821);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `madm` int(11) NOT NULL,
  `tendm` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`madm`, `tendm`) VALUES
(1, 'Nam'),
(2, 'Nữ'),
(3, 'Trẻ em');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangsx`
--

CREATE TABLE `hangsx` (
  `mahang` int(11) NOT NULL,
  `tenhang` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `tendm` varchar(50) NOT NULL,
  `picture` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hangsx`
--

INSERT INTO `hangsx` (`mahang`, `tenhang`, `tendm`, `picture`) VALUES
(1, 'nike', 'nam', 'image/hangnike.png'),
(2, 'adidas', 'nam', 'image/hangadidas.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `email` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `name`, `phone`, `address`, `email`, `note`, `total`) VALUES
(53, 'phap dinh', '09666448541', 'quy nhon', 'phap810@gmail.com', '', 56900000),
(54, 'phap dinh', '0966644854', 'quy nhon', 'phap810@gmail.com', '', 49000000),
(55, 'phap dinh', '0966644854', 'quy nhon', 'phap810@gmail.com', '', 71990000),
(56, 'phap dinh', '0966644854', 'quy nhon', 'phap810@gmail.com', '', 32990000),
(57, 'Nguyen Thanh Phat', '0777425310', 'sadas', 'fcluongnong1@gmail.com', 'không', 22200000),
(58, 'nguyen thanh hung', '012345678', 'nhon binh', 'fcluongnong1@gmail.com', 'khong', 870);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(62, 56, 5, 2, 20000000),
(63, 56, 20, 1, 12990000),
(64, 57, 8, 3, 22200000),
(65, 58, 1, 1, 500),
(66, 58, 2, 1, 370);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(255) NOT NULL,
  `tensp` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `gia` int(11) NOT NULL,
  `giamgia` int(11) NOT NULL,
  `anh` text COLLATE utf8_vietnamese_ci NOT NULL,
  `soluong` int(11) NOT NULL,
  `madm` int(11) NOT NULL,
  `mahang` int(11) NOT NULL,
  `thoigiantao` int(11) NOT NULL DEFAULT 1575022835
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensp`, `gia`, `giamgia`, `anh`, `soluong`, `madm`, `mahang`, `thoigiantao`) VALUES
(1, 'air jordan', 500, 0, 'image/jumpman-air-jordan.png', 10, 1, 0, 0),
(2, 'air force', 390, 20, 'image/jordan-air-force.png', 5, 2, 0, 0),
(3, 'nike retro', 200, 10, 'image/retro.png', 10, 3, 0, 0),
(4, 'nike spiz', 700, 0, 'image/spiz.png', 0, 2, 0, 0),
(5, 'mical', 400, 0, 'image/mical.png', 5, 2, 0, 0),
(6, 'sportswear', 1000, 50, 'image/sportswear.png', 0, 2, 0, 0),
(7, 'nike footwear', 750, 100, 'image/nike-footwear.png', 0, 2, 0, 0),
(8, 'air force white', 400, 20, 'image/white-air-jordan.png', 30, 3, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `PassWord` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `UserName`, `PassWord`) VALUES
(4, 'admin', 'admin');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiet`
--
ALTER TABLE `chitiet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tensp` (`tensp`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD KEY `fk_danhgia` (`masp`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`madm`);

--
-- Chỉ mục cho bảng `hangsx`
--
ALTER TABLE `hangsx`
  ADD PRIMARY KEY (`mahang`),
  ADD UNIQUE KEY `tenhang` (`tenhang`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tensp` (`tensp`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitiet`
--
ALTER TABLE `chitiet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `madm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `hangsx`
--
ALTER TABLE `hangsx`
  MODIFY `mahang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
