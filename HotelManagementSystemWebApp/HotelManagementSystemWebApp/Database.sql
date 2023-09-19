CREATE DATABASE HotelManagementSystem

-------------------------------------------------------------------------

USE HotelManagementSystem

-------------------------------------------------------------------------

CREATE TABLE departments(
d_id int identity(1,1) primary key,
d_name varchar(20) UNIQUE
)

-------------------------------------------------------------------------

CREATE TABLE designations(
des_id int identity(1,1) primary key,
des_name varchar(20) UNIQUE
)

-------------------------------------------------------------------------

CREATE TABLE employees(
e_id bigint identity(1,1) primary key, 
name varchar(30),
employee_address varchar(100),
dob date,
gender varchar(10),
email varchar(50),
phone varchar(15) UNIQUE,
document varchar(20),
docId varchar(50) UNIQUE,
joining_date date,
salary int,
designation varchar(20) REFERENCES designations(des_name) ON UPDATE CASCADE ON DELETE SET NULL,
department varchar(20) REFERENCES departments(d_name) ON UPDATE CASCADE ON DELETE SET NULL,
manager_id bigint REFERENCES employees(e_id),
is_terminated varchar(3),
termination_date date,
image_link nvarchar(max),
CONSTRAINT termination CHECK (is_terminated IN ('YES', 'NO')),
)

---------------------------------------------------------------------------

CREATE PROCEDURE new_employee
@name varchar(30),
@address varchar(100),
@dob date,
@gender varchar(10),
@email varchar(50),
@phone varchar(15),
@document varchar(20),
@docId varchar(50),
@joining_date date,
@salary int,
@designation varchar(20),
@department varchar(20),
@manager_id bigint,
@image_link nvarchar(max)

AS
BEGIN
	INSERT INTO employees (name, employee_address, dob, gender, email, phone, document, docId, joining_date, salary, designation, department, manager_id, is_terminated, termination_date, image_link) VALUES (@name, @address, @dob, @gender, @email, @phone, @document, @docId, @joining_date, @salary, @designation, @department, @manager_id, 'NO', null, @image_link)
END

---------------------------------------------------------------------------

CREATE PROCEDURE edit_employee   
@e_id bigint, 
@name varchar(30),
@address varchar(100),
@dob date = null,
@gender varchar(10),
@email varchar(50),
@phone varchar(15),
@document varchar(20),
@docId varchar(50),
@joining_date date = null,
@salary int,
@new_designation varchar(20),
@old_designation varchar(20),
@department varchar(20),
@manager_id bigint,
@image_link nvarchar(max)

AS
BEGIN

	IF @old_designation != @new_designation
		BEGIN
			UPDATE employees SET manager_id = null WHERE manager_id = @e_id;
		END

	UPDATE employees SET name=@name, employee_address=@address, dob=@dob, gender=@gender, email=@email, phone=@phone, document=@document, docId=@docId, joining_date=@joining_date, salary=@salary, designation=@new_designation, department=@department, manager_id=@manager_id, image_link=@image_link WHERE e_id=@e_id;

	UPDATE users SET email=@email, image_link=@image_link WHERE e_id=@e_id;

END

---------------------------------------------------------------------------

CREATE TABLE users(
	u_id bigint identity(1,1) PRIMARY KEY, 
	e_id bigint REFERENCES employees(e_id) ON DELETE CASCADE, 
    email nvarchar(50) UNIQUE,
    pass nvarchar(10) NOT NULL,
	u_status nvarchar(1) NOT NULL,
	image_link nvarchar(max),
	CONSTRAINT u_status CHECK (u_status IN ('A', 'U')),
)

INSERT INTO users VALUES (NULL, 'admin@email.com', 'password', 'A', '\Images\Profile.png')

---------------------------------------------------------------------------

CREATE PROC new_user
@e_id bigint = NULL,
@pass nvarchar(15)

AS
BEGIN
	INSERT INTO users (e_id, email, pass, u_status, image_link) 
	SELECT e_id, email, @pass, 'U', image_link FROM employees WHERE e_id = @e_id;
END

---------------------------------------------------------------------------

CREATE PROCEDURE edit_user
@u_id bigint,
@pass nvarchar(10),
@u_status nvarchar(1)

