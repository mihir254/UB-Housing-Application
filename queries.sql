SELECT owner_id as Owner, first_name as "First Name", last_name as "Last Name", phone_no as Phone, email as Email, rating as Rating FROM House_Owner;

------Retrive all the details from the house table limit by 500------------
SELECT house_id as House, owner_id as Owner, max_occ as "Maximum Occupants", bedroom as "Number of bedrooms", bathroom as "Number of bathrooms",
electricity as "Electricity included", no_of_floor as "Number of floors",
rent as Rent, pets as "Pets Allowed", smoking as "Smoking Allowed", parking as "Parking Space Included",
wifi_included as "Wifi Included", heating as "Heating Included", water as "Water Included",
snow as "Snow Removal Included", gas as "Gas Included", trash as "Trash Included",
rating as Rating, microwave as "Microwave Included", washing_machine as "Washing Machine Included", 
dishwasher as "Dishwasher Included", oven as "Oven Included", stove as "Stove Included", is_occupied as "Is Occupied" FROM House limit 500;


-----Retrieve the list of houses with less than 3 bedrooms
SELECT house_id as House, owner_id as Owner, max_occ as "Maximum Occupants", 
bedroom as "Number of bedrooms", bathroom as "Number of bathrooms", electricity as "Electricity included",
no_of_floor as "Number of floors", rent as Rent, pets as "Pets Allowed", smoking as "Smoking Allowed",
parking as "Parking Space Included", wifi_included as "Wifi Included", heating as "Heating Included", line1 as Location,
water as "Water Included", snow as "Snow Removal Included", gas as "Gas Included", trash as "Trash Included",
rating as Rating, microwave as "Microwave Included", washing_machine as "Washing Machine Included", dishwasher as "Dishwasher Included", oven as "Oven Included", stove as "Stove Included",
is_occupied as "Is Occupied" FROM House WHERE bedroom < 3;

-------less than 3 bedrooms and more than 2 bathrooms and oderered by rent
Explain analyze SELECT house_id as House, owner_id as Owner, max_occ as "Maximum Occupants",
bedroom as "Number of bedrooms", bathroom as "Number of bathrooms", electricity as "Electricity included",
no_of_floor as "Number of floors", rent as Rent, pets as "Pets Allowed", smoking as "Smoking Allowed",
parking as "Parking Space Included", wifi_included as "Wifi Included", heating as "Heating Included",
line1 as Location, water as "Water Included", snow as "Snow Removal Included", gas as "Gas Included",
trash as "Trash Included", rating as Rating, microwave as "Microwave Included", washing_machine as "Washing Machine Included",
dishwasher as "Dishwasher Included", oven as "Oven Included", stove as "Stove Included", is_occupied as "Is Occupied"
FROM House WHERE bedroom < 5 and bathroom > 2 ORDER BY rent;

-----------Order by rent on houses
SELECT house_id as House, owner_id as Owner, max_occ as "Maximum Occupants", bedroom as "Number of bedrooms",
bathroom as "Number of bathrooms", electricity as "Electricity included", no_of_floor as "Number of floors",
rent as Rent, pets as "Pets Allowed", smoking as "Smoking Allowed", parking as "Parking Space Included",
wifi_included as "Wifi Included", heating as "Heating Included", line1 as Location, water as "Water Included", snow as "Snow Removal Included", gas as "Gas Included",
trash as "Trash Included", rating as Rating, microwave as "Microwave Included", washing_machine as "Washing Machine Included",
dishwasher as "Dishwasher Included", oven as "Oven Included", stove as "Stove Included", is_occupied as "Is Occupied"
FROM House ORDER BY rent;
-------- select the list of house_owners who own houses with number of bedrooms >3------
-- create index optimizer2 on House(street_id);
drop index optimizer2;

explain analyze select first_name,last_name,phone_no,email 
from house_owner ho where ho.owner_id in 
(select owner_id from house h  inner join street s on h.street_id =s.street_id and s.name ='fxrzefmd St.')
select first_name,last_name,phone_no,email from house_owner ho where ho.owner_id in (select owner_id from house h  inner join street s on h.street_id =s.street_id and s.name ='fxrzefmd St.')
----- Every student who lives in a pirticular house --------
SELECT SO.house_id as "HouseID", H.line1 as "Address", St.name as "Street", S.first_name as "First Name", S.last_name as "Last Name"
FROM Student_Occupancy as SO
JOIN House H ON H.house_id = SO.house_id
JOIN Student S ON S.student_id = SO.student_id
JOIN Street St ON St.street_id = H.street_id
WHERE H.house_id = 2;

---------No of students in a house0--------
select count(SO1.occupancy_id) as occupants
from student_occupancy SO1 
where SO1.house_id =2;

-----------------------List of houses where atleast one student preferes non vegetarians --------------------------------
create index optimizer3 on student(food_pref);
explain analyze select * from house h inner join student_occupancy so on h.house_id =so.house_id inner join student s on s.student_id = so.student_id and s.food_pref = 'NV';
---------------Number of students who live on the given street from the given department--------
create index optimizer1 on Student(major_code);
EXPLAIN ANALYSE SELECT SO.house_id, H.line1, St.name, S.student_id, S.last_name, M.major_name
FROM Student_Occupancy as SO
JOIN House H ON H.house_id = SO.house_id
JOIN Student S ON S.student_id = SO.student_id
JOIN Street St ON St.street_id = H.street_id
JOIN Major M ON M.major_code = S.major_code
WHERE M.major_code='CSE' and St.name='fxrzefmd St.';


------ Details of the students in CSE department grouped by the streets where they live in--------
SELECT SO.house_id, H.line1, St.name, S.student_id, S.last_name, M.major_name
FROM Student_Occupancy as SO
JOIN House H ON H.house_id = SO.house_id
JOIN Student S ON S.student_id = SO.student_id
JOIN Street St ON St.street_id = H.street_id
JOIN Major M ON M.major_code = S.major_code
WHERE M.major_code='CSE' group by St.name,SO.house_id, H.line1, St.name, S.student_id, S.last_name, M.major_name;;


------Bulk selects ----- not used in the application--------
-------------
SELECT id as Photo, house_id as House, links as Links FROM Photo;
SELECT degree_id as Degree, name as Name FROM degree_enum;
SELECT student_id as Student, email as Email, first_name as "First Name", last_name as "Last Name", phone as Phone, gender as Gender, location as Location, major as Major, food_pref as "Food Preference", nationatlity as Nationality, gender_pref as "Gender Preference", degree_id as Degree FROM Student;
SELECT occupancy_id as Occupany, house_id as House, student_id as Student FROM Student_Occupancy;
SELECT sublet_id as "Sublet", sublet_from as "Sublet From", sublet_to as "Sublet To", from_date as "From Date", to_date as "To Date" FROM Sublet;
SELECT rating_id as Rating, house_id as House, owner_id as Owner, house_rating as "House Rating", owner_rating as "Owner Rating" FROM Rating;
