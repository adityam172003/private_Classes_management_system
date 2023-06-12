use sesystem;

CREATE TABLE IF NOT EXISTS `sesystem`.`College` (
  `college_id` INT NOT NULL,
  `hometown_id` INT NULL,
  `college_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`college_id`),
  UNIQUE INDEX `college_id_UNIQUE` (`college_id` ASC) VISIBLE,
  UNIQUE INDEX `college_name_UNIQUE` (`college_name` ASC) VISIBLE,
  INDEX `hometown_id_idx` (`hometown_id` ASC) VISIBLE,
  CONSTRAINT `hometown_id`
    FOREIGN KEY (`hometown_id`)
    REFERENCES `SESystem`.`Hometown` (`hometown_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `sesystem`.`Hometown` (
  `hometown_id` INT NOT NULL AUTO_INCREMENT,
  `hometown_name` VARCHAR(45) NULL,
  PRIMARY KEY (`hometown_id`),
  UNIQUE INDEX `hometown_id_UNIQUE` (`hometown_id` ASC) VISIBLE,
  UNIQUE INDEX `hometown_name_UNIQUE` (`hometown_name` ASC) VISIBLE);
  
  
CREATE TABLE IF NOT EXISTS `SESystem`.`Student` (
  `student_id` INT NOT NULL,
  `hometown_id` INT NOT NULL,
  `college_id` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `image` BLOB NULL,
  `address_local` VARCHAR(45) NOT NULL,
  `address_permanant` VARCHAR(45) NULL,
  `birth_date` DATE NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `hometown_id_idx` (`hometown_id` ASC) VISIBLE,
  INDEX `college_id_idx` (`college_id` ASC) VISIBLE,
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE,

  CONSTRAINT `college_id`
    FOREIGN KEY (`college_id`)
    REFERENCES `SESystem`.`College` (`college_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    drop table student;

 
  CREATE TABLE IF NOT EXISTS `SESystem`.`Enquiry` (
  `enquiry_id` INT NOT NULL,
  `student_id` INT NULL,
  `college_id` INT NULL,
  `hometown_id` INT NULL,
  `subject_intreasted` VARCHAR(45) NULL,
  `enquiry_date` DATE NULL,
  PRIMARY KEY (`enquiry_id`),
  UNIQUE INDEX `enquiry_id_UNIQUE` (`enquiry_id` ASC) VISIBLE,
  INDEX `student_id_idx` (`student_id` ASC) VISIBLE,
  INDEX `college_id_idx` (`college_id` ASC) VISIBLE,
  INDEX `hometown_id_idx` (`hometown_id` ASC) VISIBLE,
  CONSTRAINT `student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `SESystem`.`Student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
  
  
  
  
  CREATE TABLE IF NOT EXISTS `SESystem`.`Course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `coursename` VARCHAR(45) NOT NULL,
  `syllabus` VARCHAR(45) NULL,
  `Coursecol` VARCHAR(45) NULL,
  `course_duration` VARCHAR(45) NOT NULL,
  `course_fees` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) VISIBLE,
  UNIQUE INDEX `coursename_UNIQUE` (`coursename` ASC) VISIBLE);
  CREATE TABLE IF NOT EXISTS `SESystem`.`history` (
  `history_id` INT NOT NULL,
  `student_id` INT NULL,
  `enquiry_id` INT NULL,
  `course_id` INT NULL,
  `college_id` INT NULL,
  PRIMARY KEY (`history_id`),
  INDEX `student_id_idx` (`student_id` ASC) VISIBLE,
  INDEX `college_id_idx` (`college_id` ASC) VISIBLE,
  INDEX `enquiry_id_idx` (`enquiry_id` ASC) VISIBLE,
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE
 
    -- ON DELETE NO ACTION
    -- ON UPDATE NO ACTION
    );
    
    
    
    create table admin_credentials
    (	
		adminId INT primary key  AUTO_INCREMENT,
		admin_name varchar(25) unique,
        admin_password varchar(25) not null 
        
    
    );
	
    
    
INSERT INTO admin_credentials(admin_name,admin_password) VALUES ("Aditya_M","pass");
-- INSERT INTO student(student_id,hometown_id,college_id,fname,mname,lname,phone,email,image) Values (1,1,1,"Aditya","Govinda","Mahajan",)
SELECT * FROM admin_credentials;
 select*from hometown;
 select *from college;
 select *from student;
 describe student;
 
drop table hometown;
drop table student;
drop table enquiry;
drop table college;

select * from hometown order by hometown_id;

alter table student
add column mname VARCHAR(25) NOT NULL ;


ALTER TABLE student 
change image  image LONGBLOB not null ;

select * from student;


INSERT INTO enquiry(sudent_id,college_id,hometown_id,subject_intreasted,enquiry_date)
VALUES();
select * from enquiry inner join student on  student.student_id = enquiry.enquiry_id where enquiry.college_id = 2 and enquiry.subject_intreasted like '%DSA%';
select * from enquiry where student_id !=-1;
 select * from student inner join enquiry on enquiry.student_id=student.student_id where student.student_id = (select student_id from student where  student.college_id =2);
 select * from enquiry;
 
  select * from student inner join enquiry on enquiry.student_id=student.student_id  inner join college on college.college_id = student.college_id inner join hometown on hometown.hometown_id = student.hometown_id  where student.student_id =2;
 
 select * from enquiry right join student on student.student_id = enquiry.enquiry_id where student.student_id= (select student_id from student where phone='65231478985');
 
 
 select * from history;
 
 select*from course;
 describe course;
 insert into history(student_id,enquiry_id,course_id,college_id,hometown_id,fees,batch) values(1,1,1,1,1,'122','2023');
 select * from admin_credentials;