AS
BEGIN
	UPDATE users SET pass=@pass, u_status=@u_status WHERE u_id=@u_id;
END

---------------------------------------------------------------------------

CREATE PROC validate_users
@email nvarchar(50),
@user_password nvarchar(10)
AS
BEGIN
	select * from users where email = @email AND pass = @user_password
END

---------------------------------------------------------------------------

CREATE PROC change_password
@email nvarchar(50),
@old_pass nvarchar(10),
@new_pass nvarchar(10)

AS
BEGIN
	UPDATE users SET pass = @new_pass WHERE email= @email AND pass = @old_pass;
END

---------------------------------------------------------------------------

CREATE PROC forgot_password
@email nvarchar(50),
@pass nvarchar(10)

AS
BEGIN
	UPDATE users SET pass = @pass WHERE email= @email;
END

---------------------------------------------------------------------------

CREATE PROC delete_account
@email nvarchar(50),
@pass nvarchar(10)

AS
BEGIN
	DELETE FROM users WHERE email = @email AND pass = @pass;
END

---------------------------------------------------------------------------

CREATE TABLE bed_types (
bed_id int identity(1,1) primary key,
bed_type varchar(20) UNIQUE
)

---------------------------------------------------------------------------

CREATE TABLE room_types (
room_type_id int identity(1,1) primary key,
room_type varchar(20) UNIQUE
)

---------------------------------------------------------------------------

CREATE TABLE rooms(
r_num nvarchar(10) primary key,
cleaning_status nvarchar(15), 
price int, 
room_type varchar(20) references room_types(room_type) ON UPDATE CASCADE ON DELETE CASCADE, 
bed_type varchar(20) references bed_types(bed_type) ON UPDATE CASCADE ON DELETE CASCADE,
no_of_beds int,
max_occupants int,
image_link nvarchar(max),
)

---------------------------------------------------------------------------

CREATE PROCEDURE new_room
@r_num nvarchar(10),
@cleaning_status nvarchar(15), 
@price int, 
@room varchar(20), 
@bed varchar(20),
@no_of_beds int,
@max_occ int,
@image_link nvarchar(max)

AS
BEGIN
	INSERT INTO rooms VALUES (@r_num, @cleaning_status, @price, @room, @bed, @no_of_beds, @max_occ, @image_link)
END

---------------------------------------------------------------------------

CREATE PROC update_rooms
@r_num nvarchar(10),
@cleaning nvarchar(10),
@price int, 
@room_type varchar(20),
@bed_type varchar(20),
@no_of_beds int,
@max_occ int,
@image_link nvarchar(max)
AS
BEGIN
	UPDATE rooms SET cleaning_status = @cleaning, price=@price, room_type = @room_type, bed_type = @bed_type, no_of_beds = @no_of_beds, max_occupants = @max_occ, image_link = @image_link WHERE r_num = @r_num
END

---------------------------------------------------------------------------

CREATE TABLE inventory(
product_id int identity(1,1) primary key, 
product_name nvarchar(40) unique NOT NULL,
product_category nvarchar(40) NOT NULL,
product_quantity int
)

---------------------------------------------------------------------------

CREATE PROC add_inventory
@pname nvarchar(40),
@pcategory nvarchar(40),
@quantity int
AS
BEGIN
	INSERT INTO inventory values(@pname,@pcategory,@quantity)
END

---------------------------------------------------------------------------

CREATE PROC edit_inventory
@p_id int,
@pname nvarchar(40),
@pcategory nvarchar(40),
@quantity int
AS
BEGIN
	UPDATE inventory SET product_name = @pname, product_category = @pcategory, product_quantity = @quantity WHERE product_id = @p_id
END

---------------------------------------------------------------------------

CREATE TABLE guest_info(
g_id bigint identity(1,1) primary key, 
guest_name nvarchar(30),
guest_address nvarchar(100),
dob date,
gender nvarchar(8),
email nvarchar(50) unique,
phone nvarchar(15),
id_proof nvarchar(20),
id_num nvarchar(50)
)

---------------------------------------------------------------------------

