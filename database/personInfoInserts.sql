use webproject;
insert into persons
(person_name,person_surname,person_password,person_id_number,person_birth_date
,person_email,person_sex,person_education,person_info)
values
('zura','zuradze','zura','01024070112','1994-01-01','zura@gmail.com','MALE','არავითარი','ტიპიაა'),
('dato','datodze','dato','01024070111','1995-01-01','dato@gmail.com','MALE','არავითარი','ტიპიაა'),
('არისტოფანე','ანდამატი','aristo','01024070178','1984-01-01','aristo@gmail.com','MALE','არავითარი','ტიპიაა'),
('მაყვალა','ამილახვარი','mayvala','01024070145','1993-01-01','mayvala@gmail.com','FEMALE','არავითარი','ტიპიაა');




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
('PHP',0,1),
('MySQL',0,1),
('Javascript',0,1),
('Perl',0,1),
('Oracle',0,1),
('C#',0,1),
('C',0,1),
('C++',0,1),
('Word',0,2),
('Excel',0,2),
('Powerpoint',0,2),
('Russian',0,3),
('French',0,3),
('Korean',0,3),
('English',0,3);

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
(1,1,2),
(2,1,3),
(4,1,1),
(1,2,2),
(2,2,2);



-- insert into facultys
insert into faculty
(faculty_name)
values
('ბიზნესის ადმინისტრირება'),
('პროგრამირება'),
('ფიზიკა'),
('ქიმია'),
('ბიოლოგია'),
('მათემატიკა'),
('ისტორია');


--  inserts into university
insert into university
(university_name)
values
('თავისუფალი უნივერსიტეტი'),
('ჯავახიშვილის უნივერსიტეტი'),
('საქართველოს უნივერსიტეტი'),
('თბილისის ტექნიკური უნივერსიტეტი'),
('საქართველოს ეროოვნული უნივერსიტეტი');

-- insert into person_university
insert into person_university
(persons_id,university_id,faculty_id,graduation_year,graduation_type)
values
(1,1,1,2009,'მაგისტრატურა'),
(2,2,2,2010,'ბაკალავრი'),
(3,1,4,2012,'მაგისტრატურა'),
(1,1,2,2011,'დოქტორი');



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
('Java','java programmer','2015-07-20','2015-08-10',1),
('C# Programmer','c# programmer','2015-07-20','2015-08-10',3),
('Translator','translator from french','2015-07-20','2015-08-10',4),
('PHP Programmer','php programmer','2015-07-20','2015-08-10',2);


insert into persons_offer
(offer_id,persons_id,offer_state,email_state)
values
(3,2,'active','visible'),
(2,2,'active','visible'),
(1,2,'active','visible'),
(3,1,'success','visible'),
(1,1,'warning','visible');
