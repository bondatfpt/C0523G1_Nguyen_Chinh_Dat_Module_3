create database chuyen_doi_erd_sang_mo_hinh_quan_he;
use chuyen_doi_erd_sang_mo_hinh_quan_he;

create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat datetime not null
);

create table phieu_nhap(
so_pn int primary key auto_increment,
ngay_nhap datetime not null
);

create table nha_cung_cap (
ma_ncc varchar(20) primary key not null,
ten_ncc varchar(50) not null,
dia_chi varchar(50) not null,
sdt varchar (10) not null unique
);

create table vat_tu (
ma_vt varchar (20) primary key not null,
ten_vt varchar (50) not null
);

create table don_dat_hang(
so_dh int primary key auto_increment,
ngay_dh datetime not null,
ma_ncc varchar(20),
foreign key (ma_ncc) references nha_cung_cap(ma_ncc)
);

create table chi_tiet_phieu_xuat (
ma_vt varchar (20),
so_px int,
dg_xuat double,
sl_xuat int,
primary key(ma_vt,so_px),
foreign key(ma_vt) references vat_tu(ma_vt),
foreign key(so_px) references phieu_xuat(so_px)
);

create table chi_tiet_phieu_nhap(
ma_vt varchar(20),
so_pn int,
dg_nhap double,
sl_nhap int,
primary key(ma_vt,so_pn),
foreign key (ma_vt) references vat_tu(ma_vt),
foreign key (so_pn) references phieu_nhap(so_pn)
);

create table chi_tiet_don_dat_hang(
ma_vt varchar(20),
so_dh int,
primary key(ma_vt,so_dh),
foreign key (ma_vt) references vat_tu(ma_vt),
foreign key (so_dh) references don_dat_hang(so_dh)
);



