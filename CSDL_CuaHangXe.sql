
-- Bảng NhanVien
CREATE TABLE NhanVien (
    MaNhanVien NCHAR(10) PRIMARY KEY,
    TenNhanVien NVARCHAR(50),
    ChucVuNhanVien NVARCHAR(50),
    DiaChiNhanVien NVARCHAR(50),
    SoDienThoaiNhanVien NVARCHAR(15),
    EmailNhanVien NVARCHAR(100)
);
-- Bảng KhachHang
CREATE TABLE KhachHang (
    MaKhachHang NCHAR(10) PRIMARY KEY,
    HoTenKhachHang NVARCHAR(50),
    DiaChiKhachHang NVARCHAR(50),
    SoDienThoaiKhachHang NVARCHAR(15),
    EmailKhachHang NVARCHAR(50)
);

-- Bảng NhaCungCap
CREATE TABLE NhaCungCap (
    MaNhaCungCap NCHAR(10) PRIMARY KEY,
    TenNhaCungCap NVARCHAR(50),
    DiaChiNhaCungCap NVARCHAR(50),
    SoDienThoaiNhaCungCap NVARCHAR(15),
    EmailNhaCungCap NVARCHAR(50)
);

-- Bảng Xe
CREATE TABLE Xe (
    MaXe NCHAR(10) PRIMARY KEY,
    TenXe NVARCHAR(100),
    HangXe NVARCHAR(50),
    DongXe NVARCHAR(50),
    SoKhungXe NVARCHAR(50),
    MauSac NVARCHAR(50),
    NamSanXuat int,
    GiaBanXe DECIMAL(20),
    HinhAnh NVARCHAR(200)
);

-- Bảng PhieuNhapKho
CREATE TABLE PhieuNhapKho (
    MaPhieuNhap NCHAR(10) PRIMARY KEY,
    MaXe NCHAR(10),
    MaNhaCungCap NCHAR(10),
    NgayNhap DATE,
    SoLuongNhap INT,
    GiaNhap DECIMAL(20),
    FOREIGN KEY (MaXe) REFERENCES Xe(MaXe),
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
);

-- Bảng PhieuXuatKho
CREATE TABLE PhieuXuatKho (
    MaPhieuXuat NCHAR(10) PRIMARY KEY,
    MaXe NCHAR(10),
    MaKhachHang NCHAR(10),
    NgayXuat DATE,
    SoLuongXuat INT,
    GiaXuat DECIMAL(20),
    MaNhanVienKiemTra NCHAR(10),
    TrangThaiDonHang NVARCHAR(50),
    FOREIGN KEY (MaXe) REFERENCES Xe(MaXe),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaNhanVienKiemTra) REFERENCES NhanVien(MaNhanVien)
);

-- Bảng HopDongMuaBan
CREATE TABLE HopDongMuaBan (
    MaHopDong NCHAR(10) PRIMARY KEY,
    MaKhachHang NCHAR(10),
    MaXe NCHAR(10),
    NgayLapHopDong DATE,
    DieuKhoanHopDong TEXT,
    TongGiaTriHopDong DECIMAL(18,2),
    MaNhanVienPheDuyet NCHAR(10),
    TrangThaiHopDong NVARCHAR(50),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaXe) REFERENCES Xe(MaXe),
    FOREIGN KEY (MaNhanVienPheDuyet) REFERENCES NhanVien(MaNhanVien)
);

-- Bảng HoaDonBanHang
CREATE TABLE HoaDonBanHang (
    MaHoaDon NCHAR(10) PRIMARY KEY,
    MaHopDong NCHAR(10),
    NgayLapHoaDon DATE,
    TongSoTien DECIMAL(20),
    ThueVAT DECIMAL(18,2),
    SoTienThanhToan DECIMAL(20),
    FOREIGN KEY (MaHopDong) REFERENCES HopDongMuaBan(MaHopDong)
);


-- Bảng TaiKhoan
CREATE TABLE TaiKhoan (
    MaTaiKhoan NCHAR(10) PRIMARY KEY,
    TenDangNhap NVARCHAR(50),
    MatKhau NVARCHAR(50),
    VaiTro NVARCHAR(50),
    MaNhanVien NCHAR(10),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);

-- Bảng DichVu
CREATE TABLE DichVu (
    MaDichVu NCHAR(10) PRIMARY KEY,
    TenDichVu NVARCHAR(100),
    MoTaDichVu NVARCHAR(255),
    ChiPhiDichVu DECIMAL(18,2),
    ThoiGianThucHien NVARCHAR(50),
    MaKhachHang NCHAR(10),
    NgaySuDungDichVu DATE,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);

