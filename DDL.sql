--
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

create table House_Owner
	(
	 owner_id INTEGER PRIMARY KEY NOT NULL,
	 first_name	varchar(50) not null,
	 last_name varchar(50) not null,
	 phone_no	varchar(13) UNIQUE,
	 email	varchar(50) UNIQUE,
	 rating	DECIMAL(2,1),
	 password varchar(50)
	);


create table Street
	(
	street_id INTEGER PRIMARY KEY NOT NULL,
	name varchar(50)
	);

create table House
	(
		house_id INTEGER PRIMARY KEY NOT NULL,
		owner_id INTEGER NOT NULL,
		max_occ INTEGER NOT NULL,
		bedroom INTEGER NOT NULL,
		bathroom INTEGER,
		electricity BOOLEAN NOT NULL,
		no_of_floor INTEGER NOT NULL,
		rent INTEGER NOT NULL,
		pets BOOLEAN,
		smoking BOOLEAN,
		parking BOOLEAN,
		wifi_included BOOLEAN,
		heating BOOLEAN,
		line1 varchar(100) NOT NULL,
		street_id INTEGER NOT NULL,
		water BOOLEAN,
		snow BOOLEAN,
		gas BOOLEAN,
		trash BOOLEAN,
		rating DECIMAL(2,1),
		microwave BOOLEAN,
		washing_machine BOOLEAN,
		dishwasher BOOLEAN,
		oven BOOLEAN,
		stove BOOLEAN,
		is_occupied BOOLEAN,
		FOREIGN KEY(owner_id)
	  		REFERENCES House_Owner(owner_id) ON DELETE CASCADE,
		FOREIGN KEY(street_id)
			  REFERENCES Street(street_id) ON DELETE SET NULL
	);

create table Photo
	(
	id INTEGER PRIMARY KEY NOT NULL,
	house_id INTEGER,
	link varchar(50),
	 FOREIGN KEY(house_id)
	  		REFERENCES House(house_id) ON DELETE CASCADE
	);


create table Degree
	(
	degree_id INTEGER PRIMARY KEY NOT NULL,
	name varchar(50)
	);

create table Major(
	major_code varchar(3) PRIMARY KEY NOT NULL,
	major_name varchar(50)
);

create table Student
	(
	student_id INTEGER PRIMARY KEY NOT NULL,
	email varchar(50) UNIQUE,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	phone varchar(13) UNIQUE,
	gender varchar(1),
	major_code varchar(3),
	food_pref varchar(2),
	nationality varchar(20),
	gender_pref varchar(1),
	degree_id INTEGER,
	password varchar(50),
	CHECK (gender in ('m','f','o')),
	CHECK (gender_pref in ('m','f','o')),
	CHECK (food_pref in ('V','NV','NA')),
	FOREIGN KEY(degree_id)
	  		REFERENCES Degree(degree_id) ON DELETE SET NULL,
	FOREIGN KEY(major_code)
				REFERENCES Major(major_code) ON DELETE SET NULL
	);


create table Student_Occupancy
	(
	occupancy_id INTEGER PRIMARY KEY NOT NULL,
	house_id INTEGER,
	student_id INTEGER,
	FOREIGN KEY(house_id)
	  		REFERENCES House(house_id) ON DELETE CASCADE,
	FOREIGN KEY(student_id)
	  		REFERENCES Student(student_id) ON DELETE CASCADE
	);

create table Sublet
	(
	sublet_id INTEGER PRIMARY KEY NOT NULL,
	sublet_from INTEGER,
	sublet_to INTEGER,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY(sublet_from)
	  		REFERENCES Student(student_id) ON DELETE SET NULL,
	FOREIGN KEY(sublet_to)
	  		REFERENCES Student(student_id) ON DELETE SET NULL
	);

create table House_Rating
	(
	rating_id INTEGER PRIMARY KEY NOT NULL,
	student_id INTEGER,
	house_id INTEGER,
	rating INTEGER,
	FOREIGN KEY(student_id)
	  		REFERENCES Student(student_id) ON DELETE CASCADE,
	FOREIGN KEY(house_id)
	  		REFERENCES House(house_id) ON DELETE CASCADE
	);

create table House_Owner_Rating
		(
		rating_id INTEGER PRIMARY KEY NOT NULL,
		student_id INTEGER,
		owner_id INTEGER,
		rating INTEGER NOT NULL,
		CHECK (rating BETWEEN 0 AND 5),
		FOREIGN KEY(student_id)
		  		REFERENCES Student(student_id) ON DELETE CASCADE,
		FOREIGN KEY(owner_id)
		  		REFERENCES House_Owner(owner_id) ON DELETE CASCADE
		);







--
--
-- INSERT INTO House_Owner VALUES (460, 'ndxs', 'rhjmzocv', '9900313112', 'qdzxjaz@gmail.com', 0);
-- INSERT INTO House VALUES (1, 460, 4, 4, 2, False, 1, 3500, True, False, True, True, False, 'eadl', True, True, False, True, 5, True, False, True, True, True, True);
-- INSERT INTO degree_enum VALUES (3, 'XQ');
-- INSERT INTO Major VALUES ('CSE', 'Computer Science and Engineering');
-- INSERT INTO Major VALUES ('MEM', 'Engineering Management');
-- INSERT INTO Student VALUES (237, 'lrjvcqvk@gmail.com', 'zwjx', 'oqqyck', '1244664256', 'm', 'qnxud', 'CSE', 'NV', 'eedu', 'm', 3,'xyzpw');
-- INSERT INTO Student VALUES (238, 'lrjv21cqvk@gmail.com', 'zwjx', 'oqqyck', '1241234664256', 'm', 'qnxud', 'MEM', 'NV', 'eedu', 'm', 3,'xyzpw');
-- INSERT INTO Student_Occupancy VALUES (3, 1, 237);
-- INSERT INTO Sublet VALUES (4, 237, 238, '2/10/2020', '9/19/2021');
-- INSERT INTO Rating VALUES (3, 237, 1, 460, 4, 2);
-- INSERT INTO Photo VALUES (2, 1, 'http://www.ecfkwxmsanw.com/house-photo');
