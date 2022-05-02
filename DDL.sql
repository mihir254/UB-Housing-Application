
-- DROP table State;
-- DROP table Country;
-- DROP TABLE Rating;
-- DROP TABLE Sublet;
-- DROP TABLE Student_Occupancy;
-- DROP TABLE Student;
-- DROP TABLE Major;
-- DROP TABLE Degree_enum;
-- DROP TABLE Photo;
-- DROP TABLE House;
-- DROP TABLE House_Owner;



create table House_Owner
	(
	 owner_id INTEGER PRIMARY KEY NOT NULL,
	 first_name	varchar(50) not null,
	 last_name varchar(50) not null,
	 phone_no	varchar(13) UNIQUE,
	 email	varchar(50) UNIQUE,
	 rating	INTEGER,
	 password varchar(50)
	);

create table Country
		(
		country_id INTEGER PRIMARY KEY NOT NULL,
		iso_code varchar(3),
		name varchar(50),
		phonecode INTEGER
		);


create table State
	(
	state_id INTEGER PRIMARY KEY NOT NULL,
	name varchar(50),
	country_id INTEGER,
	FOREIGN KEY(country_id)
			REFERENCES Country(country_id) ON DELETE CASCADE
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
		line2 varchar(100) NOT NULL,
		city varchar(50) NOT NULL,
		state_id INTEGER NOT NULL,
		water BOOLEAN,
		snow BOOLEAN,
		gas BOOLEAN,
		trash BOOLEAN,
		rating INTEGER,
		microwave BOOLEAN,
		washing_machine BOOLEAN,
		dishwasher BOOLEAN,
		oven BOOLEAN,
		stove BOOLEAN,
		is_occupied BOOLEAN,
		FOREIGN KEY(owner_id)
	  		REFERENCES House_Owner(owner_id) ON DELETE CASCADE,
		FOREIGN KEY(state_id)
			  REFERENCES State(state_id) ON DELETE SET NULL
	);

create table Photo
	(
	id INTEGER PRIMARY KEY NOT NULL,
	house_id INTEGER,
	links varchar(50),
	 FOREIGN KEY(house_id)
	  		REFERENCES House(house_id) ON DELETE CASCADE
	);


create table Degree_enum
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
	location varchar(100),
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
	  		REFERENCES Degree_enum(degree_id) ON DELETE SET NULL,
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

create table Rating
	(
	rating_id INTEGER PRIMARY KEY NOT NULL,
	student_id INTEGER,
	house_id INTEGER,
	owner_id INTEGER,
	house_rating DECIMAL(1,0),
	owner_rating DECIMAL(1,0),
	FOREIGN KEY(student_id)
	  		REFERENCES Student(student_id) ON DELETE CASCADE,
	FOREIGN KEY(house_id)
	  		REFERENCES House(house_id) ON DELETE CASCADE,
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
