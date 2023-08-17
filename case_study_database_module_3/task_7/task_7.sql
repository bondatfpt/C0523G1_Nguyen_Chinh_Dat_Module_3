use khu_nghi_duong_furama;

-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
delete from nhan_vien
where nhan_vien.ma_nhan_vien not in (
				select hop_dong.ma_nhan_vien
                from hop_dong
                where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021
);
set sql_safe_updates = 1;

-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

create view khach_hang_can_update as
select khach_hang.ma_khach_hang, loai_khach.ma_loai_khach,
			loai_khach.ten_loai_khach,
		sum(chi_phi_thue + ifnull(so_luong,0) * ifnull(gia,0))
        as tong_tien
from khach_hang
join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach 
and ma_loai_khach = 2 
join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
and year(hop_dong.ngay_lam_hop_dong) = 2021
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong.ma_khach_hang;
set sql_safe_updates = 0;
update khach_hang
set ma_loai_khach = 1
where ma_loai_khach in (
		select ma_loai_khach
        from khach_hang_can_update
        where tong_tien > 10000000
);
set sql_safe_updates = 1;

-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set foreign_key_checks = 0;
delete from khach_hang
where khach_hang.ma_khach_hang in (
		select hop_dong.ma_khach_hang
        from hop_dong
        where year (ngay_lam_hop_dong) < 2021
);
set foreign_key_checks = 1;

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
create view dich_vu_di_kem_can_update as
select hop_dong_chi_tiet.ma_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_lan_su_dung_dvdk
from hop_dong_chi_tiet
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
and year(ngay_lam_hop_dong) = 2020
group by ma_dich_vu_di_kem
having so_lan_su_dung_dvdk > 10;

set sql_safe_updates = 0;
update dich_vu_di_kem
set gia = gia * 2
where dich_vu_di_kem.ma_dich_vu_di_kem in (
			select dich_vu_di_kem.ma_dich_vu_di_kem 
            from dich_vu_di_kem_can_update
);
set sql_safe_updates = 1;

-- 20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien, ho_va_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union all
SELECT ' ma_khach_hang', ' ho_va_ten', ' email', ' so_dien_thoai', ' ngay_sinh', ' dia_chi'
union all
select ma_khach_hang, ho_va_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;
