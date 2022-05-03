SELECT owner_id as Owner, first_name as 'First Name', last_name as 'Last Name', phone_no as Phone, email as Email, rating as Rating FROM House_Owner;
SELECT house_id as House, owner_id as Owner, max_occ as 'Maximum Occupants', bedroom as 'Number of bedrooms', bathroom as 'Number of bathrooms', electricity as 'Electricity included', no_of_floor as 'Number of floors', rent as Rent, pets as 'Pets Allowed', smoking as 'Smoking Allowed', parking as 'Parking Space Included', wifi_included as 'Wifi Included', heating as 'Heating Included', location as Location, water as 'Water Included', snow as 'Snow Removal Included', gas as 'Gas Included', trash as 'Trash Included', rating as Rating, microwave as 'Microwave Included', washing_machine as 'Washing Machine Included', dishwasher as 'Dishwasher Included', oven as 'Oven Included', stove as 'Stove Included', is_occupied as 'Is Occupied' FROM House;
SELECT id as Photo, house_id as House, links as Links FROM Photo;
SELECT degree_id as Degree, name as Name FROM degree_enum;
SELECT student_id as Student, email as Email, first_name as 'First Name', last_name as 'Last Name', phone as Phone, gender as Gender, location as Location, major as Major, food_pref as 'Food Preference', nationatlity as Nationality, gender_pref as 'Gender Preference', degree_id as Degree FROM Student;
SELECT occupancy_id as Occupany, house_id as House, student_id as Student FROM Student_Occupancy;
SELECT sublet_id as 'Sublet', sublet_from as 'Sublet From', sublet_to as 'Sublet To', from_date as 'From Date', to_date as 'To Date' FROM Sublet;
SELECT rating_id as Rating, house_id as House, owner_id as Owner, house_rating as 'House Rating', owner_rating as 'Owner Rating' FROM Rating;
SELECT house_id as House, owner_id as Owner, max_occ as 'Maximum Occupants', bedroom as 'Number of bedrooms', bathroom as 'Number of bathrooms', electricity as 'Electricity included', no_of_floor as 'Number of floors', rent as Rent, pets as 'Pets Allowed', smoking as 'Smoking Allowed', parking as 'Parking Space Included', wifi_included as 'Wifi Included', heating as 'Heating Included', location as Location, water as 'Water Included', snow as 'Snow Removal Included', gas as 'Gas Included', trash as 'Trash Included', rating as Rating, microwave as 'Microwave Included', washing_machine as 'Washing Machine Included', dishwasher as 'Dishwasher Included', oven as 'Oven Included', stove as 'Stove Included', is_occupied as 'Is Occupied' FROM House WHERE bedroom < 3;
SELECT house_id as House, owner_id as Owner, max_occ as 'Maximum Occupants', bedroom as 'Number of bedrooms', bathroom as 'Number of bathrooms', electricity as 'Electricity included', no_of_floor as 'Number of floors', rent as Rent, pets as 'Pets Allowed', smoking as 'Smoking Allowed', parking as 'Parking Space Included', wifi_included as 'Wifi Included', heating as 'Heating Included', location as Location, water as 'Water Included', snow as 'Snow Removal Included', gas as 'Gas Included', trash as 'Trash Included', rating as Rating, microwave as 'Microwave Included', washing_machine as 'Washing Machine Included', dishwasher as 'Dishwasher Included', oven as 'Oven Included', stove as 'Stove Included', is_occupied as 'Is Occupied' FROM House WHERE bedroom < 3 and bathroom > 2 ORDER BY rent;
SELECT house_id as House, owner_id as Owner, max_occ as 'Maximum Occupants', bedroom as 'Number of bedrooms', bathroom as 'Number of bathrooms', electricity as 'Electricity included', no_of_floor as 'Number of floors', rent as Rent, pets as 'Pets Allowed', smoking as 'Smoking Allowed', parking as 'Parking Space Included', wifi_included as 'Wifi Included', heating as 'Heating Included', location as Location, water as 'Water Included', snow as 'Snow Removal Included', gas as 'Gas Included', trash as 'Trash Included', rating as Rating, microwave as 'Microwave Included', washing_machine as 'Washing Machine Included', dishwasher as 'Dishwasher Included', oven as 'Oven Included', stove as 'Stove Included', is_occupied as 'Is Occupied' FROM House ORDER BY rent;



SELECT SO.house_id as 'HouseID', H.line1 as 'Address', St.name as 'Street', S.first_name as 'First Name', S.last_name as 'Last Name'
FROM Student_Occupancy as SO
JOIN House H ON H.house_id = SO.house_id
JOIN Student S ON S.student_id = SO.student_id
JOIN Street St ON St.street_id = H.street_id
WHERE H.house_id = 2;

select count(student_occupancy.occupancy_id) into occupants
from student_occupancy O1, student_occupancy O2
where O1.house_id = O2.houseid;

SELECT SO.house_id, H.line1, St.name, S.student_id, S.last_name, M.major_name
FROM Student_Occupancy as SO
JOIN House H ON H.house_id = SO.house_id
JOIN Student S ON S.student_id = SO.student_id
JOIN Street St ON St.street_id = H.street_id
JOIN Major M ON M.major_code = S.major_code
WHERE M.major_code='CSE' and St.name='fxrzefmd St.'-- group by St.name,SO.house_id, H.line1, St.name, S.student_id, S.last_name, M.major_name;