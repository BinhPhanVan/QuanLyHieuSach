create table Account
(
 Usename char(8) primary key,
 Pass char(8)
 )
 create table Staff
 (
 Staff_ID char(8) primary key,
 Staff_Name varchar(25),
 Staff_Gender bit,
 Staff_CMND char(9),
 Staff_PhoneNumber char(10),
 Staff_Address varchar(30),
 Staff_DayofBirth date,
 Staff_State bit
 )
  create table Admin
 (
 Admin_ID char(8) primary key,
 Admin_Name varchar(25),
 Admin_Gender bit,
 Admin_CMND char(9),
 Admin_PhoneNumber char(10),
 Admin_Address varchar(30),
 Admin_DayofBirth date
 )