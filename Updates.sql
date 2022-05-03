--Updates for house_owner----------------------------------------------------------------
update  house_owner set first_name ='Example' where owner_id = 1
update  house_owner set last_name ='Example' where owner_id = 1
update  house_owner set phone_no ='9898989898' where owner_id = 1
update  house_owner set email = 'example@gmail.com' where owner_id = 1

--Updates for House----------------------------------------------------------------
update house set rent = 123 where house_id = 2;
update house set smoking = false where house_id = 2;
update house set parking =false where house_id = 2;
update house set wifi_included =false where house_id = 2;
update house set heating =false where house_id = 2;
update house set water = false where house_id = 2;
update house set snow = false where house_id = 2;
update house set gas = false where house_id = 2; 
update house set microwave = False where house_id = 2;
update house set washing_machine = False where house_id = 2;
update house set dishwasher = False  where house_id = 2;
update house set oven= False  where house_id = 2;
update house set stove = False  where house_id = 2;
update house set is_occupied = False where house_id =2;
update house set pets = False where house_id =2;
update house set max_occ = 3 where house_id =2;
update house set electricity =False where house_id =2;
update house set street_id =123 where house_id=1;
update house set line1 = '1400' where house_id =1;
update photo set link='https://google.com/photos/abc' where id=2;
--student updates :----------------------------------------------------------------
 update student set email ='example@gmail.com' where student_id = 4;
update student set first_name = 'student1' where student_id = 4;
update student set last_name='lstuden1' where student_id = 4;
update student set phone ='9999999999' where student_id =4;
update student set gender ='m' where student_id = 4;
update student set food_pref ='NA' where student_id = 4;
update student set nationality = 'India' where student_id = 4;
update student set gender_pref = 'm' where student_id = 4;
update student set degree_id = 4 where student_id = 4;
update student set password = 'dasaa' where student_id = 4;
update student set major = (select major_id from major where major_name ='MS')


--Occupancy Updates:----------------------------------------------------------------

create or replace procedure update_occupancy(
   old_student_id int,
   houseid int, 
   new_student_id int
)
language plpgsql    
as $$
begin
    delete from student_occupancy where house_id = houseid and student_id = old_student_id; 
	insert into student_occupancy values(nextval('student_occupancy_id'),houseid,new_student_id);
    commit;
end;$$;

call update_occupancy(1,2,90);

drop procedure delete_occupancy;
create or replace procedure delete_occupancy(
   
   houseid int,
	studentid int

)
language plpgsql    
as $$
declare occup_id student_occupancy.occupancy_id%type;
begin
	select student_occupancy.occupancy_id into occup_id from student_occupancy where house_id = houseid and student_id = studentid;
	if occup_id is not null then
    delete from student_occupancy where house_id = houseid and student_id = studentid; 
	update house set is_occupied  =false where house_id=houseid;
    commit;
	end if;
end;$$;
call delete_occupancy(2,93);


CREATE OR REPLACE FUNCTION update_owner_avg_rating() RETURNS TRIGGER
language plpgsql
AS

$$
BEGIN
	if new.owner_id is not null then
    UPDATE house_owner SET 
	rating = (select avg(r.rating) from house_owner_rating r where r.owner_id = new.owner_id);
	end if;
    RETURN new;
END;
$$;
----------------------------------------------------------------

CREATE or REPLACE TRIGGER update_owner_rating
     AFTER INSERT ON house_owner_rating
     FOR EACH ROW
     EXECUTE PROCEDURE update_owner_avg_rating();
----------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_house_avg_rating() RETURNS TRIGGER
language plpgsql
AS

$$
BEGIN
	if new.house_id is not null then
    UPDATE house SET 
	rating = (select avg(r.rating) from house_rating r where r.house_id = new.house_id);
	end if;
    RETURN new;
END;
$$;
----------------------------------------------------------------
CREATE or REPLACE TRIGGER update_house_rating
     AFTER INSERT ON house_rating
     FOR EACH ROW
     EXECUTE PROCEDURE update_house_avg_rating();
----------------------------------------------------------------

create role house_owners;
grant select,update,delete,insert on house,photo to house_owners;
create user karthik;
grant house_owners to karthik;
----------------------------------------------------------------
create role admins SUPERUSER;
create user kusal;
grant admins to kusal;

----------------------------------------------------------------
create role student;
grant select,update,delete,insert on rating,student_occupancy to student;
create user mihir;
grant student to mihir;


------------------------------------------------------------------
--Index--
create index house_id_index on house(house_id);
