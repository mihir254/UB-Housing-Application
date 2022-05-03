-- // DELETE House_Owner and their respective houses also gets deleted and the student's living in that house becomes empty
DELETE FROM House_Owner WHERE owner_id = '1';
-- Note that : The house of this houseOwener is also deleted

-- //  Delete Student_Occupancy on cases like house floor renovation
DELETE FROM Student_Occupancy where student_id='123' AND house_id='212'
-- // delete a Photo of a house
DELETE FROM Photo where house_id='410' LIMIT 1;
-- // DELETE Degree
DELETE FROM Major where major_code='CHE';

-- DELETE STUDENTS who have emailID other than buffalo's email
DELETE FROM Student where email NOT LIKE '@%buffalo.edu'

-- TRUNCATE
TRUNCATE TABLE Photo;

-- DROP Queries for all the tables
-- DROP TABLE House_Rating;
-- DROP TABLE House_Owner_Rating;
-- DROP TABLE Sublet;
-- DROP TABLE Student_Occupancy;
-- DROP TABLE Student;
-- DROP TABLE Major;
-- DROP TABLE Degree;
-- DROP TABLE Photo;
-- DROP TABLE House;
-- DROP TABLE Street;
-- DROP TABLE House_Owner;
