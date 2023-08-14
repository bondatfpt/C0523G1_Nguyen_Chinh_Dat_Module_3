use quan_ly_sinh_vien;
select* from student;
select* from classes;
select* from subject;
select* from mark;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select* from student
where student_name like 'H%'; 

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select* from classes
where month(start_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select* from `subject`
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0;
update student
set class_id = 2
where student_name = 'Hung';
set sql_safe_updates = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student_name, `subject`.sub_name, mark.mark
from student
left join mark
on student.student_id = mark.student_id
left join `subject`
on mark.sub_id = `subject`.sub_id
order by mark.mark desc;


