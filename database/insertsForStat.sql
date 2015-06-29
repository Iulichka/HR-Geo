use webproject;

SET SQL_SAFE_UPDATES = 0;

update skills set searched_number = 3 where skill_name = 'Java';

update skills set searched_number = 5 where skill_name = 'Word';

update skills set searched_number = 4 where skill_name = 'Russian';

insert into university
(university_name)
values
('საქართველოს უნივერსიტეტი'),
('ილიას უნივერსიტეტი');

insert into person_university
(persons_id,university_id,faculty_id,graduation_year,graduation_type)
values
(1,2,2,2009,'მაგისტრატურა'),
(2,2,2,2009,'მაგისტრატურა'),
(1,3,2,2009,'ბაკალავრი'),
(2,4,2,2009,'ბაკალავრი'),
(3,4,2,2009,'მაგისტრატურა');


insert into person_university
(persons_id,university_id,faculty_id,graduation_year,graduation_type)
values
(1,1,1,2009,'ბაკალავრი');
