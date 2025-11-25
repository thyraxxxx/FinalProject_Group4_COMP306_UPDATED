CREATE DATABASE IF NOT EXISTS restaurant_api;
USE restaurant_api;

-- ==========================
-- Restaurants table
-- ==========================
CREATE TABLE restaurants (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    Phone VARCHAR(20),
    OpeningHours VARCHAR(100)
);

INSERT INTO restaurants (Name, City, Address, Phone, OpeningHours)
VALUES
('City Bistro',       'Scarborough', '100 Progress Ave, Scarborough', '4160001111', '10:00 - 22:00'),
('Taste of Punjab',   'Toronto',     '55 Markham Rd, Toronto',        '4161234567', '11:00 - 23:00'),
('Green Leaf Cafe',   'Toronto',     '90 Kingston Rd, Toronto',       '6479876543', '08:00 - 20:00'),
('Sunrise Diner',     'Toronto',     '210 Ellesmere Rd, Toronto',     '4165551212', '07:00 - 15:00'),
('The Spice Villa',   'Toronto',     '15 Danforth Ave, Toronto',      '6472221111', '12:00 - 23:00'),
('Scarborough Shawarma','Scarborough', '3200 Eglinton Ave E, Scarborough','4165550202', '10:00 - 01:00'),
('Danforth Gyro House', 'Toronto',     '415 Danforth Ave, Toronto',       '6475550303', '11:00 - 23:00'),
('Yonge Street Sushi',  'Toronto',     '720 Yonge St, Toronto',           '4165550404', '12:00 - 22:00'),
('Parkdale Pizza Co.',  'Toronto',     '1320 Queen St W, Toronto',        '6475550505', '11:00 - 00:00'),
('Liberty Village Grill', 'Toronto', '85 Lynn Williams St, Toronto', '4165550606', '09:00 - 22:00');


-- ==========================
-- MenuItems table
-- ==========================
CREATE TABLE menu_items (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    RestaurantId INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price DECIMAL(10,2) NOT NULL,
    Category VARCHAR(50),
    IsAvailable BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (RestaurantId) REFERENCES restaurants(Id)
);

INSERT INTO menu_items (RestaurantId, Name, Description, Price, Category, IsAvailable)
VALUES
(1, 'Pasta Alfredo', 'Creamy alfredo sauce with herbs', 15.99, 'Main',      TRUE),
(1, 'Garlic Bread',  'Buttered garlic breadsticks',      6.99, 'Appetizer', TRUE),
(2, 'Paneer Tikka',  'Grilled paneer with spices',      12.50, 'Appetizer', TRUE),
(3, 'Veggie Burger', 'Plant-based patty with fries',    11.99, 'Main',      TRUE),
(4, 'Cheesecake',    'New York style cheesecake',        7.50, 'Dessert',   TRUE),
(5, 'Butter Chicken',      'Rich tomato cream sauce with spices',  17.99, 'Main',      TRUE),
(2, 'Garlic Naan',         'Soft tandoor-baked garlic naan',        4.50, 'Side',      TRUE),
(3, 'Caesar Salad',        'Crisp romaine with house dressing',     9.25, 'Starter',   TRUE),
(4, 'Classic Pancake Stack','Fluffy pancakes with maple syrup',     8.99, 'Breakfast', TRUE),
(1, 'Tiramisu',            'Espresso-soaked ladyfingers dessert',   7.99, 'Dessert',   TRUE);

-- ==========================
-- Reservations table
-- ==========================
CREATE TABLE reservations (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    RestaurantId INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerEmail VARCHAR(100),
    ReservationDateTime DATETIME NOT NULL,
    PartySize INT NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Booked',
    CONSTRAINT fk_Reservations_Restaurant
        FOREIGN KEY (RestaurantId) REFERENCES restaurants(Id)
        ON DELETE CASCADE
);

INSERT INTO reservations
(RestaurantId, CustomerName, CustomerEmail, ReservationDateTime, PartySize, Status)
VALUES
(1, 'Aarav Patel',    'aarav@example.com',   '2025-02-10 18:00:00', 2, 'Booked'),
(1, 'Emily Johnson',  'emily@example.com',   '2025-02-11 19:30:00', 4, 'Booked'),
(2, 'Mohammed Khan',  'mkhan@example.com',   '2025-02-12 20:15:00', 3, 'Booked'),
(3, 'Sophia Martinez','sophia@example.com',  '2025-02-13 17:45:00', 6, 'Booked'),
(4, 'Lucas Brown',    'lucas@example.com',   '2025-02-14 18:30:00', 2, 'Cancelled'),
(5, 'Harper Singh',    'harper.singh@example.com','2025-02-15 19:00:00', 5, 'Booked'),
(2, 'Noah Williams',   'noah.w@example.com',     '2025-02-16 18:30:00', 3, 'Booked'),
(3, 'Aisha Rahman',    'aisha.r@example.com',    '2025-02-17 20:00:00', 4, 'Cancelled'),
(1, 'Daniel Chen',     'daniel.c@example.com',   '2025-02-18 17:30:00', 2, 'Booked'),
(4, 'Maya Thompson',   'maya.t@example.com',     '2025-02-19 21:00:00', 6, 'Booked');

-- Quick check
SHOW TABLES;
SELECT * FROM restaurants;