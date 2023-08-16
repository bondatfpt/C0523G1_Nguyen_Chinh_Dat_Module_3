use khu_nghi_duong_furama;
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- 11.Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những 
-- khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
from khach_hang
join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
where ten_loai_khach = 'Diamond' and (khach_hang.dia_chi like '%Quảng Ngãi' or khach_hang.dia_chi like '%Vinh');

-- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem(được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hop_dong.ma_hop_dong, nhan_vien.ho_va_ten as ho_ten_nhan_vien,
		khach_hang.ho_va_ten as ho_ten_khach_hang, khach_hang.so_dien_thoai,
        dich_vu.ten_dich_vu, ifnull(sum(hop_dong_chi_tiet.so_luong),0) as so_luong_dich_vu_di_kem,
        hop_dong.tien_dat_coc
from hop_dong
join nhan_vien on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
				and quarter(hop_dong.ngay_lam_hop_dong) = 4 and year(ngay_lam_hop_dong) = 2020
join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where dich_vu.ma_dich_vu not in (
	select ma_dich_vu from hop_dong
	where quarter(ngay_lam_hop_dong) <= 2 and year(ngay_lam_hop_dong) = 2021)
group by hop_dong.ma_hop_dong;

-- 13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select hop_dong_chi_tiet.ma_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_luong_su_dung_dvdk
from hop_dong_chi_tiet
join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_luong_su_dung_dvdk in (
select max(truy_van_con.tong_so_luong_dvdk) from (
select hop_dong_chi_tiet.ma_dich_vu_di_kem,
sum(hop_dong_chi_tiet.so_luong) as tong_so_luong_dvdk
from hop_dong_chi_tiet
group by ma_dich_vu_di_kem) as truy_van_con);


-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hop_dong.ma_hop_dong,loai_dich_vu.ten_loai_dich_vu,
		dich_vu_di_kem.ten_dich_vu_di_kem,
        count(hop_dong_chi_tiet.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong 
join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_lan_su_dung = 1;

-- 15.Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nhan_vien.ma_nhan_vien, nhan_vien.ho_va_ten,
		trinh_do.ten_trinh_do, bo_phan.ten_bo_phan,
        nhan_vien.so_dien_thoai, nhan_vien.dia_chi,
        hop_dong.ngay_lam_hop_dong, count(hop_dong.ma_nhan_vien) as so_lan_lam_hop_dong
from nhan_vien
join trinh_do on trinh_do.ma_trinh_do = nhan_vien.ma_trinh_do
join bo_phan on bo_phan.ma_bo_phan = nhan_vien.ma_bo_phan
join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
where year(ngay_lam_hop_dong) between 2020 and 2021
group by hop_dong.ma_nhan_vien
having so_lan_lam_hop_dong < 4;



