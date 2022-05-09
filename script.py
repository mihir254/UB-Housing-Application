import string
import random
random.seed(1)

def insert_owner(table_name, attributes, tuples):
	f = open("insert.sql", "a")
	for i in range(tuples):
		first = "".join(random.choices(string.ascii_lowercase, k = random.randint(4, 6)))
		last = "".join(random.choices(string.ascii_lowercase, k = random.randint(5, 8)))
		phone = "".join(random.choices(string.digits, k = 10))
		email = "".join(random.choices(string.ascii_lowercase, k = random.randint(5, 8))) + "@gmail.com"
		rating = random.randint(0, 5)
		password = "".join(random.choices(string.ascii_letters, k = random.randint(6, 8)))
		f.write("INSERT INTO " + table_name + "(" + attributes + ")" + " VALUES (" + str(i+1) + ", '" + first + "', '" + last + "', '" + phone + "', '" + email + "', " + str(rating) + ", '" + password + "');\n")
	f.close()

def insert_student(table_name, attributes, tuples, temp):
	f = open("insert.sql", "a")
	gender_list, food_pref_list, gender_pref_list = ['m', 'f', 'o'], ['V', 'NV', 'NA'], ['m', 'f', 'o'] 
	for i in range(tuples):
		first = "".join(random.choices(string.ascii_lowercase, k = random.randint(4, 6)))
		last = "".join(random.choices(string.ascii_lowercase, k = random.randint(5, 8)))
		phone = "".join(random.choices(string.digits, k = 10))
		email = "".join(random.choices(string.ascii_lowercase, k = random.randint(5, 8))) + "@buffalo.edu"
		gender = gender_list[random.randint(0, len(gender_list)-1)]
		location = "".join(random.choices(string.ascii_lowercase, k = random.randint(4, 8)))
		major = temp[random.randint(0, len(temp)-1)]
		food_pref = food_pref_list[random.randint(0, len(food_pref_list)-1)]
		nationality = "".join(random.choices(string.ascii_lowercase, k = random.randint(4, 8)))
		gender_pref = gender_pref_list[random.randint(0, len(gender_pref_list)-1)]
		degree = random.randint(1, 5)
		password = "".join(random.choices(string.ascii_letters, k = random.randint(6, 8)))
		f.write("INSERT INTO " + table_name + "(" + attributes + ")" + " VALUES (" + str(i+1) + ", '" + email + "', '" + first + "', '"
				+ last + "', '" + phone + "', '" + gender + "', '" + major + "', '" + food_pref + "', '" + nationality + "', '" + gender_pref + "', " + str(degree) + ", '" + password + "');\n")
	f.close()

def insert_rating_owner(table_name, attributes, tuples):
	f = open("insert.sql", "a")
	stud_id = random.sample(range(1, 3000), tuples)
	owner_id = random.sample(range(1, 201), tuples)
	for i in range(tuples):
		rate_owner = random.randint(0, 5)
		f.write("INSERT INTO " + table_name + "(" + attributes + ")" + " VALUES (" + str(i+1) + ", " + str(stud_id[i]) +
				", " + str(owner_id[i]) + ", " + str(rate_owner) + ");\n")
	f.close()

def insert_rating_house(table_name, attributes, tuples):
	f = open("insert.sql", "a")
	stud_id = random.sample(range(1, 3000), tuples)
	house_id = random.sample(range(1, 1000), tuples)
	for i in range(tuples):
		rate_house = random.randint(0, 5)
		f.write("INSERT INTO " + table_name + "(" + attributes + ")" + " VALUES (" + str(i+1) + ", " + str(stud_id[i]) + ", " + str(house_id[i])
				 + ", " + str(rate_house) + ");\n")
	f.close()

def insert_occupancy(table_name, attributes, tuples):
	f = open("insert.sql", "a")
	stud_id = random.sample(range(1, 3000), tuples)
	house_id = random.sample(range(1, 1000), tuples)
	for i in range(tuples):
		f.write("INSERT INTO " + table_name + "(" + attributes + ")" + " VALUES (" + str(i+1) + ", " + str(house_id[i]) + ", " + str(stud_id[i]) + ");\n")
	f.close()

def insert_degree(table_name, attributes, tuples):
	f = open("insert.sql", "a")
	for i in range(tuples):
		name = "".join(random.choices(string.ascii_uppercase, k = random.randint(2, 4)))
		f.write("INSERT INTO " + table_name + "(" + attributes + ")" + " VALUES (" + str(i+1) + ", '" + name + "');\n")
	f.close()

def insert_photos(table_name, attributes, tuples):
	f = open("insert.sql", "a")
	house_id = random.sample(range(1, 1001), tuples)
	for i in range(tuples):
		name = "".join(random.choices(string.ascii_uppercase, k = random.randint(2, 4)))
		link = "http://www." + "".join(random.choices(string.ascii_lowercase, k = random.randint(8, 12))) + ".com/house-photo"
		f.write("INSERT INTO " + table_name + "(" + attributes + ")" + " VALUES (" + str(i+1) + ", " + str(house_id[i]) + ", '" + link + "');\n")
	f.close()

