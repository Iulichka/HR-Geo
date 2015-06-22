use webproject;

create table persons(
	persons_id int not null auto_increment,
	person_name varchar(64) not null,
    person_surname varchar(64) not null,
    person_password varchar(64) not null,
    person_id_number varchar(64) not null unique key,
    person_birth_date Date not null,
    person_email varchar(64) not null unique key,
    person_sex enum('MALE','FEMALE'),
    person_education enum('არავითარი','საშუალო','ბაკალავრი','მაგისტრატურა','დოქტორი'),
	person_info text,
    constraint persons_info_pk primary key(persons_id)
);


create table skill_category(
	category_id int not null auto_increment,
    category_name varchar(64) not null,
    constraint category_id_pk primary key(category_id)

);
create  table skills(
	skills_id int not null auto_increment,
    skill_name varchar(64),
    searched_number int not null,
    category_id int not null,
    constraint person_skills_pk primary key(skills_id),
    constraint person_skills_fk foreign key (category_id) references skill_category(category_id)
);


create table vacancy_category(
	vacancy_category_id int not null auto_increment,
    vacancy_name varchar(100) not null,
    constraint vacancy_category_pk primary key(vacancy_category_id)
);



create table persons_vacancy(
	vacancy_category_id int not null,
    persons_id int not null,
    constraint persons_vacancy_fk1 foreign key(vacancy_category_id) references vacancy_category(vacancy_category_id),
    constraint persons_vacancy_fk2 foreign key(persons_id) references persons(persons_id),
    constraint pk primary key(vacancy_category_id, persons_id)
);


create table skill_level(
	skill_level_id int not null auto_increment,
    skill_level_name varchar(64) not null,
    constraint skill_level_pk primary key (skill_level_id)
);


create table person_skills(
    skills_id int not null,
    persons_id int not null,
    skill_level_id int not null,
    constraint person_skills_fk1 foreign key (skills_id) references skills(skills_id),
    constraint person_skills_fk2 foreign key (persons_id) references persons(persons_id),
    constraint person_skills_fk4 foreign key (skill_level_id) references skill_level(skill_level_id),
    constraint pk primary key (skills_id, persons_id)
);



create table person_photoes(
	person_photo_id int not null auto_increment,
    person_photo mediumblob,
    persons_id int not null,
    constraint person_photoes_pk primary key(person_photo_id),
    constraint person_phptoes_fk foreign key(persons_id) references persons(persons_id)

);

create table university(
	university_id int not null auto_increment,
    university_name varchar (64) not null,
    constraint university_id_pk primary key(university_id)
);

create table person_CV(
	person_CV_id int not null auto_increment,
    person_CV mediumblob not null,
    persons_id int not null,
    constraint person_CV_pk primary key(person_CV_id),
    constraint person_CV_fk foreign key(persons_id) references persons(persons_id)

);
create table faculty(
	faculty_id int not null auto_increment,
    faculty_name varchar(64) not null,
    constraint faculty_pk primary key(faculty_id)

);
create table company_info(
	company_id int not null auto_increment,
    company_name varchar(64) not null,
    company_email varchar(64) not null unique key,
    company_info TEXT,
    company_password varchar(64) not null,
    company_rating double not null,
    voters_number int not null,
    company_telephone varchar(64) ,
    company_site varchar(64),
    constraint company_info primary key(company_id)
);
create table company_photo(
	company_photo_id int not null auto_increment,
    company_id int not null,
    company_photo mediumblob not null,
    constraint company_photo_pk primary key(company_photo_id),
    constraint company_photo_fk foreign key (company_id) references company_info (company_id)

);
create table person_university(
    persons_id int not null,
    university_id int not null,
    faculty_id int not null,
    graduation_year int ,
    graduation_type enum('საშუალო','ბაკალავრი','მაგისტრატურა','დოქტორი'),
    constraint person_university_fk1 foreign key(university_id) references university(university_id),
    constraint person_university_fk2 foreign key(faculty_id) references faculty(faculty_id),
	constraint person_university_fk3 foreign key(persons_id) references persons(persons_id),
    constraint pk primary key (persons_id, university_id, faculty_id)
);


create table working_experience(
	working_experience_id int not null primary key auto_increment,
	persons_id int not null,
    company_name varchar(50) not null,
    position varchar(100) not null,
    job_start_date date not null,
    job_end_date date,
    constraint working_experience_fk1 foreign key(persons_id) references persons(persons_id)
);

create table offer(
	offer_id int not null auto_increment,
    offer_info text,
    offer_name varchar(100) not null,
    offer_start_date date not null,
    offer_end_date date not null,
    company_id int not null,
    constraint offer_pk primary key(offer_id),
    constraint offer_fk foreign key (company_id) references company_info(company_id)
);

create table persons_offer(
	offer_id int not null,
    persons_id int not null,
    offer_state enum('success','danger','warning','active'),
    email_state enum('visible','not_visible'),
    constraint persons_offer_fk1 foreign key(offer_id) references offer(offer_id),
    constraint persons_offer_fk2 foreign key(persons_id) references persons(persons_id)

);
create table documents(
	document_id int not null auto_increment,
    document_name varchar(64) not null,
    document_file mediumblob not null,
    persons_id int not null,
    constraint document_pk primary key(document_id),
    constraint document_fk foreign key(persons_id) references persons(persons_id)
);