create database school_management;
use school_management;

-- Tạo bảng giao_vien
CREATE TABLE giao_vien (
    ma_gv CHAR(5) PRIMARY KEY,
    ho_ten_gv VARCHAR(255)
);

-- Tạo bảng lop
CREATE TABLE lop (
    ma_lop CHAR(5) PRIMARY KEY,
    ten_lop VARCHAR(255),
    ma_gvcn CHAR(5),
    nam_hoc VARCHAR(50),
    FOREIGN KEY (ma_gvcn) REFERENCES giao_vien(ma_gv)
);

-- Tạo bảng hoc_sinh
CREATE TABLE hoc_sinh (
    ma_hs CHAR(5) PRIMARY KEY,
    ho_ten_hs VARCHAR(255),
    ho_ten_ph VARCHAR(255),
    gioi_tinh VARCHAR(10),
    dia_chi VARCHAR(255),
    ma_lop CHAR(5),
    FOREIGN KEY (ma_lop) REFERENCES lop(ma_lop)
);

-- Tạo bảng mon_hoc
CREATE TABLE mon_hoc (
    ma_mh CHAR(5) PRIMARY KEY,
    ten_mh VARCHAR(255)
);

-- Tạo bảng ket_qua_hoc_tap
CREATE TABLE ket_qua_hoc_tap (
    ma_hs CHAR(5),
    hoc_ky VARCHAR(10),
    ma_mh CHAR(5),
    diem_thi_giua_ky FLOAT,
    diem_thi_cuoi_ky FLOAT,
    ngay_gio_thi_cuoi_ky DATETIME,
    PRIMARY KEY (ma_hs, hoc_ky, ma_mh),
    FOREIGN KEY (ma_hs) REFERENCES hoc_sinh(ma_hs),
    FOREIGN KEY (ma_mh) REFERENCES mon_hoc(ma_mh)
);

-- Tạo bảng phu_trach_bo_mon
CREATE TABLE phu_trach_bo_mon (
    ma_gvpt CHAR(5),
    ma_lop CHAR(5),
    ma_mh CHAR(5),
    hoc_ky VARCHAR(10),
    PRIMARY KEY (ma_gvpt, ma_lop, ma_mh, hoc_ky),
    FOREIGN KEY (ma_gvpt) REFERENCES giao_vien(ma_gv),
    FOREIGN KEY (ma_lop) REFERENCES lop(ma_lop),
    FOREIGN KEY (ma_mh) REFERENCES mon_hoc(ma_mh)
);

-- INSERT DỮ LIỆU VÀO BẢNG --
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO giao_vien (ma_gv, ho_ten_gv)
VALUES ('GV001', 'Nguyễn Văn Anh'),
       ('GV002', 'Trần Quốc Bảo'),
       ('GV003', 'Lê Thị Lan'),
       ('GV004', 'Phạm Minh Đức'),
       ('GV005', 'Võ Văn Nghĩa'),
       ('GV006', 'Huỳnh Thị Hoa'),
       ('GV007', 'Nguyễn Hoàng Nam'),
       ('GV008', 'Trần Văn Khánh'),
       ('GV009', 'Lê Thị Mai'),
       ('GV010', 'Hoàng Xuân Thanh');

INSERT INTO lop (ma_lop, ten_lop, ma_gvcn, nam_hoc)
VALUES ('L0001', 'Lớp 1A', 'GV001', '2022-2023'),
       ('L0002', 'Lớp 2A', 'GV003', '2022-2023'),
       ('L0003', 'Lớp 1B', 'GV002', '2022-2023'),
       ('L0004', 'Lớp 2B', 'GV005', '2022-2023'),
       ('L0005', 'Lớp 3A', 'GV004', '2022-2023'),
       ('L0006', 'Lớp 4A', 'GV006', '2022-2023'),
       ('L0007', 'Lớp 3B', 'GV008', '2022-2023'),
       ('L0008', 'Lớp 4B', 'GV010', '2022-2023'),
       ('L0009', 'Lớp 5A', 'GV007', '2022-2023'),
       ('L0010', 'Lớp 5B', 'GV009', '2022-2023');

