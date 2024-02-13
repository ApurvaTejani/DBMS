-- DROP DATABASE IF EXISTS scaler_lect;

CREATE DATABASE IF NOT EXISTS scaler_lect;

USE scaler_lect;

CREATE TABLE IF NOT EXISTS students (
	id	INT PRIMARY KEY,
    first_name VARCHAR(10),
    last_name VARCHAR(10)
);

ALTER TABLE students
	ADD email VARCHAR(20);
    
ALTER TABLE students
	ADD phone VARCHAR(10);
    
ALTER TABLE students 
	ADD CONSTRAINT UK_Email UNIQUE KEY (email);
    
ALTER TABLE students 
	ADD CONSTRAINT UK_Phone UNIQUE KEY (phone);
    
INSERT INTO students
VALUES(1, "A", "B", "a@b.com", "XXX");

-- INSERT INTO students
-- VALUES(1, "C", "D", "c@d.com", "YYY");

-- INSERT INTO students
-- VALUES(2, "C", "D", "a@b.com", "YYY");

-- INSERT INTO students
-- VALUES(2, "C", "D", "c@d.com", "XXX");

INSERT INTO students
VALUES(2, "C", "D", "c@d.com", "YYY");

-- INSERT INTO students
-- VALUES (NULL, "E", "F", "e@f.com", "WWW");

INSERT INTO students
VALUES (3, "E", "F", NULL, "WWW");

INSERT INTO students
VALUES (4, "G", "H", NULL, "VVV");

CREATE TABLE IF NOT EXISTS batches (
	id INT PRIMARY KEY,
    name VARCHAR(10)
);

ALTER TABLE students
	ADD batch_id INT NULL;
    
ALTER TABLE students
	ADD CONSTRAINT FK_Student_Batches FOREIGN KEY (batch_id)
    REFERENCES batches(id);
    
    insert into batches
    values(2,'Batch-02');
UPDATE students
SET batch_id = 1
WHERE id in (3);

ALTER TABLE students
DROP CONSTRAINT FK_Student_Batches;

ALTER TABLE students
DROP COLUMN batch_id;

drop table batches;

-- ALTER TABLE students
-- ALTER COLUMN batch_id INT;


create table if not exists batches(
id int primary key,
name varchar(10) not null,
start_date date,
end_date date
);


create table if not exists mentor(
id int primary key,
name varchar(10) not null,
DOB date,
Experience int
);

create table if not exists Instructor(
id int primary key,
name varchar(10),
DOB date,
Experience int
);

create table if not exists Lecture(
id int primary key,
topic varchar(10) not null
);


alter table students
add mentor_id int;

alter table students 
add constraint FK_students_mentor foreign key(mentor_id)
references mentor(id);

create table batch_lecture(
batch_id int,
lecture_id int,
primary key(batch_id,lecture_id)
);

alter table batch_lecture 
add constraint FK_lecture_batch foreign key(lecture_id)
references lecture(id);


alter table lecture
add instructor_id int;

alter table lecture
add constraint FK_lecture_instructor foreign key(instructor_id)
references instructor(id);


alter table students
add curr_batch_id int;

alter table students
add constraint FK_students_current_batch foreign key(curr_batch_id)
references batches(id);


create table student_prev_batch(
student_id int,
batch_id int,
primary key(student_id,batch_id)
);

alter table student_prev_batch
add constraint FK_batch_student foreign key(batch_id)
references batches(id);


    




