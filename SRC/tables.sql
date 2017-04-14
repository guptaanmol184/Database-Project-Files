create table hostels
(
	hostel_name varchar(30) PRIMARY KEY,
	gender enum('M','F') NOT NULL
);

load data local infile "./load_hostel" into table hostels
fields terminated by ','
lines terminated by '\n';

create table users
(
	username varchar(50) PRIMARY KEY,
	password BLOB NOT NULL, #Encrypted password
	privileges enum
	('STUDENT','CIVIL TECHNICIAN','ELECTRICAL TECHNICIAN','NETWORK TECHNICIAN',
	'ENGINEER','SYSTEM INCHARGE','TEACHER','ADMIN','GUEST')
	NOT NULL DEFAULT 'GUEST'
);

insert into users values
("ced15i002@iiitdm.ac.in",AES_ENCRYPT("iiitdm123","COMPLAINTS"),'STUDENT'),
("ced15i003@iiitdm.ac.in",AES_ENCRYPT("iiitdm123","COMPLAINTS"),'STUDENT'),
("ced15i021@iiitdm.ac.in",AES_ENCRYPT("iiitdm123","COMPLAINTS"),'STUDENT'),
("esd15i004@iiitdm.ac.in",AES_ENCRYPT("iiitdm123","COMPLAINTS"),'STUDENT'),
("sadagopan@iiitdm.ac.in",AES_ENCRYPT("iiitdm123","COMPLAINTS"),'SYSTEM INCHARGE'),
("sivaselvanb@iiitdm.ac.in",AES_ENCRYPT("iiitdm123","COMPLAINTS"),'TEACHER'),
("noor@iiitdm.ac.in",AES_ENCRYPT("iiitdm123","COMPLAINTS"),'SYSTEM INCHARGE'),
("umarani@iiitdm.ac.in",AES_ENCRYPT("iiitdm123","COMPLAINTS"),'TEACHER');

create table wardens
(
	warden_name varchar(50) PRIMARY KEY,
	username varchar(50),
	warden_phone char(15),
	CONSTRAINT wardenuser_fk FOREIGN KEY (username) REFERENCES users(username)
	ON DELETE SET NULL ON UPDATE CASCADE
);

load data local infile "./load_warden" into table wardens
fields terminated by ','
lines terminated by '\n';

create table hostel_wardens
(
	hostel_name varchar(30) NOT NULL,
	warden_name varchar(50) NOT NULL,
	
	CONSTRAINT hostelwarden_fk FOREIGN KEY (hostel_name) REFERENCES hostels(hostel_name)
	ON UPDATE CASCADE ON DELETE CASCADE,

	CONSTRAINT wardenname_fk FOREIGN KEY (warden_name) REFERENCES wardens(warden_name)
	ON UPDATE CASCADE ON DELETE CASCADE
);

load data local infile "./load_hostelwardens" into table hostel_wardens
fields terminated by ','
lines terminated by '\n';

create table students
(
	roll_no char(9) PRIMARY KEY,
	username varchar(50) DEFAULT NULL,
	fname varchar(30) NOT NULL,
	lname varchar(30),
	contact_no char(15),
	room_no int(4),
	hostel_name varchar(30),
	
	CONSTRAINT studentuser_fk FOREIGN KEY (username) REFERENCES users (username)
	ON UPDATE CASCADE ON DELETE SET NULL,

	CONSTRAINT studenthostel_fk FOREIGN KEY (hostel_name) REFERENCES hostels (hostel_name)
	ON UPDATE CASCADE ON DELETE SET NULL
);

load data local infile "./load_students" into table students
fields terminated by ','
lines terminated by '\n';

update students SET contact_no=NULL where contact_no='NULL';

/*VIEW to be created for PUBLIC and PRIVATE COMPLAINTS*/
create table complaints
(
	complaint_id int PRIMARY KEY AUTO_INCREMENT,
	username varchar(50), #NULL if user who created complaint gets deleted
	type enum('CIVIL','ELECTRICAL','NETWORK','GENERAL') NOT NULL DEFAULT 'GENERAL',
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	update_date datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	#when complaint status was last updated by CONCERNED AUTHORITIES (also gives date it was rectified)
	description TEXT,
	status varchar(30), # may need to be changed!!!

	CONSTRAINT complaintuser_fk FOREIGN KEY (username) REFERENCES users (username)
	ON UPDATE CASCADE ON DELETE SET NULL
);

#overlap in public and private complaints NOG ALLOWED through FRONT END insertion

create table public_complaints
(
	complaint_id int PRIMARY KEY,
	location varchar(100) NOT NULL,
	upvotes int NOT NULL DEFAULT 0,

	CONSTRAINT pubcomplaint_fk FOREIGN KEY (complaint_id) REFERENCES complaints (complaint_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

create table private_complaints
(
	complaint_id int PRIMARY KEY,
	roll_no char(9) NOT NULL,
	c_roomno int(4) NOT NULL,
	c_hostel varchar(30) NOT NULL,
	freetime datetime,

	CONSTRAINT pvtcomplaint_fk FOREIGN KEY (complaint_id) REFERENCES complaints (complaint_id)
	ON DELETE CASCADE ON UPDATE CASCADE,

	CONSTRAINT pvtcomrollno_fk FOREIGN KEY (roll_no) REFERENCES students (roll_no)
	ON DELETE CASCADE ON UPDATE CASCADE,

	CONSTRAINT pvtcomhostel_fk FOREIGN KEY (c_hostel) REFERENCES hostels (hostel_name)
	ON DELETE CASCADE ON UPDATE RESTRICT #if ashwatha girls wing changes to jasmine
);

/*View for public and private complaints*/

#LOST AND FOUND