CREATE TABLE bookings(
b_id bigint identity(1,1) primary key,
g_id bigint references guest_info(g_id),
check_in date,
check_out date,
r_num nvarchar(10),
room_price int,
total_price int,
deposit int,
no_of_adults int,
no_of_children int,
has_checked_in nvarchar(3),
checked_in_at datetime,
has_checked_out nvarchar(3),
checked_out_at datetime,
CONSTRAINT chk_checked_in CHECK (has_checked_in IN ('YES', 'NO')),
CONSTRAINT chk_checked_out CHECK (has_checked_out IN ('YES', 'NO'))
)

---------------------------------------------------------------------------

CREATE PROC new_booking
@type varchar(3) = 'new',
@name nvarchar(30),
@address nvarchar(100),
@dob date,
@gender nvarchar(10),
@email nvarchar(50),
@phone nvarchar(15),
@id_proof nvarchar(20),
@id_num nvarchar(50),
@check_in date,
@check_out date,
@r_num nvarchar(10),
@deposit int,
@room_price int,
@total_price int,
@adults int,
@children int

AS
BEGIN
	
	IF @type = 'new'
	
		BEGIN
			INSERT INTO guest_info VALUES (@name, @address, @dob, @gender, @email, @phone, @id_proof, @id_num);
		END	
		
	INSERT INTO bookings (g_id, check_in, check_out, r_num, room_price, total_price, deposit, no_of_adults, no_of_children, has_checked_in, has_checked_out) SELECT g_id, @check_in, @check_out, @r_num, @room_price, @total_price, @deposit, @adults, @children, 'NO', 'NO' FROM guest_info WHERE email = @email AND phone = @phone;		

END

---------------------------------------------------------------------------

CREATE PROC getAvailableRooms
@in_date date,
@out_date date,
@max_occ int

AS
BEGIN

select r_num, price, room_type, bed_type, image_link from rooms where max_occupants >= @max_occ AND r_num in (
select r_num from rooms except (
select distinct r_num from bookings where
(
(@in_date >= check_in and @in_date < check_out) 
or
(@out_date > check_in and @out_date <= check_out)
or
(@in_date < check_in and @out_date > check_out)
or
(@in_date > check_in and @out_date < check_out)
)
)
)
END

---------------------------------------------------------------------------

CREATE TABLE cancelled_bookings(
b_id bigint primary key,
g_id bigint references guest_info(g_id),
check_in date,
check_out date,
r_num nvarchar(10),
room_price int,
total_price int,
deposit int,
no_of_adults int,
no_of_children int
)

---------------------------------------------------------------------------

CREATE PROC cancel_bookings
@b_id bigint

AS
BEGIN

	INSERT INTO cancelled_bookings SELECT [b_id],[g_id],[check_in],[check_out],[r_num],[room_price],[total_price],[deposit],[no_of_adults],[no_of_children] FROM bookings WHERE b_id = @b_id
	DELETE FROM bookings WHERE b_id = @b_id

END


---------------------------------------------------------------------------

CREATE PROCEDURE edit_guest_info
@g_id bigint,
@name nvarchar(30),
@address nvarchar(100),
@dob date = null,
@gender nvarchar(10),
@email nvarchar(50),
@phone nvarchar(15),
@id_proof nvarchar(20),
@id_num nvarchar(50)

AS
BEGIN	
	UPDATE guest_info SET guest_name = @name, guest_address = @address, dob = @dob, gender = @gender, email = @email, phone = @phone, id_proof = @id_proof, id_num = @id_num WHERE g_id = @g_id;	
END

---------------------------------------------------------------------------

CREATE PROC edit_bookings
@b_id bigint,
@room_price int,
@total_price int,
@deposit int,
@has_checked_in nvarchar(3),
@check_in_time datetime = null,
@has_checked_out nvarchar(3),
@check_out_time datetime = null

AS
BEGIN
	UPDATE bookings SET room_price = @room_price, total_price = @total_price, deposit = @deposit, has_checked_in = @has_checked_in, has_checked_out = @has_checked_out, checked_in_at = @check_in_time, checked_out_at = @check_out_time WHERE b_id = @b_id;
END

---------------------------------------------------------------------------

CREATE PROCEDURE terminate_employee
@e_id bigint,
@termination_date date