INSERT INTO hoc_sinh (ma_hs, ho_ten_hs, ho_ten_ph, gioi_tinh, dia_chi, ma_lop)
VALUES ('HS001', 'Nguyễn Văn Minh', 'Nguyễn Hoàng Linh', 'Nam', 'Thanh Khê', 'L0001'),
       ('HS002', 'Trần Thị Mai', 'Trần Văn Tuyến', 'Nữ', 'Hải Châu', 'L0002'),
       ('HS003', 'Lê Tuấn Anh', 'Lê Văn Tường', 'Nam', 'Thanh Khê', 'L0001'),
       ('HS004', 'Phạm Thị Hoa', 'Phạm Văn Lợi', 'Nữ', 'Sơn Trà', 'L0003'),
       ('HS005', 'Võ Minh Tuấn', 'Võ Văn Đại', 'Nam', 'Liên Chiểu', 'L0004'),
       ('HS006', 'Huỳnh Thị Lan', 'Huỳnh Văn Sơn', 'Nữ', 'Cẩm Lệ', 'L0005'),
       ('HS007', 'Nguyễn Hoàng Nam', 'Nguyễn Văn Quang', 'Nam', 'Hòa Vang', 'L0006'),
       ('HS008', 'Trần Minh Trí', 'Trần Văn Hoàng', 'Nam', 'Hải Châu', 'L0007'),
       ('HS009', 'Lê Thị Thanh', 'Lê Văn Tâm', 'Nữ', 'Thanh Khê', 'L0008'),
       ('HS010', 'Hoàng Quốc Bảo', 'Hoàng Văn Lâm', 'Nam', 'Cẩm Lệ', 'L0009'),
		('HS011', 'Nguyễn Thị Thu', 'Nguyễn Văn Hùng', 'Nữ', 'Thanh Khê', 'L0001'),
		('HS012', 'Trần Minh Hiếu', 'Trần Văn Hoàn', 'Nam', 'Hải Châu', 'L0002'),
		('HS013', 'Lê Thị Bình', 'Lê Văn Tuấn', 'Nữ', 'Thanh Khê', 'L0001'),
		('HS014', 'Phạm Minh Tuấn', 'Phạm Văn Đông', 'Nam', 'Sơn Trà', 'L0003'),
		('HS015', 'Võ Thị Hoài', 'Võ Văn An', 'Nữ', 'Liên Chiểu', 'L0004'),
		('HS016', 'Huỳnh Văn Thanh', 'Huỳnh Thị Trang', 'Nam', 'Cẩm Lệ', 'L0005'),
		('HS017', 'Nguyễn Văn Hải', 'Nguyễn Thị Ngọc', 'Nam', 'Hòa Vang', 'L0006'),
		('HS018', 'Trần Thị Hương', 'Trần Văn Đạo', 'Nữ', 'Hải Châu', 'L0007'),
		('HS019', 'Lê Minh Quân', 'Lê Thị Thảo', 'Nam', 'Thanh Khê', 'L0008'),
		('HS020', 'Hoàng Văn Phú', 'Hoàng Thị Lệ', 'Nam', 'Cẩm Lệ', 'L0009'),
        ('HS021', 'Nguyễn Minh Huy', 'Nguyễn Thị Mai', 'Nam', 'Thanh Khê', 'L0001'),
		('HS022', 'Trần Thị Thảo', 'Trần Văn Tùng', 'Nữ', 'Hải Châu', 'L0002'),
		('HS023', 'Lê Văn Đức', 'Lê Thị Hương', 'Nam', 'Thanh Khê', 'L0001'),
		('HS024', 'Phạm Thị Hoa', 'Phạm Văn Trung', 'Nữ', 'Sơn Trà', 'L0003'),
		('HS025', 'Võ Minh Tuấn', 'Võ Thị Ngọc', 'Nam', 'Liên Chiểu', 'L0004'),
		('HS026', 'Huỳnh Văn Quý', 'Huỳnh Thị Lan', 'Nam', 'Cẩm Lệ', 'L0005'),
		('HS027', 'Nguyễn Thị Tâm', 'Nguyễn Văn Anh', 'Nữ', 'Hòa Vang', 'L0006'),
		('HS028', 'Trần Văn Hoàng', 'Trần Thị Bình', 'Nam', 'Hải Châu', 'L0007'),
		('HS029', 'Lê Minh Tuấn', 'Lê Văn Thanh', 'Nam', 'Thanh Khê', 'L0008'),
		('HS030', 'Hoàng Thị Ngân', 'Hoàng Văn Phương', 'Nữ', 'Cẩm Lệ', 'L0009'),
		('HS031', 'Nguyễn Minh Thuận', 'Nguyễn Thị Hoài', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0001'),
		('HS032', 'Trần Thanh Thảo', 'Trần Văn Quân', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS033', 'Lê Thị Kim', 'Lê Văn Trọng', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS034', 'Phạm Văn Hoàng', 'Phạm Thị Hà', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0004'),
		('HS035', 'Võ Thị Lan', 'Võ Văn Sơn', 'Nữ', 'Ngũ Hành Sơn, Đà Nẵng', 'L0005'),
		('HS036', 'Huỳnh Văn Nam', 'Huỳnh Thị Thanh', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0006'),
		('HS037', 'Nguyễn Thị Hương', 'Nguyễn Văn Huy', 'Nữ', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS038', 'Trần Văn Đức', 'Trần Thị Ngọc', 'Nam', 'Hải Châu, Đà Nẵng', 'L0008'),
		('HS039', 'Lê Văn Quyền', 'Lê Thị Thu', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS040', 'Hoàng Minh Tuấn', 'Hoàng Văn Hoa', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0010'),
		('HS041', 'Trần Văn Hưng', 'Trần Thị Lan', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0001'),
		('HS042', 'Nguyễn Thị Hà', 'Nguyễn Văn Tâm', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS043', 'Lê Minh Hoàng', 'Lê Thị Hoàng', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS044', 'Phạm Thị Quỳnh', 'Phạm Văn Trung', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0004'),
		('HS045', 'Võ Minh Quân', 'Võ Thị Lan', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0005'),
		('HS046', 'Huỳnh Văn Thanh', 'Huỳnh Thị Thảo', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0006'),
		('HS047', 'Nguyễn Văn Hùng', 'Nguyễn Thị Hương', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS048', 'Trần Minh Tuấn', 'Trần Thị Phương', 'Nam', 'Hải Châu, Đà Nẵng', 'L0008'),
		('HS049', 'Lê Thị Bích', 'Lê Văn Trọng', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS050', 'Hoàng Văn Lâm', 'Hoàng Thị Thu', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0010'),
        ('HS051', 'Trần Minh Quang', 'Trần Thị Ánh', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0001'),
		('HS052', 'Nguyễn Văn Khánh', 'Nguyễn Thị Hoa', 'Nam', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS053', 'Lê Thị Thủy', 'Lê Văn Huy', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS054', 'Phạm Minh Trí', 'Phạm Thị Ngọc', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0004'),
		('HS055', 'Võ Thị Trang', 'Võ Văn Đức', 'Nữ', 'Ngũ Hành Sơn, Đà Nẵng', 'L0005'),
		('HS056', 'Huỳnh Minh Hoa', 'Huỳnh Thị Lan', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0006'),
		('HS057', 'Nguyễn Văn Phúc', 'Nguyễn Thị Thu', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS058', 'Trần Thị Thảo', 'Trần Văn Tài', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0008'),
		('HS059', 'Lê Văn Long', 'Lê Thị Ngọc', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS060', 'Hoàng Thị Hương', 'Hoàng Văn Đức', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0010'),
        ('HS061', 'Ngô Thị Kim', 'Ngô Văn Hải', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0001'),
		('HS062', 'Trương Văn Đạt', 'Trương Thị Nga', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0002'),
		('HS063', 'Phan Minh Tuấn', 'Phan Thị Mai', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS064', 'Lâm Thị Lan', 'Lâm Văn Đạt', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0004'),
		('HS065', 'Trần Văn Hậu', 'Trần Thị Tuyết', 'Nam', 'Thanh Khê, Đà Nẵng', 'L0005'),
		('HS066', 'Võ Thị Hoàng', 'Võ Văn Long', 'Nữ', 'Ngũ Hành Sơn, Đà Nẵng', 'L0006'),
		('HS067', 'Huỳnh Minh Tuấn', 'Huỳnh Thị Thảo', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0007'),
		('HS068', 'Lý Thị Hương', 'Lý Văn Hiếu', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0008'),
		('HS069', 'Nguyễn Minh Đức', 'Nguyễn Thị Trang', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0009'),
		('HS070', 'Hoàng Văn Tùng', 'Hoàng Thị Phương', 'Nam', 'Hải Châu, Đà Nẵng', 'L0010'),
        ('HS071', 'Nguyễn Thị Trang', 'Nguyễn Văn Long', 'Nữ', 'Hòa Vang, Đà Nẵng', 'L0001'),
		('HS072', 'Trần Văn Đạt', 'Trần Thị Nga', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0002'),
		('HS073', 'Lê Minh Tuấn', 'Lê Thị Mai', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0003'),
		('HS074', 'Phạm Văn Thanh', 'Phạm Văn Đạt', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0004'),
		('HS075', 'Lâm Minh Hiếu', 'Lâm Văn Hải', 'Nam', 'Hải Châu, Đà Nẵng', 'L0005'),
		('HS076', 'Trương Minh Tuấn', 'Trương Thị Tuyết', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0006'),
		('HS077', 'Võ Văn Hậu', 'Võ Thị Hoàng', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0007'),
		('HS078', 'Huỳnh Thị Lan', 'Huỳnh Minh Tuấn', 'Nữ', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0008'),
		('HS079', 'Lý Văn Đạt', 'Lý Thị Hương', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0009'),
		('HS080', 'Ngô Minh Trang', 'Ngô Thị Kim', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0010'),
        ('HS081', 'Trần Văn Hùng', 'Trần Thị Lan', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0001'),
		('HS082', 'Lê Thị Thảo', 'Lê Văn Minh', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0002'),
		('HS083', 'Nguyễn Văn Long', 'Nguyễn Thị Hoài', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0003'),
		('HS084', 'Phạm Thị Hoa', 'Phạm Văn Đức', 'Nữ', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0004'),
		('HS085', 'Lâm Minh Tuấn', 'Lâm Văn Định', 'Nam', 'Sơn Trà, Đà Nẵng', 'L0005'),
		('HS086', 'Trương Thị Hồng', 'Trương Văn Thanh', 'Nữ', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0006'),
		('HS087', 'Võ Minh Hải', 'Võ Thị Thùy', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS088', 'Huỳnh Văn Đạt', 'Huỳnh Thị Thanh', 'Nam', 'Cẩm Lệ, Đà Nẵng', 'L0008'),
		('HS089', 'Lý Minh Tuấn', 'Lý Thị Lan', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0009'),
		('HS090', 'Ngô Thị Hà', 'Ngô Văn Nam', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0010'),
        ('HS091', 'Nguyễn Thị Trang', 'Nguyễn Văn Lâm', 'Nữ', 'Hải Châu, Đà Nẵng', 'L0001'),
		('HS092', 'Trần Minh Tâm', 'Trần Thị Hoài', 'Nam', 'Ngũ Hành Sơn, Đà Nẵng', 'L0002'),
		('HS093', 'Lê Thị Thuận', 'Lê Văn Đạt', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0003'),
		('HS094', 'Phạm Minh Tú', 'Phạm Văn Hưng', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0004'),
		('HS095', 'Lâm Thị Mỹ Duyên', 'Lâm Văn Thảo', 'Nữ', 'Sơn Trà, Đà Nẵng', 'L0005'),
		('HS096', 'Trương Minh Thanh', 'Trương Thị Hồng', 'Nam', 'Hòa Minh, Liên Chiểu, Đà Nẵng', 'L0006'),
		('HS097', 'Võ Minh Trí', 'Võ Thị Thảo', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0007'),
		('HS098', 'Huỳnh Thị Thùy Trang', 'Huỳnh Văn Tùng', 'Nữ', 'Cẩm Lệ, Đà Nẵng', 'L0008'),
		('HS099', 'Lý Văn Trường', 'Lý Thị Lan Anh', 'Nam', 'Hòa Vang, Đà Nẵng', 'L0009'),
		('HS100', 'Ngô Văn Nam', 'Ngô Thị Hà', 'Nam', 'Hải Châu, Đà Nẵng', 'L0010');
        
INSERT INTO mon_hoc (ma_mh, ten_mh)
VALUES 
    ('MH001', 'Toán học'),
    ('MH002', 'Ngữ văn'),
    ('MH003', 'Lịch sử'),
    ('MH004', 'Địa lý'),
    ('MH005', 'Sinh học'),
    ('MH006', 'Vật lí'),
    ('MH007', 'Hóa học'),
    ('MH008', 'Giáo dục công dân'),
    ('MH009', 'Thể dục'),
    ('MH010', 'Âm nhạc');

INSERT INTO ket_qua_hoc_tap (ma_hs, hoc_ky, ma_mh, diem_thi_giua_ky, diem_thi_cuoi_ky, ngay_gio_thi_cuoi_ky)
VALUES 
    ('HS001', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    ('HS002', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00'),
    ('HS003', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    ('HS004', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    ('HS005', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    ('HS006', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    ('HS007', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    ('HS008', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    ('HS009', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 08:00:00'),
    ('HS010', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 09:30:00'),
    ('HS011', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 08:00:00'),
    ('HS012', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 09:30:00'),
    ('HS013', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 08:00:00'),
    ('HS014', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 09:30:00'),
    ('HS015', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    ('HS016', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00'),
    ('HS017', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    ('HS018', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    ('HS019', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    ('HS020', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    ('HS021', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS022 đến HS050)
    ('HS022', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS023 đến HS050)
    ('HS023', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS024 đến HS050)
    ('HS024', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS025 đến HS050)
    ('HS025', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS026 đến HS050)
    ('HS026', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS027 đến HS050)
    ('HS027', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS028 đến HS050)
    ('HS028', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS029 đến HS050)
    ('HS029', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS030 đến HS050)
    ('HS030', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS031 đến HS050)
    ('HS031', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS032 đến HS050)
    ('HS032', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS033 đến HS050)
    ('HS033', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS034 đến HS050)
    ('HS034', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS035 đến HS050)
    ('HS035', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS036 đến HS050)
    ('HS036', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS037 đến HS050)
    ('HS037', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS038 đến HS050)
    ('HS038', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS039 đến HS050)
    ('HS039', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS040 đến HS050)
    ('HS040', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS041 đến HS050)
    ('HS041', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS042 đến HS050)
    ('HS042', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS043 đến HS050)
    ('HS043', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS044 đến HS050)
    ('HS044', 'Học kỳ 1', 'MH001', 6.5, 7.0, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS045 đến HS050)
    ('HS045', 'Học kỳ 1', 'MH001', 8.0, 8.5, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS046 đến HS050)
    ('HS046', 'Học kỳ 1', 'MH001', 9.0, 9.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS047 đến HS050)
    ('HS047', 'Học kỳ 1', 'MH001', 7.5, 8.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS048 đến HS050)
    ('HS048', 'Học kỳ 1', 'MH001', 6.0, 6.5, '2023-01-15 09:30:00'),
    -- ... (Thêm dữ liệu cho HS049 đến HS050)
    ('HS049', 'Học kỳ 1', 'MH001', 8.5, 9.0, '2023-01-15 08:00:00'),
    -- ... (Thêm dữ liệu cho HS050)
    ('HS050', 'Học kỳ 1', 'MH001', 7.0, 7.5, '2023-01-15 09:30:00');

INSERT INTO phu_trach_bo_mon (ma_gvpt, ma_lop, ma_mh, hoc_ky)
VALUES 
    ('GV001', 'L001', 'MH001', 'Học kỳ 1'),
    ('GV002', 'L003', 'MH002', 'Học kỳ 1'),
    ('GV003', 'L002', 'MH003', 'Học kỳ 1'),
    ('GV004', 'L004', 'MH004', 'Học kỳ 1'),
    ('GV005', 'L005', 'MH005', 'Học kỳ 1'),
    ('GV006', 'L006', 'MH006', 'Học kỳ 1'),
    ('GV007', 'L007', 'MH007', 'Học kỳ 1'),
    ('GV008', 'L008', 'MH008', 'Học kỳ 1'),
    ('GV009', 'L009', 'MH009', 'Học kỳ 1'),
    ('GV010', 'L010', 'MH010', 'Học kỳ 1'),
    ('GV001', 'L001', 'MH001', 'Học kỳ 2'),
    ('GV002', 'L003', 'MH002', 'Học kỳ 2'),
    ('GV003', 'L002', 'MH003', 'Học kỳ 2'),
    ('GV004', 'L004', 'MH004', 'Học kỳ 2'),
    ('GV005', 'L005', 'MH005', 'Học kỳ 2'),
    ('GV006', 'L006', 'MH006', 'Học kỳ 2'),
    ('GV007', 'L007', 'MH007', 'Học kỳ 2'),
    ('GV008', 'L008', 'MH008', 'Học kỳ 2'),
    ('GV009', 'L009', 'MH009', 'Học kỳ 2'),
    ('GV010', 'L010', 'MH010', 'Học kỳ 2');
    
SET FOREIGN_KEY_CHECKS = 1;

-- 4.a liệt kê toàn bộ thông tin của giáo viên 
select * from giao_vien;
-- 4.b liệt kê họ tên, giới tính, họ tên phụ huynh của toàn bộ sinh viên
select ho_ten_hs, gioi_tinh, ho_ten_ph from hoc_sinh;
-- 4.c liệt kê toàn bộ thông tin của tất cả các lớp 
select * from lop;

-- Bai tap WHERE
-- 5.a. Những học sinh có giới tính là Nam
select * from hoc_sinh 
where gioi_tinh = 'Nam';
-- 5.b. Những học sinh chưa có tên của phụ huynh
select * from hoc_sinh
where ho_ten_ph is null;
-- 5.c. Những lớp chưa có giáo viên chủ nhiệm
select * from lop where ma_gvcn is null;
-- 5.d. Những học sinh chưa được phân lớp
select * from hoc_sinh where ma_lop is null;
-- 5.e. Những học sinh nữ có địa chỉ ở Thanh Khê
select * from hoc_sinh 
where gioi_tinh = 'Nữ'
and dia_chi = 'Thanh Khê';
-- 5.f. Những học sinh nam có địa chỉ ở Hải Châu hoặc những học sinh nữ có địa chỉ ở Thanh Khê
select * from hoc_sinh 
where (gioi_tinh = 'Nữ' and dia_chi = 'Thanh Khê') or (gioi_tinh = 'Nam' and dia_chi = 'Hải Châu');
-- 5.g. Những học sinh nam chưa có tên phụ huynh và những học sinh nữ chưa được phân lớp
select * from hoc_sinh 
where (gioi_tinh = 'Nam' and ho_ten_ph is null) or (gioi_tinh = 'Nữ' and ma_lop is null);
-- 5.h. Những học sinh nam chưa được phân lớp và những học sinh nam chưa có tên phụ huynh
select * from hoc_sinh 
where gioi_tinh = 'Nam' and (ma_lop is null or ho_ten_ph is null);
-- 5.i. Mã môn học của những môn học được dạy trong học kỳ 2
select ma_mh from phu_trach_bo_mon
where hoc_ky = 'Học kỳ 2';

-- Bai tap LIKE
-- 6.a. Những học sinh có họ tên bắt đầu bằng từ Nguyễn
select * from hoc_sinh where ho_ten_hs like 'Nguyen%';
-- 6.b. Những học sinh có họ tên kết thúc bằng từ Nở
select * from hoc_sinh where ho_ten_hs like '%No';
-- 6.c. Những học sinh có họ tên chứa từ Thị
select * from hoc_sinh where ho_ten_hs like '%Thi%';
-- 6.d. Những học sinh chứa từ Thị ở giữa (không được chứa ở đầu và ở cuối)
select * from hoc_sinh where ho_ten_hs like '%Thi%' and ho_ten_hs not like 'Thi%' and ho_ten_hs not like '%Thi';
-- 6.e. Những học sinh có họ tên với độ dài là 30 ký tự (kể cả khoảng trắng)
select * from hoc_sinh where length(ho_ten_hs) = 30;
-- 6.f. Những học sinh có họ tên với độ dài tối đa là 30 ký tự
select * from hoc_sinh where length(ho_ten_hs) <= 30;
-- 6.g. Những học sinh có họ tên với độ dài tối đa là 30 ký tự và bắt đầu bằng ký tự N
select * from hoc_sinh where length(ho_ten_hs) = 30 and ho_ten_hs like 'N%';
-- 6.h. Những học sinh có họ tên bắt đầu bằng các ký tự: N, T, V
select * from hoc_sinh where ho_ten_hs like 'N%' or ho_ten_hs like 'T%' or ho_ten_hs like 'V%';
select * from hoc_sinh where ho_ten_hs regexp '^(N|T|V)';
-- 6.i. Những học sinh có họ tên không được bắt đầu bằng các ký tự: N, T, V
select * from hoc_sinh where ho_ten_hs not like 'N%' or ho_ten_hs not like 'T%' or ho_ten_hs not like 'V%';
select * from hoc_sinh where ho_ten_hs not regexp '^(N|T|V)';
-- 6.j. Những học sinh có họ tên với phần họ có đúng 4 ký tự
select * from hoc_sinh where length(substring_index(ho_ten_hs, ' ', 1)) = 4;

-- Bai tap DISTINCT
-- 7.a. Liệt kê họ tên của toàn bộ học sinh trong trường, nếu họ tên nào trùng nhau thì chỉ hiển thị 1 lần
select distinct ho_ten_hs from hoc_sinh;
-- 7.b. Liệt kê mã lớp của các lớp đã có học sinh học ở lớp đó. Nếu mã lớp nào trùng nhau thì chỉ hiển thị 1 lần
select distinct ma_lop from hoc_sinh;
-- 7.c. Liệt kê mã môn học của những môn học đã có ít nhất 1 giáo viên được phân công phụ trách rồi
select distinct ma_mh 'mã môn học' from phu_trach_bo_mon;
-- 7.d. Liệt kê mã môn học của những môn học đã từng được tổ chức thi ít nhất 1 lần
select distinct ma_mh 'mã môn học' from ket_qua_hoc_tap;
-- 7.e. Liệt kê mã giáo viên của những giáo viên đã từng làm chủ nhiệm cho ít nhất 1 lớp nào đó
select distinct ma_gvcn from lop;

-- Bai tap ORDER BY 
-- 8.a. Liệt kê thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh
select * from hoc_sinh order by ho_ten_hs asc;
-- 8.b. Liệt kê thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo địa chỉ
select * from hoc_sinh order by dia_chi desc;
-- 8.c. Liệt kê thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh và giảm dần theo địa chỉ
select * from hoc_sinh order by ho_ten_hs asc, dia_chi desc;
-- 8.d. Liệt kê thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp tăng dần theo họ tên học sinh và tăng dần theo địa chỉ
select * from hoc_sinh order by ho_ten_hs asc, dia_chi asc;
-- 8.e. Liệt kê thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ
select * from hoc_sinh order by ho_ten_hs desc, dia_chi desc;
-- 8.f. Liệt kê thông tin của toàn bộ học sinh trong trường. Kết quả trả về cần được sắp xếp giảm dần theo họ tên học sinh, giảm dần theo địa chỉ và tăng dần theo họ tên phụ huynh
select * from hoc_sinh order by ho_ten_hs desc, dia_chi desc, ho_ten_ph asc;

-- Bai tap INNER JOIN 2 bang
-- 9.a. Liệt kê thông tin học sinh, lớp học và giáo viên chủ nhiệm
select hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, hs.dia_chi, lop.ma_lop, lop.ma_gvcn
from hoc_sinh hs 
inner join lop on hs.ma_lop = lop.ma_lop;
-- 9.b. Liệt kê thông tin học sinh, kết quả học tập và môn học
select hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, hs.dia_chi, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky, kq.ma_mh, kq.hoc_ky
from hoc_sinh hs 
inner join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs;
-- 9.c. Liệt kê thông tin giáo viên phụ trách môn học
select gv.ma_gv, gv.ho_ten_gv, pt.ma_mh, pt.ma_lop, pt.hoc_ky
from giao_vien gv
inner join phu_trach_bo_mon pt on gv.ma_gv = pt.ma_gvpt;


-- Bai tap INNER JOIN nhieu bang
-- 10.a. MaHS, HoTenHS, GioiTinh, MaLop, TenLop, NamHoc, MaGVCN, HoTenGV (chủ nhiệm) của học sinh trong trường.
select distinct hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, lop.ma_lop, lop.ten_lop, lop.ma_gvcn, gv.ho_ten_gv, lop.nam_hoc
from hoc_sinh hs
join lop on hs.ma_lop = lop.ma_lop
join giao_vien gv on gv.ma_gv = lop.ma_gvcn;
-- 10.b. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
select distinct hs.ma_hs, hs.ho_ten_hs, mh.ten_mh, mh.ma_mh, kq.hoc_ky, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
from hoc_sinh hs
join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs
join mon_hoc mh on mh.ma_mh = kq.ma_mh;
-- 10.c. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách) 
-- của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
select distinct hs.ma_hs, hs.ho_ten_hs, mh.ten_mh, mh.ma_mh, kq.hoc_ky, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky, hs.ma_lop, pt.ma_gvpt, gv.ho_ten_gv
from hoc_sinh hs join lop on lop.ma_lop = hs.ma_lop
join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs
join mon_hoc mh on mh.ma_mh = kq.ma_mh
join phu_trach_bo_mon pt on mh.ma_mh = pt.ma_mh
join giao_vien gv on gv.ma_gv = lop.ma_gvcn;
-- 10.d. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) 
-- của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
select distinct hs.ma_hs, hs.ho_ten_hs, lop.ma_lop, lop.ma_gvcn, gv.ho_ten_gv, mh.ten_mh, mh.ma_mh, kq.hoc_ky, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky, hs.ma_lop, pt.ma_gvpt
from hoc_sinh hs
join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs 
join mon_hoc mh on mh.ma_mh = kq.ma_mh
join lop on lop.ma_lop = hs.ma_lop
join giao_vien gv on gv.ma_gv = lop.ma_gvcn
join phu_trach_bo_mon pt on pt.ma_gvpt = gv.ma_gv;
-- 10.e. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) 
-- của những học sinh nữ với các môn học đã có kết quả thi cuối kỳ hoặc giữa kỳ được 9 điểm trở lên.
select distinct hs.ma_hs, hs.ho_ten_hs, lop.ma_lop, lop.ma_gvcn, gv.ho_ten_gv, mh.ten_mh, mh.ma_mh, kq.hoc_ky, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky, hs.ma_lop, pt.ma_gvpt
from hoc_sinh hs 
join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs 
join mon_hoc mh on mh.ma_mh = kq.ma_mh
join lop on lop.ma_lop = hs.ma_lop
join giao_vien gv on gv.ma_gv = lop.ma_gvcn
join phu_trach_bo_mon pt on pt.ma_gvpt = gv.ma_gv
where hs.gioi_tinh = "Nu" and (kq.diem_thi_giua_ky >= 9 or kq.diem_thi_cuoi_ky >= 9);
-- 10.f. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách) 
-- của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường. 
-- Với điều kiện là chỉ hiển thị những môn học mà giáo viên phụ trách môn đó cũng chính là giáo viên chủ nhiệm của lớp.
select distinct mh.ma_mh, mh.ten_mh, ptbm.ma_gvpt, gv.ho_ten_gv, ptbm.ma_lop, l.ma_gvcn
from phu_trach_bo_mon ptbm
join mon_hoc mh on ptbm.ma_mh = mh.ma_mh
join lop l on ptbm.ma_lop = l.ma_lop
join giao_vien gv on ptbm.ma_gvpt = gv.ma_gv
where ptbm.ma_gvpt = l.ma_gvcn;
-- 10.g. MaMH, MaLop, HocKy của những môn học đã được thi cuối kỳ vào năm 2023
select distinct ma_mh, ma_lop, hoc_ky 
from ket_qua_hoc_tap 
where year(ngay_gio_thi_cuoi_ky) = 2023 and diem_thi_cuoi_ky is not null;
-- 10.h. MaMH, MaLop, HocKy của những môn học đã được thi vào tháng 8 năm 2023
select distinct ma_mh, ma_lop, hoc_ky 
from ket_qua_hoc_tap 
where year(ngay_gio_thi_cuoi_ky) = 2023 and month(ngay_gio_thi_cuoi_ky) = 8;

-- 10.i. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023
select distinct ma_mh, ma_lop, hoc_ky 
from ket_qua_hoc_tap 
where ngay_gio_thi_cuoi_ky ('2023-08-20');

-- 10.j. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023 đúng 1 tuần.
select distinct ma_mh, ma_lop, hoc_ky 
from ket_qua_hoc_tap 
where ngay_gio_thi_cuoi_ky = date_sub('2023-08-20', interval 7 day);

-- 10.k. MaMH, MaLop, HocKy của những môn học đã được thi sau ngày 20 tháng 8 năm 2023 đúng 21 ngày.
select distinct ma_mh, ma_lop, hoc_ky 
from ket_qua_hoc_tap 
where ngay_gio_thi_cuoi_ky = date_add('2023-08-20', interval 21 day);

-- 10.l. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ ngày 10 đến ngày 20 tháng 8 năm 2023.
select distinct ma_mh, ma_lop, hoc_ky 
from ket_qua_hoc_tap 
where ngay_gio_thi_cuoi_ky between '2023-08-10' and '2023-08-20';

-- 10.m. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ 10 giờ 00 phút ngày 10 đến 20 giờ 30 phút ngày 20 tháng 8 năm 2023.
select distinct ma_mh, ma_lop, hoc_ky 
from ket_qua_hoc_tap 
where ngay_gio_thi_cuoi_ky between '2023-08-10 100000' and '2023-08-20 203000';
