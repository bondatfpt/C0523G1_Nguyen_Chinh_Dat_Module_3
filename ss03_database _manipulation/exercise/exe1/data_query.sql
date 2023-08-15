use quan_ly_sinh_vien;
select* from students;
select* from classes;
select* from subjects;
select* from marks;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select* from students
where student_name like 'H%'; 

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select* from classes
where month(start_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select* from subjects
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0;
update students
set class_id = 2
where student_name = 'Hung';
set sql_safe_updates = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student_name, subjects.sub_name, marks.mark
from students
left join marks
on students.student_id = marks.student_id
join subjects
on marks.sub_id = subjects.sub_id
order by marks.mark desc, students.student_name asc;