AS
BEGIN
	UPDATE employees SET is_terminated = 'YES', termination_date = @termination_date, manager_id = null WHERE e_id = @e_id;
	
	DELETE FROM users WHERE e_id = @e_id;
	
	UPDATE employees SET manager_id = null WHERE manager_id = @e_id;
END

---------------------------------------------------------------------------

CREATE TABLE website_users(
	g_id bigint REFERENCES guest_info(g_id) ON DELETE CASCADE NOT NULL, 
    email nvarchar(50)REFERENCES guest_info(email) ON UPDATE CASCADE NOT NULL,
    pass nvarchar(10) NOT NULL	
)

---------------------------------------------------------------------------

CREATE PROCEDURE new_guest_registration
@guest_name nvarchar(30),
@guest_address nvarchar(100),
@dob date,
@gender nvarchar(8),
@email nvarchar(50),
@phone nvarchar(15),
@id_proof nvarchar(20),
@id_num nvarchar(50),
@pass nvarchar(10)

AS
BEGIN
	IF (SELECT COUNT(*) FROM guest_info WHERE email = @email)=0
		BEGIN
			INSERT INTO guest_info VALUES (@guest_name, @guest_address, @dob, @gender, @email, @phone, @id_proof, @id_num);
        	INSERT INTO website_users SELECT g_id, @email, @pass FROM guest_info WHERE email = @email;
		END
	 
	 IF (SELECT COUNT(*) FROM website_users WHERE email = @email)=0 AND (SELECT COUNT(*) FROM guest_info WHERE email = @email)>0
		BEGIN
			INSERT INTO website_users SELECT g_id, @email, @pass FROM guest_info WHERE email = @email;
		END
END

---------------------------------------------------------------------------

CREATE PROC validate_website_users
@email nvarchar(50),
@user_password nvarchar(10)
AS
BEGIN
	select * from website_users where email = @email AND pass = @user_password
END

---------------------------------------------------------------------------

CREATE PROC booking_from_website
@g_id bigint,
@check_in date,
@check_out date,
@r_num nvarchar(10),
@room_price int,
@total_price int,
@no_of_adults int,
@no_of_children int

AS
BEGIN
	INSERT INTO bookings (g_id, check_in, check_out, r_num, room_price, total_price, no_of_adults, no_of_children, deposit) VALUES (@g_id, @check_in, @check_out, @r_num, @room_price, @total_price, @no_of_adults, @no_of_children, 0);
END

---------------------------------------------------------------------------

CREATE PROC edit_website_guest_info
@g_id bigint, 
@guest_name nvarchar(30),
@guest_address nvarchar(100),
@dob date,
@gender nvarchar(8),
@email nvarchar(50),
@phone nvarchar(15),
@id_proof nvarchar(20),
@id_num nvarchar(50)	

AS
BEGIN
	UPDATE guest_info SET guest_name = @guest_name, guest_address =@guest_address, dob = @dob, gender = @gender, email = @email, phone = @phone, id_proof = @id_proof, id_num = @id_num WHERE g_id = @g_id;	
END
	
---------------------------------------------------------------------------

CREATE TABLE user_messages
(
	first_name nvarchar(50),
	last_name nvarchar(50),
	email nvarchar(50),
	phone nvarchar(50),
	txt_message nvarchar(max)
)

---------------------------------------------------------------------------

CREATE PROCEDURE sent_message
@first_name nvarchar(50),
@last_name nvarchar(50),
@email nvarchar(50),
@phone nvarchar(50),
@txt_message nvarchar(max)

AS
BEGIN
	INSERT INTO user_messages VALUES (@first_name, @last_name, @email, @phone, @txt_message);
END

---------------------------------------------------------------------------

CREATE PROC change_website_user_password
@email nvarchar(50),
@old_pass nvarchar(10),
@new_pass nvarchar(10)

AS
BEGIN
	UPDATE website_users SET pass = @new_pass WHERE email= @email AND pass = @old_pass;
END

---------------------------------------------------------------------------

CREATE PROC forgot_password_website
@email nvarchar(50),
@pass nvarchar(10)

AS
BEGIN
	UPDATE website_users SET pass = @pass WHERE email= @email;
END

---------------------------------------------------------------------------
