use project2;
-- ✅ 1. Operators
-- Scenario 1:
-- Find all orders where the total_amount is greater than 300 and delivery is TRUE.
select * from food_order where total_amount > 300 and  delivery = true;

-- Scenario 2:
-- List all staff whose phone numbers start with '98' and belong to branch 5.
SELECT * FROM staff
WHERE phone LIKE '98%' AND branch_id = 5;

-- Scenario 3:
-- Show all menu items that are either priced above 250 or have been deactivated (is_active = FALSE).
SELECT * FROM menu_item
WHERE price > 250 OR is_active = FALSE;

-- Scenario 4:
-- Find all customers who are not from "Delhi" or whose name does not contain "Singh".
SELECT * FROM customer
WHERE address NOT LIKE '%Delhi%' OR customer_name NOT LIKE '%Singh%';

-- ✅ 2. DRL (Data Retrieval Language - SELECT, WHERE, etc.)
-- Scenario 1:
-- Retrieve the list of food categories and their descriptions.
SELECT category_name,description 
FROM food_category;

-- Scenario 2:
-- Show 7 ingredients added recently .
SELECT * 
FROM ingredient
order by added_on desc
limit 7;

-- Scenario 3:
-- List the names of branches along with their city and state.
SELECT branch_name, city, state 
FROM branch;

-- Scenario 4:
-- Get all payments where the payment mode is "Cash" and payment_status is "Paid".
SELECT * 
FROM payment
WHERE payment_mode = 'Cash' AND payment_status = 'Paid';

-- ✅ 3. Aggregate Functions with GROUP BY
-- Scenario 1:
-- Count the number of orders placed per branch.
SELECT branch_id, COUNT(*) AS order_count
FROM food_order
GROUP BY branch_id;

-- Scenario 2:
-- Find the total used quantity of each ingredient across all branches.
SELECT ingredient_id, SUM(used_quantity) AS total_used
FROM inventory_usage
GROUP BY ingredient_id;

-- Scenario 3:
-- Calculate the average order amount per customer.
SELECT customer_id, AVG(total_amount) AS avg_order_amount
FROM food_order
GROUP BY customer_id;

-- Scenario 4:
-- Show the maximum and minimum item price in each food category.
SELECT category_id, MAX(price) AS max_price, MIN(price) AS min_price
FROM menu_item
GROUP BY category_id;

-- ✅ 4. ORDER BY
-- Scenario 1:
-- List all menu items sorted by their price in descending order.
SELECT * 
FROM menu_item
ORDER BY price DESC;

-- Scenario 2:
-- Display customer names in alphabetical order.
SELECT customer_name 
FROM customer
ORDER BY customer_name ASC;

-- Scenario 3:
-- Show the latest 10 orders based on order_time.
SELECT * 
FROM food_order
ORDER BY order_time DESC
LIMIT 10;
-- Scenario 4:
-- List all staff sorted by role and then by name.
SELECT s.staff_name, r.role_name 
FROM staff s
JOIN staff_role r ON s.role_id = r.role_id
ORDER BY r.role_name, s.staff_name;

-- ✅ 5. Joins
-- Scenario 1:
-- Get order details along with customer name and branch name.
SELECT o.order_id, c.customer_name, b.branch_name, o.total_amount
FROM food_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN branch b ON o.branch_id = b.branch_id;

-- Scenario 2:
-- Show the items ordered in each order with item name and price.
SELECT oi.order_id, mi.item_name, oi.price_each, oi.quantity
FROM order_item oi
JOIN menu_item mi ON oi.item_id = mi.item_id;

-- Scenario 3:
-- List payment status for each customer by joining payment, food_order, and customer.
SELECT p.payment_id, c.customer_name, p.payment_status
FROM payment p
JOIN food_order o ON p.order_id = o.order_id
JOIN customer c ON o.customer_id = c.customer_id;

-- Scenario 4:
-- Display all delivery records with staff name and zone name.
SELECT d.delivery_id, s.staff_name, z.zone_name, d.delivery_status
FROM delivery d
JOIN staff s ON d.delivery_staff_id = s.staff_id
JOIN delivery_zone z ON d.zone_id = z.zone_id;

-- ✅ 6. Subqueries
-- Scenario 1:
-- Find customers who placed the most expensive order.
SELECT c.customer_name, f.total_amount
FROM food_order f
JOIN customer c ON f.customer_id = c.customer_id
WHERE total_amount = (SELECT MAX(total_amount) FROM food_order);

-- Scenario 2:
-- List items whose price is above the average price of all menu items.
SELECT * 
FROM menu_item
WHERE price > (SELECT AVG(price) FROM menu_item);

-- Scenario 3:
-- Show orders that contain more than 1 items.
SELECT order_id
FROM order_item
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Scenario 4:
-- Find staff who were absent on a specific date using a NOT IN subquery on attendance.
SELECT s.staff_id, s.staff_name
FROM staff s
JOIN staff_attendance a ON s.staff_id = a.staff_id
WHERE a.attendance_date = '2025-06-08' AND a.present = FALSE;

-- ✅ 7. Stored Procedures
-- Scenario 1:
-- Create a procedure that takes a branch_id and returns the total sales from that branch.
DELIMITER $$
CREATE PROCEDURE GetBranchSales(IN b_id INT)
BEGIN
  SELECT branch_id, SUM(total_amount) AS total_sales
  FROM food_order
  WHERE branch_id = b_id
  GROUP BY branch_id;
