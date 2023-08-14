use ss2;
select*from student;
select*from class;
-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào (chỉ học viên có lớp học).
select student.*,
	class.name
from student
left join class on student.class_id = class.id
where class_id <> 'null';-

-- 2.Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.
select student.* ,
		class.name
from student
left join class on student.class_id = class.id;

-- 3. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
select *from student
where name = 'nguyen minh hai' or name = 'ta dinh huynh';

-- 4. Lấy ra học viên có điểm lớn hơn 5 .
select *from student
where point > 5 and class_id <> 'null';

-- 5. Lấy ra học viên có họ là “nguyen”
select * from student
where name collate 'nguyen';







