CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (id INT  AUTO_INCREMENT PRIMARY KEY,title VARCHAR(100) NOT NULL,
author VARCHAR(50) NOT NULL,published_year YEAR NOT NULL,genre VARCHAR(30));

INSERT INTO Books(title,author,published_year,genre )VALUES
("Harper Lee" ,"To Kill a Mockingbird", 1960, "Thriller"),   
("Dr. Seuss","Green Eggs and Ham",  1960,"Children's literature"),
("Joseph Heller","Catch-22", 1961," War story"),
("Ken Kesey","One Flew Over the Cuckoo's Nest",1962," Psychological Fiction"),
(" Madeline L' Engle","A Wrinkle in Time",1963,", Fantasy Fiction") ;       
                                                                                                      
SELECT * FROM Books;

CREATE TABLE Members (id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(50) NOT NULL,membership_date DATE NOT NULL);

INSERT INTO Members (name,membership_date) VALUES
('Anitha','2010-05-25'),
('Gomathi','2009-07-12'),
('Divya','2008-06-28'),
('Pavithra','2010-03-07'),
('Diya','2015-03-23');

SELECT * FROM  Members;

CREATE TABLE Borrowing (id INT AUTO_INCREMENT PRIMARY KEY,book_id INT,member_id INT,borrow_date DATE NOT NULL,return_date DATE,
FOREIGN KEY (book_id) REFERENCES Books(id),FOREIGN KEY (member_id) REFERENCES Members(id));

INSERT INTO  Borrowing (book_id,member_id,borrow_date,return_date)VALUES
(1,3,'2023-02-10','2023-02-27'),
(3,2,'2023-05-17','2023-06-10'),
(2,5,'2023-09-22',NULL),
(5,1,'2024-03-23','2023-04-15'),
(4,4,'2024-08-06','2024-08-29');

SELECT * FROM Borrowing;

 -- List all books --
 
 SELECT * FROM Books;
 
-- List all members --

SELECT * FROM  Members;

-- Show borrowing records with member names and book title --

SELECT Borrowing.borrow_date,Borrowing.return_date,members.name, books.title FROM Borrowing  
JOIN members ON Borrowing.id=members.id JOIN books ON Borrowing.member_id = books.id;

-- Count the number of books borrowed by each member --

SELECT  Members.name, COUNT(Borrowing.id) FROM Members LEFT JOIN Borrowing ON Members.id = Borrowing.member_id
GROUP BY Members.id;