-- Bảng BaoHanhXe
CREATE TABLE BaoHanhXe (
    MaBaoHanh NCHAR(10) PRIMARY KEY,
    MaXe NCHAR(10),
    MaKhachHang NCHAR(10),
    NgayBatDauBaoHanh DATE,
    NgayKetThucBaoHanh DATE,
    DieuKhoanBaoHanh TEXT,
    TrangThaiBaoHanh NVARCHAR(50),
    FOREIGN KEY (MaXe) REFERENCES Xe(MaXe),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);
--Thêm dữ liệu
--Bảng nhà cung cấp 
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, DiaChiNhaCungCap, SoDienThoaiNhaCungCap, EmailNhaCungCap) 
VALUES 
('NCC001', 'Mercedes-Benz', N'811 Nguyễn Văn Linh, quận 7,TP. Hồ Chí Minh', '0123456789', 'mercedesq7@gmail.com'),
('NCC002', 'August Luxury Motorcars', '3510 Spectrum Court - Kelowna, BC V1V 2Z1', '250-860-0444', 'augustlm@gmail.com'),
('NCC003', N'Ferrari ViệtNam', N'D7,Tân Thuận,Q7,TpHCM,VietNam', '84 283 622 0770', 'ferrarivn@gmail.com'),
('NCC004', N'Lamborghini Hồ Chí Minh', N'Ks.Hilton,11Công Trường Mê Kinh, Q1,TpHCM,Vietnam', '84 859 180 088', 'lamborghinivnn@gmail.com');

--select * from NhaCungCap
--Bảng xe
INSERT INTO Xe (MaXe, TenXe, HangXe, DongXe, SoKhungXe, MauSac, NamSanXuat, GiaBanXe, HinhAnh) 
VALUES 
('XE001', 'Ford GT Heritage Edition', 'Ford', 'Hypercar', 'fo001', N'Trắng', 2021, 1436462, 'fordgt.jpg'),
('XE002', 'Pagani Huayra', 'Pagani', 'Hypercar', 'pa001', N'Xám', 2014, 4000125, '640-sieu-xe-Pagani-Huayra-BC.jpg'),
('XE003', 'Ferrari SF90 Stradale', 'Ferrari', 'Supercar', 'fe001', N'Đỏ', 2021, 464900, 'sf90.jpg'),
('XE004', 'Lamborghini Aventador SVJ', 'Lamborghini', 'Supercar', 'la001', N'Trắng', 2020, 523000, 'lamborghini-urus-16875333912111624025262-75-0-1080-1920-cr.jpg'), 
('XE005', 'Audi R8 V10 Performance', 'Audi', 'Supercar', 'ad001', N'Trắng', 2022, 193492, 'audiR8.jpg'),
('XE006', 'Chevrolet Corvette', 'Chevrolet', 'Supercar', 'cv001', N'Trắng', 2021, 89907, 'corvette.jpg'),
('XE007', 'Mercedes-Benz AMG® G 63', 'Mercedes-Benz', 'SUV', 'mc001', N'Trắng', 2022, 162379, 'g63.jpg'),
('XE008', 'Rolls-Royce Cullinan', 'Rolls-Royce', 'SUV', 'rr001', N'Đen', 2024, 524575, 'xehay-Rolls-Royce-Cullinan-review-270120 (4).jpg'),
('XE009', 'Mercedes-Maybach S-Class', 'Mercedes-Benz', 'Luxury', 'mc002', N'Đen', 2025, 270400, 'mayback.jpg'),
('XE010', 'Rolls Royce Ghost', 'Rolls-Royce', 'Luxury', 'rr002', N'Đen', 2025, 624575, 'rolls-royce-ghost-black.jpg');


--select * from Xe;
--bảng phieunhapkho
INSERT INTO PhieuNhapKho (MaPhieuNhap, MaXe, MaNhaCungCap, NgayNhap, SoLuongNhap, GiaNhap) 
VALUES 
('PN001', 'XE001', 'NCC002', '2024-01-10', 1, 1400000),
('PN002', 'XE002', 'NCC002', '2024-01-12', 1, 3950000),
('PN003', 'XE003', 'NCC003', '2024-01-15', 3, 450000),
('PN004', 'XE004', 'NCC004', '2024-01-20', 3, 510000),
('PN005', 'XE005', 'NCC002', '2024-01-25', 5, 190000),
('PN006', 'XE006', 'NCC002', '2024-01-30', 7, 85000),
('PN007', 'XE007', 'NCC001', '2024-02-05', 7, 160000),
('PN008', 'XE008', 'NCC002', '2024-02-10', 2, 520000),
('PN009', 'XE009', 'NCC001', '2024-02-15', 5, 270000),
('PN010', 'XE010', 'NCC002', '2024-02-20', 2, 610000);
