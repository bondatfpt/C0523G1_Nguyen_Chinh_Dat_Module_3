use khu_nghi_duong_furama;

-- 11.Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những 
-- khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dich_vu_di_kem.*,hop_dong_chi_tiet.ma_dich_vu_di_kem,hop_dong.ma_khach_hang,loai_khach.ten_loai_khach
from dich_vu_di_kem
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach;
-- where ten_loai_khach = 'Diamond' and (khach_hang.dia_chi = 'Vinh' or khach_hang.dia_chi = 'Quảng Ngãi');
