insert into company_info 
(company_name, company_email, company_info, company_password, company_rating, voters_number, company_telephone, company_site)
values ('სოკარი', 'socar@yahoo.com', 'კავკასიაში პირველი ნავთობკომპანია', '123456', 6,0,'555 77 88 99', 'www.gulf.com'),
('გალფი', 'gulf@yahoo.com', 'კავკასიაში მეორე ნავთობკომპანია', '123456', 6,0, '555 77 88 99', 'www.gulf.com'),
('ვისოლი', 'oil@yahoo.com', 'ძაან მაგარი კომპანია', '123456', 5,0, '555 77 88 99', 'www.wissol.ge'),
('გლდანის შაურმა', 'shaurma@yahoo.com', 'უგემრიელესი შაურამა მთელს საქართველოში', '123456', 4,0, '555 77 88 99', 'www.shaurma.ge'),
('KPMG', 'KPMG@yahoo.com', 'big four', '123456', 2,0, '555 77 88 99', 'www.kpmg.com');

insert into persons
(person_name,person_surname,person_password,person_id_number,person_birth_date
,person_email,person_sex,person_education,person_info)
values
('zura','zuradze','zura','01024070112','1994-01-01','zura@gmail.com','MALE','არავითარი','ტიპიაა'),
('dato','datodze','dato','01024070111','1994-01-01','dato@gmail.com','MALE','არავითარი','ტიპიაა');


<<<<<<< HEAD
insert into person_photoes
(person_photo,persons_id)
values
(load_file('C:/Users/Nodo/Desktop/New folder/pic.jpg'),1);
=======
>>>>>>> 6114d3a1ebc11697cad00e3ec01b94c12b3bc7c9


-- skill category inserts
insert into skill_category
(category_name)
values
('Programming'),
('MS Programs'),
('Languages'),
('Personal');

-- skill inserts

insert into skills
(skill_name,searched_number,category_id)
values
('Java',0,1),
('Word',0,2),
('Russian',0,3);

-- skill level insert 

insert into skill_level
(skill_level_name)
values
('Beginner'),
('Novice'),
('Pre-Intermediate'),
('Intermediate'),
('Advance/Expert');

-- person skills insertions

insert into  person_skills
(skills_id,persons_id,skill_level_id)
values
(1,1,2);



-- insert into facultys
insert into faculty
(faculty_name)
values
('ბიზნესის ადმინისტრირება'),
('პროგრამირება'),
('ფიზიკა');


--  inserts into university
insert into university
(university_name)
values
('თავისუფალი უნივერსიტეტი'),
('ჯავახიშვილის უნივერსიტეტი');

-- insert into person_university
insert into person_university
(persons_id,university_id,faculty_id,graduation_year,graduation_type)
values
(1,1,2,2009,'დოქტორი');



-- insert into working exp
insert into working_experience
(persons_id,company_name,position,job_start_date,job_end_date)
values
(1,'KPMG','assistante','2009-09-14','2010-09-28'),
(1,'EY','Partner','2011-09-14','2012-09-28');
-- insert into person_university
insert into offer
(offer_info,offer_name,offer_start_date,offer_end_date,company_id)
values
('PHP Programmer Vacancy','PHP Programmer','2015-07-20','2015-08-10',3),
('Java pto','java','2015-07-20','2015-08-10',3);

use  webproject;

insert into persons_offer
(offer_id,persons_id,offer_state,email_state)

values
(1,1,'warning','visible'),
(1,2,'warning','visible'),
(2,2,'warning','visible'),
(2,2,'warning','visible');