END $$
DELIMITER ;
-- calling
CALL GetBranchSales(5);

-- Scenario 2:
-- Write a stored procedure to get the daily report of total orders and sales by date.
DELIMITER $$
CREATE PROCEDURE DailySalesReport()
BEGIN
  SELECT DATE(order_time) AS report_date, COUNT(*) AS total_orders, SUM(total_amount) AS total_sales
  FROM food_order
  GROUP BY DATE(order_time);
END $$
DELIMITER ;
-- calling
CALL DailySalesReport();

-- Scenario 3:
-- A procedure that updates ingredient stock after usage is recorded.
DELIMITER $$
CREATE PROCEDURE UpdateStock(IN ing_id INT, IN qty_used DECIMAL(10,2))
BEGIN
  UPDATE inventory_stock
  SET quantity_available = quantity_available - qty_used
  WHERE ingredient_id = ing_id;
END $$
DELIMITER ;
-- calling
CALL UpdateStock(3, 4.5);

-- Scenario 4:
-- A stored procedure to deactivate menu items priced above a given limit.
DELIMITER $$
CREATE PROCEDURE DeactivateExpensiveItems(IN limit_price DECIMAL(8,2))
BEGIN
  UPDATE menu_item
  SET is_active = FALSE
  WHERE price > limit_price;
END $$
DELIMITER ;
-- calling
CALL DeactivateExpensiveItems(430.40);

-- ✅ 8. Functions
-- Scenario 1:
-- A function that returns the full name of a staff member by staff_id.
DELIMITER $$
CREATE FUNCTION GetStaffName(s_id INT)
RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE name VARCHAR(100);
  SELECT staff_name INTO name FROM staff WHERE staff_id = s_id;
  RETURN name;
END $$
DELIMITER ;

SELECT GetStaffName(5) AS staff_name;

-- Scenario 2:
-- Create a function to calculate delivery charges based on distance_km.
DELIMITER $$
CREATE FUNCTION CalculateDeliveryCharge(distance DECIMAL(5,2))
RETURNS DECIMAL(8,2)
DETERMINISTIC
NO SQL
BEGIN
  RETURN distance * 10;
END $$
DELIMITER ;

SELECT CalculateDeliveryCharge(7.5) AS delivery_charge;

-- Scenario 3:
-- A function that returns item count in an order.
DELIMITER $$
CREATE FUNCTION GetOrderItemCount(o_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE count_items INT;
  SELECT COUNT(*) INTO count_items FROM order_item WHERE order_id = o_id;
  RETURN count_items;
END $$
DELIMITER ;

SELECT GetOrderItemCount(3) AS item_count;


-- Scenario 4:
-- A function that formats phone numbers to a standard Indian format.
DELIMITER $$
CREATE FUNCTION FormatPhoneNumber(ph VARCHAR(15))
RETURNS VARCHAR(20)
DETERMINISTIC
NO SQL
BEGIN
  RETURN CONCAT('+91-', ph);
END $$
DELIMITER ;

SELECT FormatPhoneNumber('9876543210') AS formatted_number;

-- ✅ 9. Triggers
-- Scenario 1:
-- Create a trigger to log changes in menu prices to menu_price_history.
DELIMITER $$
CREATE TRIGGER LogMenuPriceChange
BEFORE UPDATE ON menu_item
FOR EACH ROW
BEGIN
  IF OLD.price <> NEW.price THEN
    INSERT INTO menu_price_history (item_id, old_price, new_price, changed_on)
    VALUES (OLD.item_id, OLD.price, NEW.price, CURDATE());
  END IF;
END $$
DELIMITER ;

-- Scenario 2:
-- A trigger that updates inventory_stock when a new usage is recorded.
DELIMITER $$
CREATE TRIGGER UpdateStockAfterUsage
AFTER INSERT ON inventory_usage
FOR EACH ROW
BEGIN
  UPDATE inventory_stock
  SET quantity_available = quantity_available - NEW.used_quantity
  WHERE branch_id = NEW.branch_id AND ingredient_id = NEW.ingredient_id;
END $$
DELIMITER ;

-- Scenario 3:
 -- Create a trigger that automatically sets the present column to FALSE if the shift is entered as NULL or an empty string when inserting into staff_attendance.
DELIMITER $$
CREATE TRIGGER SetAbsentIfNoShift
BEFORE INSERT ON staff_attendance
FOR EACH ROW
BEGIN
  IF NEW.shift IS NULL OR TRIM(NEW.shift) = '' THEN
    SET NEW.present = FALSE;
  END IF;
END $$
DELIMITER ;

-- Scenario 4:
-- A trigger to update daily_sales_report after each order is inserted.
DELIMITER $$
CREATE TRIGGER UpdateDailySales
AFTER INSERT ON food_order
FOR EACH ROW
BEGIN
  INSERT INTO daily_sales_report (branch_id, report_date, total_orders, total_sales)
  VALUES (NEW.branch_id, CURDATE(), 1, NEW.total_amount)
  ON DUPLICATE KEY UPDATE
    total_orders = total_orders + 1,
    total_sales = total_sales + NEW.total_amount;
END $$
DELIMITER ;
