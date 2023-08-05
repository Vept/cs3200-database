CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    employee_role VARCHAR(100),
    phone_number VARCHAR(255)
);

CREATE TABLE Books (
    books_id INT PRIMARY KEY, 
    isbn VARCHAR(20),
    title VARCHAR(255),
    author VARCHAR(255),
    genre VARCHAR(100),
    publication_date DATE,
    price DECIMAL(10, 2),
    quantity smallint
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    phone_number VARCHAR(15),
    customer_name VARCHAR(255),
    preferred_genres VARCHAR(255)
);

CREATE TABLE Cafe (
    drink_id INT PRIMARY KEY,
    drink_name VARCHAR(255),
    drink_price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES Customers (customer_id),
    payment_details VARCHAR(20),
    order_status VARCHAR(50),
    drink_id INT REFERENCES Cafe (drink_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    books_id INT,
    drink_id INT,
    customer_id INT,
    review_content VARCHAR(255),
    rating DECIMAL(2, 1),
    FOREIGN KEY (books_id) REFERENCES Books (books_id),
    FOREIGN KEY (drink_id) REFERENCES Cafe (drink_id),
    FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
);

-- Insert Statements

INSERT INTO Employees (employee_id, employee_name, employee_role, phone_number)
VALUES
	(100031, 'Brittan', 'Barista', '(435)586-8200'),
	(100032, 'Martina', 'Barista', '(435)586-7715'),
	(100033, 'Jake', 'Supervisor', '(435)586-7713'),
	(100034, 'Karson', 'Manager', '(435)586-7712'),
	(100035, 'Brandon', 'CEO', '(435)586-7716'),
	(100036, 'Ethan', 'Barista', '(435)586-7718'),
	(100037, 'Jacob Hamilton', 'Valet', '(435)586-7711'),
	(100038, 'Jorgen', 'Supervisor', '(435)420-6969'),
	(100039, 'Chase', 'Librarian', '(435)586-0209'),
	(100040, 'Sierra', 'Barista', '(435)586-7709');

INSERT INTO Books (books_id, isbn, title, author, genre, publication_date, price, quantity)
VALUES
	(100021, '04530020918124610584', 'Into the Storm', 'Emily White', 'Fiction', '2017-07-01', 20.87, 8),
    (100022, '78362064336082625710', 'Tapped for Evil', 'Colin Jones', 'Crime', '1998-08-01', 24.35, 5),
    (100023, '05469304494837511029', 'The Empty Locket', 'Penelope Rose', 'Mystery', '2003-02-01', 18.99, 3),
    (100024, '36106525817231118256', 'Sea and the Shadow', 'Margaret Henry', 'Fantasy', '2004-06-01', 12.78, 4),
    (100025, '99065431026261870820', 'Becoming', 'Michelle Obama', 'Memoir', '2018-11-01', 20.09, 6),
    (100026, '71249259449895580075', 'Cold Town', 'Truman Capote', 'Crime', '2007-10-01', 18.87, 10),
    (100027, '17310487385280391312', 'Two is Company', 'Meredith Lawrence', 'Romance', '2020-04-01', 24.90, 8),
    (100028, '93196135159027540942', 'Gates of Light', 'Abe Froman', 'Fantasy', '1987-12-01', 23.54, 4),
    (100029, '76762868932864095363', 'The Sunken Piano', 'Laurie Hansen', 'Mystery', '2002-05-01', 14.99, 3),
    (100030, '46692619160095721093', 'Primed for Crime', 'Jake Allen', 'Crime', '1999-01-01', 17.79, 5);

INSERT INTO Customers (customer_id, phone_number, customer_name, preferred_genres)
VALUES
	(100011, '(435)586-9000', 'Chloe Knebel', 'Fantasy'),
	(100012, '(435)586-3748', 'Brooke Joseph', 'Crime'),
	(100013, '(435)586-8989', 'Gracey Speer', 'Romance'),
	(100014, '(435)586-0020', 'Tess Tuell', 'Fiction'),
	(100015, '(435)586-4955', 'Chase Mueller', 'Memoir'),
	(100016, '(435)586-2828', 'Sandra Cong', 'Mystery'),
	(100017, '(435)586-9954', 'Hope Howard', 'Fiction'),
	(100018, '(435)586-9200', 'Chelsea Gotham', 'Crime'),
	(100019, '(435)865-7677', 'Jenny Carlson', 'Memoir'),
	(100020, '(435)865-0233', 'Jessica Adams', 'Crime');

INSERT INTO Cafe (drink_id, drink_name, drink_price)
VALUES
	(100041, 'Black Coffee', 2.00),
	(100042, 'Green Tea', 1.50),
	(100043, 'Iced Chai Latte', 2.50),
	(100044, 'Iced Americano', 1.50),
	(100045, 'Hot Choloate', 1.50),
	(100046, 'Cold Brew', 2.00),
	(100047, 'Cappucino', 2.00),
	(100048, 'Pumpkin Spice Latte', 2.50),
	(100049, 'Espresso', 1.50),
	(100050, 'Red Eye Coffee', 2.50);

INSERT INTO Orders (order_id, customer_id, payment_details, order_status, drink_id)
VALUES
	(100001, 100011, 'Visa Credit', 'Ready', 100041),
	(100002, 100015, 'MasterCard', 'In Process', 100044),
	(100003, 100018, 'Gift Card', 'Ready', 100050),
	(100004, 100012, 'American Express', 'Placed', 100046),
	(100005, 100020, 'Visa Credit', 'Placed', 100049),
	(100006, 100018, 'Gift Card', 'In Process', 100042),
	(100007, 100013, 'Visa Credit', 'Ready', 100047),
	(100008, 100019, 'MasterCard', 'Placed', 100046),
	(100009, 100017, 'American Express', 'Ready', 100042),
	(100010, 100016, 'MasterCard', 'In Process', 100048);

INSERT INTO Reviews (review_id, books_id, drink_id, customer_id, review_content, rating)
VALUES 
    (100051, 100024, NULL, 100012, 'Great book! Five stars!', 5.0),
    (100052, 100029, NULL, 100014, 'I was expecting more plot development, but overall not too disappointed! My favorite character is Jake :)', 3.9),
    (100053, 100026, NULL, 100016, '', 4.0),
    (100054, 100023, NULL, 100019, 'Ended too fast! I couldnt put it down!', 5.0),
    (100055, 100022, NULL, 100020, 'Excellent read', 3.0),
    (100056, NULL, 100043, 100011, 'Every time I get this drink they mess it up...', 1.0),
    (100057, null, 100044, 100017, 'I decided to get a different drink today and I do not regret it! This was delicious!', 5.0),
    (100058, null, 100049, 100015, 'The coffee taste is a bit too strong on this one.', 3.0),
    (100059, null, 100050, 100013, 'I get this drink every day! So good!', 4.0),
    (100060, null, 100042, 100020, 'First time at this book/coffee shop, its a cool place.', 5.0);

	

-- 1. Find customer who ordered Green Tea

SELECT c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Cafe ca ON o.drink_id = ca.drink_id
WHERE ca.drink_name = 'Green Tea';

-- 2. Find customer who ordered a black coffee online

SELECT c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Cafe ca ON o.drink_id = ca.drink_id
WHERE ca.drink_name = 'Black Coffee';

-- 3. Retrieve all books from a particular author.

SELECT b.title
FROM Books b
WHERE b.author = 'Abe Froman';

-- 4. Find the contact information of a particular customer.

SELECT c.phone_number
FROM Customers c
WHERE c.customer_name = 'Tess Tuell';

-- 5. Find the 3 most expensive drinks on the menu

SELECT drink_name
FROM Cafe
ORDER BY drink_price DESC
LIMIT 3;

-- 6. Find the names of all customers who have ordered more than 5 different types of drinks.

SELECT c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(DISTINCT o.drink_id) > 5;

-- 7. Example of subquery: Find customer names who ordered the same drink as the customer with customer_id = 100011
SELECT c2.customer_name
FROM Customers c2
JOIN Orders o2 ON c2.customer_id = o2.customer_id
WHERE o2.drink_id IN (
    SELECT o.drink_id
    FROM Orders o
    WHERE o.customer_id = 100011
);

-- 8. Example of subquery: Find book titles written by the author of 'Becoming'
SELECT b2.title
FROM Books b2
WHERE b2.author IN (
    SELECT b.author
    FROM Books b
    WHERE b.title = 'Becoming'
);

-- 9. Find the names of all customers who have ordered the most popular drink.

SELECT c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.drink_id = (
    SELECT drink_id
    FROM Orders
    GROUP BY drink_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);


-- 10. Find the author who has the highest average book review rating.

SELECT b.author
FROM Books b
JOIN Reviews r ON b.books_id = r.books_id
WHERE b.author IN (
    SELECT author
    FROM Books 
    WHERE books_id IN (
        SELECT books_id
        FROM Reviews
        GROUP BY books_id
        HAVING AVG(rating) = (
            SELECT MAX(subquery.avg_rating)
			FROM (
    			SELECT AVG(rating) AS avg_rating
    			FROM Reviews
    			GROUP BY books_id
			) AS subquery
        )
    )
)
GROUP BY b.author;

UPDATE books
SET price = 19.99
WHERE books_id = 123;


UPDATE customers
SET phone_number = '555-1234'
WHERE customer_id = 456;


ALTER TABLE customers
ADD membership_status VARCHAR(10);


ALTER TABLE books
ALTER COLUMN quantity TYPE INTEGER;

DELETE FROM books
WHERE books_id = 789;
