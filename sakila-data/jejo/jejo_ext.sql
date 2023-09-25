#### Create database 
create database if not exists jejo_ext;
use jejo_ext;

create table if not exists members(
    membership_number int auto_increment not null,
    name varchar(255) not null,
    email varchar (255) not null,
    phone char(10) not null,
    address varchar(255) ,
    salary int(6) unsigned not null,
    registered_date datetime not null default current_timestamp,
    membership_status varchar(100) not null default "active",
    
    primary key (membership_number),

    CONSTRAINT email_format CHECK (email REGEXP '^[a-zA-Z0-9._%+-]+@(yahoo|gmail|hotmail)\\.com$')
);

create table if not exists cases (
      case_number int auto_increment not null,
      membership_number int not null,
      type varchar(20) not null default "common",
      start_date datetime not null default current_timestamp,
      end_date datetime not null,
      description text default null,
      status varchar(20) default "active",
      primary key (case_number),
      constraint cases_fk
          foreign key (membership_number)
            references members(membership_number))
;
CREATE TABLE IF NOT EXISTS payments (
    payment_id INT AUTO_INCREMENT NOT NULL,
    membership_number INT,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    membership_valid_until DATETIME ,
    PRIMARY KEY (payment_id),
    CONSTRAINT payments_fk FOREIGN KEY (membership_number) REFERENCES members(membership_number)
);

create table if not exists employers (
     employer_id int auto_increment not null,
     employer_name varchar(50) not null,
     email varchar(50) not null,
     location varchar(50) not null,
     primary key (employer_id)
     );
     
create table if not exists contracts (
	 contract_id int auto_increment not null,
     employer_id int not null,
     membership_number int not null,
     start_date datetime not null default current_timestamp,
     end_date datetime not null,
     is_active varchar(5) default "Yes",
     constraint contracts_pk primary key (contract_id),
     constraint contracts_member_fk
     	foreign key (membership_number)
           references members(membership_number),
	 constraint contracts_employer_fk
		foreign key (employer_id)
		   references employers(employer_id),
	 constraint check_date_range CHECK 
          (DATEDIFF(end_date, start_date) BETWEEN 365 AND 730)
     
     
);

INSERT INTO members (name, email, phone, address, salary, registered_date, membership_status)
VALUES 
  ('Alice', 'alice@gmail.com', '123456789', '123 Park Ave', 60000, '2023-09-19 15:30:00', default),
  ('Charlie', 'charlie@gmail.com', '555555555', '789 Maple Ln', 80000, '2023-09-19 15:32:00',  default),
  ('David', 'david@hotmail.com', '333333333', '101 Elm Rd', 70000, '2023-09-19 15:33:00',  default),
  ('Parker', 'parker@hotmail.com', '777799990', '1413 Cedar Ave', 90000, '2023-09-19 15:45:00',  default),
  ('Victor', 'victor@hotmail.com', '555522223', '2019 Redwood St', 70000, '2023-09-19 15:51:00', default),
  ('Ivy', 'ivy@yahoo.com', '222222222', '606 Fir Ln', 40000, '2023-09-19 15:38:00',  default),
  ('Mia', 'mia@yahoo.com', '333344445', '010 Willow Ct', 80000, '2023-09-19 15:42:00',  default),
  ('Nathan', 'nathan@yahoo.com', '888877776', '1211 Aspen Ln', 90000, '2023-09-19 15:43:00',  default);
INSERT INTO cases (membership_number, type, start_date, end_date, description, status)
VALUES
  (5, 'delay', '2023-09-20 09:15:00', '2023-09-21 08:30:00', 'This is an urgent case with a short duration.', default),
  (3, 'delay', '2023-09-20 10:30:00', '2023-09-20 13:00:00', 'Urgent case with a description.',  default),
  (2, 'common', '2023-09-20 11:45:00', '2023-09-25 14:45:00', 'Common case with a description.',  default),
  (6, 'urgent', '2023-09-21 13:00:00', '2023-09-22 17:15:00', 'Another urgent case.',  default),
  (8, 'urgent', '2023-09-22 14:15:00', '2023-09-22 20:30:00', 'Urgent case with a description.',  default),
  (4, 'common', '2023-09-23 15:30:00', '2023-09-29 19:45:00', 'Common case with a detailed description.',  default),
  (7, 'urgent', '2023-09-24 16:45:00', '2023-09-24 22:00:00', 'Another urgent case.',  default),
  (1, 'common', '2023-09-25 18:00:00', '2023-10-01 22:15:00', 'Common case with a description.',  default),
  (3, 'common', '2023-09-26 19:15:00', '2023-10-02 23:30:00', 'Common case with a description.',  default),
  (2, 'urgent', '2023-09-27 20:30:00', '2023-09-27 22:45:00', 'Urgent case with a short duration.',  default),
  (6, 'urgent', '2023-09-28 21:45:00', '2023-09-29 00:00:00', 'Urgent case.', 'active'),
  (8, 'common', '2023-09-29 23:00:00', '2023-10-05 03:15:00', 'Common case with a detailed description.',  default),
  (4, 'urgent', '2023-09-30 00:15:00', '2023-09-30 01:30:00', 'Another urgent case.', 'active'),
  (5, 'common', '2023-10-01 01:30:00', '2023-10-07 05:45:00', 'Common case with a description.',  default),
  (7, 'common', '2023-10-02 02:45:00', '2023-10-02 04:00:00', 'Common case with a description.',  default),
  (1, 'urgent', '2023-10-03 04:00:00', '2023-10-03 05:15:00', 'Urgent case.',  default),
  (3, 'urgent', '2023-10-04 05:15:00', '2023-10-04 06:30:00', 'Urgent case.',  default),
  (2, 'urgent', '2023-10-05 06:30:00', '2023-10-05 07:45:00', 'Urgent case with a short duration.',  default),
  (6, 'common', '2023-10-06 07:45:00', '2023-10-12 12:00:00', 'Common case.',  default),
  (8, 'common', '2023-10-07 09:00:00', '2023-10-13 13:15:00', 'Common case.',  default);
