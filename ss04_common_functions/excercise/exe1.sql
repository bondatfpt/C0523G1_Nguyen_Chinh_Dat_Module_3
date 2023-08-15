use quan_ly_sinh_vien;
select * from students;
select * from classes;
select * from marks;
select * from subjects;

-- 1. Hiển thị tất cả các thông tin môn học (bảng subjects) có credit lớn nhất;
select * from subjects
where credit in (
select max(credit) from subjects);

-- 2.Hiển thị các thông tin môn học có điểm thi lớn nhất.
select subjects.*,marks.mark
from subjects
join marks on marks.sub_id = subjects.sub_id
where mark in (select max(mark) from marks);

-- 3.Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select students.*,avg(mark) as diem_trung_binh
from students 
left join marks on marks.student_id = students.student_id
group by students.student_id
order by diem_trung_binh desc;
