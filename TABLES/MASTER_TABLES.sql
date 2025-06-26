-- DATABASE CREATED PROJECT2
CREATE database project2;
use project2;
-- 1 MASTER TABLE CREATION Food_category
CREATE TABLE food_category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);
-- DATA INSERTION
INSERT INTO food_category (category_id, category_name, description) VALUES
(1, 'Burger', 'Grilled or fried sandwich with a meat or veggie patty'),
(2, 'Pizza', 'Italian-style flatbread with toppings and cheese'),
(3, 'Wraps', 'Soft rolled flatbreads with fillings'),
(4, 'Beverages', 'Hot and cold drinks including juices and sodas'),
(5, 'Sides', 'Accompanying items like fries, nuggets, etc.'),
(6, 'Desserts', 'Sweet dishes served after meals'),
(7, 'Salads', 'Fresh or cooked vegetable/fruit mixes'),
(8, 'Tacos', 'Mexican-style folded tortillas with fillings'),
(9, 'Breakfast', 'Items typically served in the morning'),
(10, 'Rice Bowls', 'Bowls of rice with mixed toppings'),
(11, 'Combo Meals', 'Predefined meal sets with discounts'),
(12, 'Pasta', 'Italian noodles with sauce and toppings'),
(13, 'Soups', 'Liquid starters served hot or cold'),
(14, 'Vegan', 'Plant-based meals with no animal products'),
(15, 'Grilled', 'Items cooked over direct heat or flame'),
(16, 'Fried', 'Items deep/shallow fried in oil'),
(17, 'Smoothies', 'Blended fruit drinks, often with yogurt or milk'),
(18, 'Milkshakes', 'Sweet dairy drinks with flavorings'),
(19, 'Ice Creams', 'Frozen desserts in various flavors'),
(20, 'Hot Drinks', 'Includes tea, coffee, and hot chocolate');
select * from food_category;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 2 MASTER TABLE CREATION menu_item
CREATE TABLE menu_item(
    item_id INT,
    item_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    is_active BOOLEAN,
    added_on DATE,
   constraint menui_itemid_pk PRIMARY KEY (item_id),
   constraint menui_categoryid_fk FOREIGN KEY (category_id) REFERENCES food_category(category_id)
);
-- DATA INSERTION
INSERT INTO menu_item (item_id, item_name, category_id, price, is_active, added_on) VALUES
(1, 'Classic Chicken Burger', 1, 149.00, TRUE, '2025-04-05'),
(2, 'Veggie Supreme Pizza', 2, 199.00, TRUE, '2025-05-26'),
(3, 'Paneer Wrap', 3, 179.00, TRUE, '2025-05-27'),
(4, 'Iced Lemon Tea', 4, 59.00, TRUE, '2025-03-14'),
(5, 'Curly Fries', 5, 89.00, TRUE, '2025-05-30'),
(6, 'Brownie with Ice Cream', 6, 119.00, TRUE, '2025-05-16'),
(7, 'Caesar Salad', 7, 139.00, TRUE, '2025-03-01'),
(8, 'Beef Tacos', 8, 159.00, TRUE, '2025-04-20'),
(9, 'Egg & Toast', 9, 99.00, TRUE, '2025-06-11'),
(10, 'Butter Chicken Rice Bowl', 10, 189.00, TRUE, '2025-03-22'),
(11, 'Meal Combo 1', 11, 299.00, TRUE, '2025-01-10'),
(12, 'Penne Alfredo', 12, 179.00, TRUE, '2025-04-06'),
(13, 'Tomato Soup', 13, 79.00, TRUE, '2025-02-10'),
(14, 'Vegan Salad Bowl', 14, 159.00, TRUE, '2025-06-01'),
(15, 'Grilled Chicken Skewers', 15, 149.00, TRUE, '2025-05-20'),
(16, 'Fried Chicken Bucket', 16, 249.00, TRUE, '2025-02-07'),
(17, 'Banana Smoothie', 17, 99.00, TRUE, '2025-02-09'),
(18, 'Oreo Milkshake', 18, 109.00, TRUE, '2025-04-20'),
(19, 'Mango Ice Cream', 19, 79.00, TRUE, '2025-01-28'),
(20, 'Hot Chocolate', 20, 69.00, TRUE, '2025-04-13');
select * from menu_item;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 3 MASTER TABLE CREATION branch
CREATE TABLE branch (
    branch_id INT,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    contact_no VARCHAR(15),
    CONSTRAINT branch_id_pk PRIMARY KEY (branch_id)
);
-- DATA INSERTION
INSERT INTO branch (branch_id, branch_name, city, state, contact_no) VALUES
(1, 'Urban Bites Central', 'Mumbai', 'Maharashtra', '022-26549876'),
(2, 'Urban Bites Andheri', 'Mumbai', 'Maharashtra', '022-26751234'),
(3, 'Urban Bites Pune', 'Pune', 'Maharashtra', '020-24561234'),
(4, 'Urban Bites Nagpur', 'Nagpur', 'Maharashtra', '0712-2233445'),
(5, 'Urban Bites Nashik', 'Nashik', 'Maharashtra', '0253-1234567'),
(6, 'Urban Bites Thane', 'Thane', 'Maharashtra', '022-29876543'),
(7, 'Urban Bites Surat', 'Surat', 'Gujarat', '0261-9876543'),
(8, 'Urban Bites Ahmedabad', 'Ahmedabad', 'Gujarat', '079-12344321'),
(9, 'Urban Bites Rajkot', 'Rajkot', 'Gujarat', '0281-6543210'),
(10, 'Urban Bites Vadodara', 'Vadodara', 'Gujarat', '0265-1122334'),
(11, 'Urban Bites Indore', 'Indore', 'Madhya Pradesh', '0731-9988776'),
(12, 'Urban Bites Bhopal', 'Bhopal', 'Madhya Pradesh', '0755-6655443'),
(13, 'Urban Bites Delhi NCR', 'New Delhi', 'Delhi', '011-22334455'),
(14, 'Urban Bites Noida', 'Noida', 'Uttar Pradesh', '0120-3344556'),
(15, 'Urban Bites Lucknow', 'Lucknow', 'Uttar Pradesh', '0522-2233445'),
(16, 'Urban Bites Jaipur', 'Jaipur', 'Rajasthan', '0141-9988776'),
(17, 'Urban Bites Kolkata', 'Kolkata', 'West Bengal', '033-3344556'),
(18, 'Urban Bites Chennai', 'Chennai', 'Tamil Nadu', '044-6655443'),
(19, 'Urban Bites Bengaluru', 'Bengaluru', 'Karnataka', '080-9988776'),
(20, 'Urban Bites Hyderabad', 'Hyderabad', 'Telangana', '040-7788990');
select * from branch;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 4 MASTER TABLE CREATION CUSTOMER
CREATE TABLE customer (
    customer_id INT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT,
    CONSTRAINT customer_id_pk PRIMARY KEY (customer_id)
);
-- DATA INSERTION
INSERT INTO customer (customer_id, customer_name, email, phone, address) VALUES
(1, 'Amit Sharma', 'amit.sharma@example.com', '9876543210', '12 MG Road, Delhi'),
(2, 'Priya Mehta', 'priya.mehta@example.com', '9811122233', '45 LBS Marg, Mumbai'),
(3, 'Rahul Verma', 'rahul.verma@example.com', '9822334455', '78 Residency Road, Bengaluru'),
(4, 'Neha Patel', 'neha.patel@example.com', '9833445566', '21 Ashram Road, Ahmedabad'),
(5, 'Ravi Iyer', 'ravi.iyer@example.com', '9844556677', '90 T Nagar, Chennai'),
(6, 'Pooja Singh', 'pooja.singh@example.com', '9855667788', '33 Park Street, Kolkata'),
(7, 'Manish Kumar', 'manish.kumar@example.com', '9866778899', '27 Tilak Road, Pune'),
(8, 'Anjali Joshi', 'anjali.joshi@example.com', '9877889900', '55 Banjara Hills, Hyderabad'),
(9, 'Siddharth Jain', 'siddharth.jain@example.com', '9888990011', '18 MG Road, Indore'),
(10, 'Sneha Nair', 'sneha.nair@example.com', '9899001122', '102 Brigade Road, Bengaluru'),
(11, 'Vikram Malhotra', 'vikram.malhotra@example.com', '9900112233', '56 Nehru Place, Delhi'),
(12, 'Deepika Rao', 'deepika.rao@example.com', '9911223344', '66 Adyar, Chennai'),
(13, 'Arjun Bansal', 'arjun.bansal@example.com', '9922334455', '11 Civil Lines, Jaipur'),
(14, 'Kavita Desai', 'kavita.desai@example.com', '9933445566', '3 Marine Drive, Mumbai'),
(15, 'Nikhil Reddy', 'nikhil.reddy@example.com', '9944556677', '4 Jubilee Hills, Hyderabad'),
(16, 'Ishita Ghosh', 'ishita.ghosh@example.com', '9955667788', '8 Salt Lake, Kolkata'),
(17, 'Rohan Kapoor', 'rohan.kapoor@example.com', '9966778899', '25 Sector 18, Noida'),
(18, 'Tanvi Chauhan', 'tanvi.chauhan@example.com', '9977889900', '70 Hazaratganj, Lucknow'),
(19, 'Harshvardhan Rao', 'harsh.rao@example.com', '9988990011', '9 Boring Road, Patna'),
(20, 'Meera Pillai', 'meera.pillai@example.com', '9999001122', '63 MG Road, Ernakulam');
select * from customer;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 5 MASTER TABLE CREATION staff_role
CREATE TABLE staff_role (
    role_id INT,
    role_name VARCHAR(50) NOT NULL,
    CONSTRAINT staffrole_id_pk PRIMARY KEY (role_id)
);
-- DATA INSERTION
INSERT INTO staff_role (role_id, role_name) VALUES
(1, 'Manager'),
(2, 'Cashier'),
(3, 'Chef'),
(4, 'Delivery Executive'),
(5, 'Cleaner');
select * from staff_role;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 6 MASTER TABLE CREATION staff
CREATE TABLE staff (
    staff_id INT,
    staff_name VARCHAR(100) NOT NULL,
    role_id INT NOT NULL,
    branch_id INT NOT NULL,
    phone VARCHAR(15),
    CONSTRAINT staff_id_pk PRIMARY KEY (staff_id),
    CONSTRAINT staff_roleid_fk FOREIGN KEY (role_id) REFERENCES staff_role(role_id),
    CONSTRAINT staff_branchid_fk FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
-- DATA INSERTION
INSERT INTO staff (staff_id, staff_name, role_id, branch_id, phone) VALUES
(1, 'Rajesh Khanna', 1, 1, '9876543101'),
(2, 'Sunita Reddy', 2, 2, '9876543102'),
(3, 'Amit Dutta', 3, 3, '9876543103'),
(4, 'Rina Paul', 4, 4, '9876543104'),
(5, 'Mahesh Iyer', 5, 5, '9876543105'),
(6, 'Kavya Sharma', 2, 6, '9876543106'),
(7, 'Dev Patel', 3, 7, '9876543107'),
(8, 'Sneha Joshi', 4, 8, '9876543108'),
(9, 'Manoj Chauhan', 5, 9, '9876543109'),
(10, 'Priya Kaur', 1, 10, '9876543110'),
(11, 'Vinay Shetty', 2, 11, '9876543111'),
(12, 'Aisha Khan', 3, 12, '9876543112'),
(13, 'Anil Kapoor', 4, 13, '9876543113'),
(14, 'Pooja Verma', 5, 14, '9876543114'),
(15, 'Naveen Kumar', 1, 15, '9876543115'),
(16, 'Ishita Malhotra', 2, 16, '9876543116'),
(17, 'Suresh Rao', 3, 17, '9876543117'),
(18, 'Neha Bhatia', 4, 18, '9876543118'),
(19, 'Ramesh Singh', 5, 19, '9876543119'),
(20, 'Deepa Menon', 1, 20, '9876543120');
select * from staff;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 7 MASTER TABLE CREATION unit_measures
CREATE TABLE unit_measure (
    unit_id INT,
    unit_name VARCHAR(20) NOT NULL, -- e.g., kg, litre, pcs
    description VARCHAR(100),
    CONSTRAINT unit_id_pk PRIMARY KEY (unit_id)
);
-- DATA INSERTION
INSERT INTO unit_measure (unit_id, unit_name, description) VALUES
(1, 'kg', 'Kilogram - used for solid bulk items'),
(2, 'litre', 'Litre - used for liquid items'),
(3, 'pcs', 'Pieces - used for countable items'),
(4, 'grams', 'Grams - used for smaller solid quantities'),
(5, 'ml', 'Millilitres - used for small liquid quantities'),
(6, 'pack', 'Pack - pre-packed units'),
(7, 'box', 'Box - grouped packaging'),
(8, 'can', 'Can - tin or aluminum packaged'),
(9, 'bottle', 'Bottle - liquid in bottles'),
(10, 'slice', 'Slice - cut portions like bread or cheese');
select * from unit_measure;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 8 MASTER TABLE CREATION INGREDIENT
CREATE TABLE ingredient (
    ingredient_id INT,
    ingredient_name VARCHAR(100) NOT NULL,
    unit_id INT NOT NULL,
    current_stock DECIMAL(10,2),
    added_on DATE,
    CONSTRAINT ingredient_id_pk PRIMARY KEY (ingredient_id),
    CONSTRAINT ingredient_unitid_fk FOREIGN KEY (unit_id) REFERENCES unit_measure(unit_id)
);
-- DATA INSERTION
INSERT INTO ingredient (ingredient_id, ingredient_name, unit_id, current_stock, added_on) VALUES
(1, 'Chicken Breast', 1, 85.50, '2025-05-10'),
(2, 'Tomato Sauce', 2, 40.00, '2025-05-12'),
(3, 'Burger Buns', 3, 150.00, '2025-05-14'),
(4, 'Cheese Slices', 3, 200.00, '2025-05-15'),
(5, 'Lettuce', 1, 30.75, '2025-05-11'),
(6, 'French Fries Pack', 6, 50.00, '2025-05-09'),
(7, 'Onions', 1, 60.25, '2025-05-13'),
(8, 'Garlic Paste', 4, 10.00, '2025-05-08'),
(9, 'Cooking Oil', 2, 100.00, '2025-05-07'),
(10, 'Ketchup Bottle', 9, 40.00, '2025-05-06'),
(11, 'Pizza Base', 3, 90.00, '2025-05-05'),
(12, 'Mayonnaise', 5, 500.00, '2025-05-04'),
(13, 'Paneer Cubes', 1, 25.00, '2025-05-03'),
(14, 'Bread Loaf', 3, 60.00, '2025-05-02'),
(15, 'Chilli Flakes', 4, 2.00, '2025-05-01'),
(16, 'Soft Drink Cans', 8, 120.00, '2025-04-30'),
(17, 'Milk', 2, 70.00, '2025-04-29'),
(18, 'Ice Cream Tub', 9, 30.00, '2025-04-28'),
(19, 'Mutton Keema', 1, 45.00, '2025-04-27'),
(20, 'Boiled Egg', 3, 75.00, '2025-04-26');
select * from ingredient;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 9 MASTER TABLE CREATION delivery_zone
CREATE TABLE delivery_zone (
    zone_id INT,
    branch_id INT NOT NULL,
    zone_name VARCHAR(100) NOT NULL,
    distance_km DECIMAL(5,2),
    delivery_charge DECIMAL(8,2),
    CONSTRAINT deliveryzone_id_pk PRIMARY KEY (zone_id),
    CONSTRAINT deliveryzone_branchid_fk FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
-- DATA INSERTION
INSERT INTO delivery_zone (zone_id, branch_id, zone_name, distance_km, delivery_charge) VALUES
(1, 1, 'Andheri West Zone', 3.25, 30.00),
(2, 2, 'Bandra East Zone', 4.50, 35.00),
(3, 3, 'Shivajinagar Zone', 2.80, 25.00),
(4, 4, 'Dharampeth Zone', 5.00, 40.00),
(5, 5, 'College Road Zone', 3.00, 30.00),
(6, 6, 'Ghodbunder Road Zone', 6.20, 45.00),
(7, 7, 'Citylight Area Zone', 2.90, 25.00),
(8, 8, 'Satellite Zone', 3.50, 28.00),
(9, 9, 'Kalawad Road Zone', 4.75, 38.00),
(10, 10, 'Alkapuri Zone', 2.60, 22.00),
(11, 11, 'Vijay Nagar Zone', 3.30, 29.00),
(12, 12, 'MP Nagar Zone', 5.50, 42.00),
(13, 13, 'Connaught Place Zone', 3.00, 30.00),
(14, 14, 'Sector 62 Zone', 2.80, 26.00),
(15, 15, 'Gomti Nagar Zone', 4.20, 33.00),
(16, 16, 'Vaishali Nagar Zone', 3.70, 31.00),
(17, 17, 'Salt Lake Sector 5 Zone', 5.00, 40.00),
(18, 18, 'Adyar Zone', 3.10, 28.00),
(19, 19, 'Indiranagar Zone', 2.90, 27.00),
(20, 20, 'Banjara Hills Zone', 4.80, 36.00);
select * from delivery_zone;
-- -------------------------------------------------------------------------------------------------------------------------------------