INSERT INTO payments (membership_number, payment_date, membership_valid_until)
VALUES
    (1, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (1, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (2, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (3, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (3, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (4, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (4, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (4, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (5, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (5, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (5, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (6, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (6, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (6, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (7, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (7, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (7, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (8, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (8, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR)),
    (8, DEFAULT, DATE_ADD(payment_date, INTERVAL 1 YEAR));
    
INSERT INTO employers (employer_name, email, location)
VALUES
    ('ABC Company', 'abc@example.com', 'New York'),
    ('XYZ Corporation', 'xyz@example.com', 'Tokyo'),
    ('123 Industries', '123@example.com', 'London'),
    ('Smith Enterprises', 'smith@example.com', 'Sydney');
INSERT INTO contracts (employer_id, membership_number, start_date, end_date, is_active)
VALUES
    (1, 1, '2022-01-01 08:00:00', '2023-01-01 17:00:00', default),
    (2, 2, '2022-02-01 10:00:00', '2023-02-01 15:30:00', default),
    (3, 3, '2022-03-01 12:00:00', '2023-03-01 18:00:00', default),
    (4, 4, '2022-04-01 14:00:00', '2023-04-01 16:00:00', default),
    (1, 5, '2022-05-01 16:00:00', '2023-05-01 13:00:00', default),
    (2, 6, '2022-06-01 09:00:00', '2023-06-01 14:30:00', default),
    (3, 7, '2022-07-01 11:00:00', '2023-07-01 12:45:00', default),
    (4, 8, '2022-08-01 13:00:00', '2023-08-01 11:00:00', default),
    (1, 1, '2022-09-01 15:00:00', '2023-09-01 10:15:00', default),
    (2, 2, '2022-10-01 17:00:00', '2023-10-01 09:30:00', default),
    (3, 3, '2022-11-01 08:30:00', '2023-11-01 14:00:00', default),
    (4, 4, '2022-12-01 10:30:00', '2023-12-01 16:20:00', default),
    (1, 5, '2023-01-01 12:45:00', '2024-01-01 11:45:00', default),
    (2, 6, '2023-02-01 14:15:00', '2024-02-01 13:30:00', default),
    (3, 7, '2023-03-01 16:30:00', '2024-03-01 15:15:00', default),
    (4, 8, '2023-04-01 09:45:00', '2024-04-01 17:00:00', default),
    (1, 1, '2023-05-01 11:50:00', '2024-05-01 09:45:00', default),
    (2, 2, '2023-06-01 13:55:00', '2024-06-01 14:30:00', default),
    (3, 3, '2023-07-01 16:10:00', '2024-07-01 12:00:00', default),
    (4, 4, '2023-08-01 09:30:00', '2024-08-01 16:45:00', default);
####Q4.a
alter table members
add column salary_ranking varchar(6) after salary;
UPDATE members
SET salary_ranking = 
    CASE 
        WHEN salary <= 40000 THEN 'low'
        WHEN salary > 40000 AND salary <= 60000 THEN 'medium'
        ELSE 'high'
    END;
    
alter table cases
add column `duration(hours)` double after end_date;
update cases
set `duration(hours)` = timestampdiff(minute, start_date , end_date) / 60;
######################
####Q4.b
alter table employers
change column location city varchar(20);
######Q4.c
describe cases;
alter table cases 
modify end_date datetime null;
describe cases;


####Q4.d

alter table members
add constraint unique_email unique (email);

############
use jejo_ext;
alter table cases
add constraint check_type check(type in ("common","delay", "urgent"));
INSERT INTO cases (membership_number, type, start_date, end_date, description, status)
VALUES
    (8, "unknown", '2023-09-20 08:00:00', '2023-09-26 17:00:00', 'This is a common case with longer duration.', default);
#####
