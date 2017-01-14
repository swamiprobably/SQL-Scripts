/*SCRIPT 1. How many copies of the book title The Lost Tribe are owned by the library branch
whose name is "Sharpstown" */

SELECT Book.Title, Library_Branch.BranchName, Book_Copies.No_Of_Copies
FROM Book
JOIN Book_Copies 
ON Book.BookId = Book_Copies.BookId
JOIN Library_Branch
ON Library_Branch.BranchId = Book_Copies.BranchId
WHERE Book.Title = 'The Lost Tribe'
AND Library_Branch.BranchName = 'Sharpstown'

/* SCRIPT 2. How many copies of the book entitled The Lost Tribe are owned by each
library branch? */

SELECT Book.Title, Book_Copies.No_Of_Copies, Library_Branch.BranchName
FROM Book
JOIN Book_Copies 
ON Book.BookId = Book_Copies.BookId
JOIN Library_Branch
ON Library_Branch.BranchId = Book_Copies.BranchId
WHERE Book.Title = 'The Lost Tribe'

/* SCRIPT 3. Retrieve the names of all the borrowers who do not have any books 
checked out. */

SELECT Borrower.Name, Book_Loans.CardNo
FROM Borrower
FULL OUTER JOIN Book_Loans
ON Book_Loans.CardNo = Borrower.CardNo
WHERE Book_Loans.CardNo IS NULL  


/* SCRIPT 4. For each book that is loaned ou tof the "Sharpstown" branch and whose DueDate 
is today, retrieve the book title, the borrower's name, and the borrower's address. */


SELECT Library_Branch.BranchName, Book_Loans.DueDate, Book.Title, Borrower.Name, Borrower.Address
FROM Book 
JOIN Book_Loans
ON Book.BookId = Book_Loans.BookId
JOIN Borrower
ON Borrower.CardNo = Book_Loans.CardNo
JOIN Library_Branch
ON Library_Branch.BranchId = Book_Loans.BranchId
WHERE BranchName = 'Sharpstown'
AND DueDate = '1/12/17'

/* SCRIPT 5. For each library branch, retrieve the branch name and 
the total number of books loaned out from that branch. */
		

SELECT Library_Branch.BranchName, COUNT(Book_Loans.BookId) AS BooksLoaned 
FROM Book_Loans
JOIN Library_Branch
ON Book_Loans.BranchId = Library_Branch.BranchId
GROUP BY BranchName

/* SCRIPT 6. Retrieve the names, addresses, and number of books checked out for
all borrowers who have more than 5 books checked out. */


SELECT Borrower.Name, Borrower.Address, COUNT(Book_Loans.CardNo) AS BooksOut
FROM (Book_Loans
JOIN Borrower
ON Book_Loans.CardNo = Borrower.CardNo)
GROUP BY NAME, ADDRESS 
HAVING COUNT(Book_Loans.CardNo) > 5


/* SCRIPT 7. For each book authored (or co-authored) by "Stephen King",
retrieve the title and the number of copies owned by each library branch 
whose name is "Central". */


SELECT Book_Authors.AuthorName, Book.Title, Book_Copies.No_Of_Copies, 
Library_Branch.BranchName
FROM Book
JOIN Book_Authors
ON Book.BookId = Book_Authors.BookId
JOIN Book_Copies
ON Book_Authors.BookId = Book_Copies.BookId 
JOIN Library_Branch
ON Book_Copies.BranchID = Library_Branch.BranchId 
WHERE Book_Authors.BookId = 1
AND Library_Branch.BranchName = 'Central'


/* Now create a procedure that will execute one or more of those queries, 
based on user choice. */

USE LibraryManagementSystem
GO

CREATE PROC UserChoices @Choose varchar(20)
AS

	SELECT Book_Authors.AuthorName, Book.Title, Book_Copies.No_Of_Copies, 
	Library_Branch.BranchName
	FROM Book
	JOIN Book_Authors
	ON Book.BookId = Book_Authors.BookId
	JOIN Book_Copies
	ON Book_Authors.BookId = Book_Copies.BookId 
	JOIN Library_Branch
	ON Book_Copies.BranchID = Library_Branch.BranchId 
	WHERE Book_Authors.BookId = 1
	AND Library_Branch.BranchName = @Choose



EXEC UserChoices @Choose = 'Sellwood'





