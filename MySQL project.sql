Create database library;

use library;

create table Branch (
  Branch_no int primary key,
  Manager_Id int,
  Branch_address varchar(25),
  Contact_no varchar(15)
);

create table Employee (
  Emp_Id int primary key,
  Emp_name varchar(25),
  Position varchar(20),
  Salary decimal(10, 2),
  Branch_no int,
  foreign key (Branch_no) references Branch(Branch_no)
);

create table Books (
  ISBN varchar(30) primary key,
  Book_title varchar(50),
  Category varchar(30),
  Rental_Price decimal(5, 2),
  Status enum('yes', 'no'),
  Author varchar(30),
  Publisher varchar(50)
);

create table Customer (
  Customer_Id int primary key,
  Customer_name varchar(25),
  Customer_address varchar(25),
  Reg_date date
);

create table IssueStatus (
  Issue_Id int primary key,
  Issued_cust int,
  foreign key (Issued_cust) references Customer(Customer_Id),
  Issued_book_name varchar(25),
  Issue_date date,
  Isbn_book varchar(25),
  foreign key (Isbn_book) references Books(ISBN)
);

create table ReturnStatus (
  Return_Id int primary key,
  Return_cust int,
  Return_book_name varchar(255),
  Return_date date,
  Isbn_book2 varchar(20),
  foreign key (Isbn_book2) references Books(ISBN)
);

show tables;
insert into Branch
values (1, 101, 'ABC', '1234'),
	   (2, 102, 'DEF', '2345'),
       (3, 103, 'GHI', '3456'),
       (4, 104, 'JKL', '4567'),
       (5, 105, 'MNO', '5678'),
       (6, 106, 'PQR', '6789'),
       (7, 107, 'STU', '7890'),
       (8, 108, 'VWX', '8901');

select * from Branch;
       
insert into Employee 
values (121, 'Akash', 'Manager', 65000, 2),
       (122, 'Bibin', 'Librarian', 40000, 4),
       (123, 'Carol', 'Clerk', 35000, 2),
       (124, 'David', 'Assistant Manager', 50000, 1),
       (125, 'Eric', 'Librarian', 40000, 1),
       (126, 'Francis', 'Manager', 65000, 3),
       (127, 'Wilson', 'Security', 25000, 2),
       (128, 'Manu', 'Assistant Librarian', 30000, 2),
       (129, 'James', 'Assistant Manager', 50000, 2),
       (130, 'Hari', 'Librarian', 40000, 2);
       
select * from Employee;

insert into Books 
values (283, 'War and Peace', 'History' ,10.5, 'yes', 'Leo Tolstoy', 'Fingerprint' ),
       (341, 'The Tempest', 'Romance' ,10.8, 'yes', 'William Shakespeare', 'Oxford University Press' ),
       (143, 'Macbeth', 'Tragedy' ,11.8, 'no', 'William Shakespeare', 'Simon & Schuster' ),
       (256, 'To The Lighthouse', 'Fiction' ,9.5, 'no', 'Virginia Woolf', 'Hogarth Press' ),
       (199, 'Illiad', 'Epic Poetry' ,8.0, 'no', 'Homer', 'Simon & Schuster' ),
       (564, 'The Guns of August', 'History' ,9.5, 'yes', 'Barbara W.Tuchman', 'Macmillan' ),
       (321, 'Orientalism', 'History' ,9.5, 'yes', 'Edward W.Said', 'Pantheon Books' ),
       (431, 'Othello', 'Tragedy' ,10.5, 'yes', 'William Shakespeare', 'Simon & Schuster' ),
       (425, 'Alice in Wonderland', 'Childrens novel' ,8.0, 'no', 'Lewis Carrol', 'Macmillan' ),
       (531, 'To Kill a Mockingbird', 'Fiction' ,10.0, 'yes', 'Harper Lee', 'HarperCollins' );

select * from Books;
       
insert into Customer 
values (1001, 'Emily' ,'SRA 22', '2021-02-10'),
       (1002, 'Haris' ,'REZ 56', '2021-08-16'),
       (1003, 'John' ,'SRA 78', '2022-05-22'),
       (1004, 'Carol' ,'BES 32', '2022-10-05'),
       (1005, 'Jenny' ,'REZ 87', '2023-07-09'),
       (1006, 'Smitha' ,'BES 54', '2023-09-11'),
       (1007, 'Joy' ,'SRA 48', '2023-12-19'),
       (1008, 'Alex' ,'DEN 36', '2024-01-30');
       
select * from Customer;

insert into IssueStatus 
values (1, 1001, 'Macbeth', '2021-12-04', '143'),
       (2, 1002, 'Othello', '2021-02-10', '431'),
       (3, 1002, 'War and Peace', '2022-05-22', '283'),
       (4, 1003, 'Othello', '2023-07-11', '431'),
       (5, 1003, 'Alice in Wonderland', '2023-05-10', '425'),
       (6, 1004, 'To Kill a Mockingbird', '2021-08-16', '531'),
       (7, 1005, 'Macbeth', '2022-10-05', '143'),
       (8, 1005, 'Orientalism', '2023-07-09', '321'),
       (9, 1005, 'War and Peace', '2024-01-30', '283'),
       (10, 1006, 'Othello', '2022-09-20', '431');      

select * from IssueStatus;    
  
insert into ReturnStatus 
values (1, 1003, 'Othello', '2023-08-11', '431'),
       (2, 1003, 'Alice in Wonderland', '2023-06-08', '425'),
       (3, 1005, 'Macbeth', '2022-11-04', '143'),
       (4, 1005, 'Orientalism', '2023-08-06', '321'),
       (5, 1005, 'War and Peace', '2024-03-01', '283'),
       (6, 1001, 'Macbeth', '2022-01-05', '143'),
       (7, 1002, 'Othello', '2021-03-10', '431'),
       (8, 1002, 'War and Peace', '2022-06-21', '283'),
       (9, 1006, 'Othello', '2022-10-22', '431'),
       (10, 1004, 'To Kill a Mockingbird', '2021-09-16', '531');
       
select * from ReturnStatus;

--
select Book_title, Category, Rental_Price from Books where Status = 'yes';

select Emp_name, Salary from Employee order by Salary desc;

select i.issued_book_name, c.customer_name from issuestatus i 
join customer c on i.issued_cust = c.customer_id order by i.issued_book_name;

select Category, count(*) as Total_Books from Books group by Category;

select Emp_name, Position from Employee where Salary > 50000;

select Customer_name from Customer c
where Reg_date < '2022-01-01' and not exists (
  select * from IssueStatus i where i.Issued_cust = c.Customer_Id
);

select Branch_no, count(*) as Total_Employees from Employee group by Branch_no;

select c.customer_name from Customer c
join IssueStatus i on c.Customer_Id = i.Issued_cust
where issue_date between '2023-07-01' and '2023-07-31';

select Book_title from Books where Category='History';

select Branch_no, count(*) as employeecount from Employee group by Branch_no having employeecount>5;
