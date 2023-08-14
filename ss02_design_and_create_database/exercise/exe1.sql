create database chuyen_doi_erd_sang_mo_hinh_quan_he;
use chuyen_doi_erd_sang_mo_hinh_quan_he;

create table phieu_xuat(
so_phieu_xuat int primary key auto_increment,
ngay_xuat datetime not null
);

create table phieu_nhap(
so_phieu_nhap int primary key auto_increment,
ngay_nhap datetime not null
);

create table nha_cung_cap (
ma_nha_cung_cap varchar(20) primary key not null,
ten_nha_cung_cap varchar(50) not null,
dia_chi varchar(50) not null,
sdt varchar (10) not null unique
);

create table vat_tu (
ma_vat_tu varchar (20) primary key not null,
ten_vat_tu varchar (50) not null
);

create table don_dat_hang(
so_don_hang int primary key auto_increment,
ngay_dat_hang datetime not null,
ma_nha_cung_cap varchar(20),
foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table chi_tiet_phieu_xuat (
ma_vat_tu varchar (20),
so_phieu_xuat int,
don_gia_xuat double,
so_luong_xuat int,
primary key(ma_vat_tu,so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat)
);

create table chi_tiet_phieu_nhap(
ma_vat_tu varchar(20),
so_phieu_nhap int,
don_gia_nhap double,
so_luong_nhap int,
primary key(ma_vat_tu,so_phieu_nhap),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);

create table chi_tiet_don_dat_hang(
ma_vat_tu varchar(20),
so_don_hang int,
primary key(ma_vat_tu,so_don_hang),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_don_hang) references don_dat_hang(so_don_hang)
);



