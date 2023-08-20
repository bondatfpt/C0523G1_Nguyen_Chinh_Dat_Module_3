use khu_nghi_duong_furama;

-- 21.Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as
select nhan_vien.ma_nhan_vien, nhan_vien.ho_va_ten, nhan_vien.dia_chi,
		hop_dong.ma_hop_dong
from nhan_vien
join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
where dia_chi like '%Hải Châu%' and hop_dong.ngay_lam_hop_dong = '2019-12-12';

-- 22.Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
set sql_safe_updates = 0;
update v_nhan_vien
set dia_chi = 'Liên Chiểu'
where v_nhan_vien.dia_chi like '%Hải Châu%';

-- 23.Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

create view khach_hang_test as
select khach_hang.* 
from khach_hang;

delimiter //
create procedure sp_xoa_khach_hang(ma_khach_hang_arg int)
begin
delete from khach_hang_test
where ma_khach_hang = ma_khach_hang_arg;
end //
delimiter //
call sp_xoa_khach_hang (5);

-- 24.Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải 
-- thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong (ngay_lam_hop_dong datetime, ngay_ket_thuc datetime, tien_dat_coc double, ma_nhan_vien int,ma_khach_hang int, ma_dich_vu int)
begin 
insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu);
end //
delimiter ;

call sp_them_moi_hop_dong ('2019-12-12','2019-12-13',5000000,5,4,3);
call sp_them_moi_hop_dong ('2023-12-12','2023-12-13',3000000,15,15,13);
set foreign_key_checks = 0;
delete from hop_dong
where ma_nhan_vien = 15;
set foreign_key_checks = 1;

DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong (
    in_ngay_lam_hop_dong DATETIME,
    in_ngay_ket_thuc DATETIME,
    in_tien_dat_coc DOUBLE,
    in_ma_nhan_vien INT,
    in_ma_khach_hang INT,
    in_ma_dich_vu INT
)
DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong (
    in_ngay_lam_hop_dong DATETIME,
    in_ngay_ket_thuc DATETIME,
    in_tien_dat_coc DOUBLE,
    in_ma_nhan_vien INT,
    in_ma_khach_hang INT,
    in_ma_dich_vu INT
)
BEGIN
    DECLARE v_count INT;
    
    -- Check for duplicate primary keys
    SELECT COUNT(*) INTO v_count
    FROM hop_dong
    WHERE ma_nhan_vien = in_ma_nhan_vien AND ma_khach_hang = in_ma_khach_hang AND ma_dich_vu = in_ma_dich_vu;
    
    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate primary keys are not allowed.';
    ELSE
        -- Check for foreign key constraints
        SELECT COUNT(*) INTO v_count
        FROM nhan_vien
        WHERE ma_nhan_vien = in_ma_nhan_vien;
        
        IF v_count = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid ma_nhan_vien.';
        END IF;
        
        SELECT COUNT(*) INTO v_count
        FROM khach_hang
        WHERE ma_khach_hang = in_ma_khach_hang;
        
        IF v_count = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid ma_khach_hang.';
        END IF;
        
        SELECT COUNT(*) INTO v_count
        FROM dich_vu
        WHERE ma_dich_vu = in_ma_dich_vu;
        
        IF v_count = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid ma_dich_vu.';
        END IF;
        
        -- Insert the new record
        INSERT INTO hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
        VALUES (in_ngay_lam_hop_dong, in_ngay_ket_thuc, in_tien_dat_coc, in_ma_nhan_vien, in_ma_khach_hang, in_ma_dich_vu);
    END IF;
END //
DELIMITER ;

call sp_them_moi_hop_dong ('2020-02-19','2020-03-15',5,15,15,15);

-- 25.Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại 
-- có trong bảng hop_dong ra giao diện console của database.


