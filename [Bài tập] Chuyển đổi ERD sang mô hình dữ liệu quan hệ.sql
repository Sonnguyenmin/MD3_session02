create database md2_session02_05;
use md2_session02_05;

create table vat_tu (
	ma_vt int auto_increment primary key,
    ten_vt varchar(100) unique not null
);

create table phieu_xuat(
	so_px int auto_increment primary key,
    ngay_xuat datetime not null
);

create table phieu_xuat_chi_tiet (
	so_px int ,
    foreign key (so_px) references phieu_xuat (so_px),
    ma_vt int,
    foreign key (ma_vt) references vat_tu (ma_vt),
    don_gia_xuat double default 1 check (don_gia_xuat > 0),
    so_luowng_xuat int check(so_luong_xuat >= 0)
);

create table phieu_nhap(
	so_pn int auto_increment primary key,
    ngay_nhap datetime not null
);

create table phieu_nhap_chi_tiet(
	so_pn int not null,
    foreign key (so_pn) references phieu_nhap(so_pn),
    ma_vt int not null,
    foreign key (ma_vt) references vat_tu(ma_vt),
    don_gia_nhap double default 1 check( don_gia_nhap > 0),
    so_luong_nhap int check (so_luong_nhap >= 0)
);

create table nha_cung_cap (
	ma_ncc int auto_increment primary key,
    ten_ncc varchar(255) not null,
    address varchar(255) not null,
    phone varchar(11) unique not null
);

create table don_hang_dat(
	so_dh int not null,
    foreign key (so_dh) references chi_tiet_don_dat_hang(so_dh),
    ma_ncc int not null,
    foreign key (ma_ncc) references nh_cung_cap(ma_ncc),
    ngay_dh datetime not null
);

create table chi_tiet_don_dat_hang (
	ma_vt int not null,
    foreign key (ma_vt) references vat_tu(ma_vt),
    so_dh int not null
);

