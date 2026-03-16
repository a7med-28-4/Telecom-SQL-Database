create database telecom;
use telecom;


# Create_Tables
create table customer(
customer_id int primary key,
customer_name varchar(100),
gender enum('Male','female'),
age int,
city varchar(50),
join_date datetime);

create table plans(
plan_id int primary key,
plan_name varchar(50),
monthly_fee decimal(7,2),
internet_GB int,
call_minutes int);

create table customer_subscriptions(
subscription_id int primary key,
customer_id int,
plan_id int,
start_date datetime,
foreign key(customer_id) references customer(customer_id),
foreign key(plan_id) references plans(plan_id));

create table call_records(
call_id int primary key,
customer_id int,
call_duration time,
call_date datetime,
foreign key(customer_id) references customer(customer_id));

create table churn_status(
customer_id int primary key,
churn_status bool,
churn_date date,
foreign key(customer_id) references customer(customer_id));


# Modify_Columns
alter table customer
modify column gender enum('Male','Female');

alter table customer
modify column join_date date;

alter table customer_subscriptions
modify column start_date date;

# Insert_Data
insert into customer
values
(1,'Ahmed Hashem','Male',28,'Cairo','2023-01-10'),
(2,'Sara Mohamed','Female',32,'Alexandria','2022-11-10'),
(3,'Omar Hassan','Male',40,'Giza','2021-07-20'),
(4,'Mana Adel','Female',25,'Cairo','2023-03-15'),
(5,'Khaled Nabil','Male',35,'Aswan','2022-05-12');

insert into plans
values
(1,'Basic',50,10,100),
(2,'Standard',100,50,300),
(3,'Premium',200,100,1000);

insert into customer_subscriptions
values
(1,1,2,'2023-01-15'),
(2,2,3,'2022-11-10'),
(3,3,1,'2021-07-25'),
(4,4,2,'2023-03-20'),
(5,5,1,'2022-05-15');

insert into call_records
values
(1,1,'00:05:30','2023-02-01 10:00'),
(2,1,'00:10:15','2023-02-03 15:30'),
(3,2,'00:20:00','2022-12-01 12:45'),
(4,3,'00:03:50','2021-08-01 09:15'),
(5,4,'00:12:30','2023-04-01 18:00'),
(6,5,'00:08:45','2022-06-01 14:20');

insert into churn_status
values
(1,false,null),
(2,true,'2023-01-15'),
(3,true,'2022-08-01'),
(4,false,null),
(5,true,'2022-12-10');


# Show_Tables
select * from customer;
select * from plans;
select * from customer_subscriptions;
select * from call_records;
select * from churn_status;
