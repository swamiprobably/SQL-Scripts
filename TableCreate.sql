USE LibraryManagementSystem
GO

CREATE TABLE Book
(
BookId INT, 
Title varchar(100), 
PublisherName varchar(100)
)

CREATE TABLE Book_Authors
(BookId INT,
AuthorName varchar(100)
)

CREATE TABLE Book_Copies
(
BookId INT,
BranchID int,
No_Of_Copies int
) 


CREATE TABLE Library_Branch
(
BranchId INT,
BranchName varchar(100),
Address varchar(100)
)

CREATE TABLE Borrower
(
CardNo int,
Name varchar(100),
Address varchar(100),
Phone varchar(20)
)

CREATE TABLE Book_Loans
(
BookId int ,
BranchId int,
CardNo int,
DateOut varchar(20),
DueDate varchar(20)
)

CREATE TABLE Publisher
(
Name varchar(100), 
Address varchar(50),
Phone varchar(25)
)
