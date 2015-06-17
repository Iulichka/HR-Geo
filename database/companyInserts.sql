use webproject;

delete from company_info;

insert into company_info 
(company_name, company_email, company_info, company_password, company_rating, voters_number, company_telephone, company_site)
values ('სოკარი', 'socar@yahoo.com', 'კავკასიაში პირველი ნავთობკომპანია', '123456', 6,0,'555 77 88 99', 'www.gulf.com'),
('გალფი', 'gulf@yahoo.com', 'კავკასიაში მეორე ნავთობკომპანია', '123456', 6,0, '555 77 88 99', 'www.gulf.com'),
('ვისოლი', 'oil@yahoo.com', 'ძაან მაგარი კომპანია', '123456', 5,0, '555 77 88 99', 'www.wissol.ge'),
('გლდანის შაურმა', 'shaurma@yahoo.com', 'უგემრიელესი შაურამა მთელს საქართველოში', '123456', 4,0, '555 77 88 99', 'www.shaurma.ge'),
('KPMG', 'KPMG@yahoo.com', 'big four', '123456', 2,0, '555 77 88 99', 'www.kpmg.com');