def insert_sublet(table_name, attributes, tuples):
	f = open("insert.sql", "a")
	sub_from = random.sample(range(1, 3000), tuples)
	sub_to = random.sample(range(1, 3000), tuples)
	for i in range(tuples):
		name = "".join(random.choices(string.ascii_uppercase, k = random.randint(2, 4)))
		from_date = str(random.randint(1, 5)) + "/" + str(random.randint(1, 28)) + "/" + str(random.randint(2020, 2021))
		to_data = str(random.randint(6, 12)) + "/" + str(random.randint(1, 28)) + "/" + str(random.randint(2021, 2022))
		f.write("INSERT INTO " + table_name + "(" + attributes + ")" + " VALUES (" + str(i+1) + ", " + str(sub_from[i]) + ", " + str(sub_to[i])
				+ ", '" + from_date + "', '" + to_data + "');\n")
	f.close()

def insert_house(table_name, attributes, tuples):
	f = open("insert.sql", "a")
	gender_list, major_list, food_pref_list, gender_pref_list = ['Male', 'Female', 'unknown'], ['CSE', 'DS', 'MIS'], ['Veg', 'Non-veg', 'None'], ['Male-only', 'Female-only', 'None'] 
	# owner_id = random.sample(range(1, 200), tuples)
	for i in range(tuples):
		owner_id = random.randint(1, 200)
		max_occ = random.randint(1, 6)
		bed = random.randint(1, 5)
		bath = random.randint(1, 3)
		elec = random.choice([True, False])
		floor = random.randint(1, 3)
		rent = random.randint(1, 40)*100
		pets = random.choice([True, False])
		smoke = random.choice([True, False])
		park = random.choice([True, False])
		wifi = random.choice([True, False])
		heat = random.choice([True, False])
		location_lin = "".join(random.choices(string.ascii_lowercase, k = random.randint(4, 8)))
		location_st = random.randint(1, 200)
		water = random.choice([True, False])
		snow = random.choice([True, False])
		gas = random.choice([True, False])
		trash = random.choice([True, False])
		rating = random.randint(0, 5)
		microwave = random.choice([True, False])
		wash = random.choice([True, False])
		dish = random.choice([True, False])
		oven = random.choice([True, False])
		stove = random.choice([True, False])
		is_occupied = random.choice([True, False])
		f.write("INSERT INTO " + table_name + "(" + attributes + ")" + " VALUES (" + str(i+1) + ", " + str(owner_id) + ", "
				+ str(max_occ) + ", " + str(bed) + ", " + str(bath) + ", " + str(elec) + ", " + str(floor)
				+ ", " + str(rent) + ", " + str(pets) + ", " + str(smoke) + ", " + str(park) + ", " + str(wifi) + ", "
				+ str(heat) + ", '" + str(location_lin) + "', " + str(location_st) + ", " + str(water) + ", " + str(snow) + ", " + str(gas) + ", " + str(trash)
				+ ", " + str(rating) + ", " + str(microwave) + ", " + str(wash) + ", " + str(dish) + ", " + str(oven)
				+ ", " + str(stove) + ", " + str(is_occupied) + ");\n")
	f.close()

def insert_street(table_name, attributes, tuples):
	f = open("insert.sql", "a")
	# street_id = random.sample(range(1, 1000), tuples)
	for i in range(tuples):
		str_name = "".join(random.choices(string.ascii_lowercase, k = random.randint(4, 8))) + " St."
		f.write("INSERT INTO " + table_name + "(" + attributes + ")" + " VALUES (" + str(i+1) + ", '" + str(str_name) + "');\n")
	f.close()

insert_owner("House_Owner", "owner_id, first_name, last_name, phone_no, email, rating, password", 200)
insert_street("Street", "street_id, name", 200)
insert_house("House", "house_id, owner_id, max_occ, bedroom, bathroom, electricity, no_of_floor, rent, pets, smoking, parking, wifi_included, heating, line1, street_id, water, snow, gas, trash, rating, microwave, washing_machine, dishwasher, oven, stove, is_occupied", 1000)
insert_photos("Photo", "id, house_id, link", 1000)
# insert_degree("degree", 100)
# insert_student("Student", 1000)
temp = []
ft = open("majors.txt", "r")
for index, line in enumerate(ft.readlines()):
    if (index) % 2 == 1:
    	temp.append(line[:-1])
insert_student("Student", "student_id, email, first_name, last_name, phone, gender, major_code, food_pref, nationality, gender_pref, degree_id, password", 3000, temp)
insert_occupancy("Student_Occupancy", "occupancy_id, house_id, student_id", 200)
insert_sublet("Sublet", "sublet_id, sublet_from, sublet_to, from_date, to_date", 500)
insert_rating_owner("House_Owner_Rating", "rating_id, student_id, owner_id, rating", 200)
insert_rating_house("House_Rating", "rating_id, student_id, house_id, rating", 500)


