use project2;
-- 1 TRANSACTION TABLE CREATION food_order
CREATE TABLE food_order (
    order_id INT,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    order_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    delivery BOOLEAN DEFAULT FALSE,
    CONSTRAINT foodorder_id_pk PRIMARY KEY (order_id),
    CONSTRAINT foodorder_customerid_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT foodorder_branchid_fk FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
-- DATA INSERTION
INSERT INTO food_order (order_id, customer_id, branch_id, order_time, total_amount, delivery) VALUES
(1, 1, 3, '2025-06-01 12:15:00', 349.00, TRUE),
(2, 2, 5, '2025-06-01 13:00:00', 129.00, FALSE),
(3, 3, 7, '2025-06-02 14:30:00', 499.00, TRUE),
(4, 4, 1, '2025-06-02 15:45:00', 259.00, FALSE),
(5, 5, 8, '2025-06-02 16:10:00', 379.00, TRUE),
(6, 6, 10, '2025-06-03 11:25:00', 199.00, FALSE),
(7, 7, 12, '2025-06-03 18:00:00', 289.00, TRUE),
(8, 8, 4, '2025-06-04 09:45:00', 159.00, FALSE),
(9, 9, 6, '2025-06-04 13:10:00', 439.00, TRUE),
(10, 10, 14, '2025-06-04 19:20:00', 229.00, FALSE),
(11, 11, 15, '2025-06-05 12:10:00', 189.00, TRUE),
(12, 12, 16, '2025-06-05 13:45:00', 329.00, TRUE),
(13, 13, 9, '2025-06-06 10:30:00', 149.00, FALSE),
(14, 14, 11, '2025-06-06 17:00:00', 409.00, TRUE),
(15, 15, 2, '2025-06-07 14:50:00', 199.00, FALSE),
(16, 16, 17, '2025-06-07 15:40:00', 289.00, TRUE),
(17, 17, 18, '2025-06-07 16:30:00', 359.00, FALSE),
(18, 18, 13, '2025-06-08 12:00:00', 249.00, TRUE),
(19, 19, 19, '2025-06-08 18:15:00', 199.00, TRUE),
(20, 20, 20, '2025-06-09 11:35:00', 299.00, FALSE);
select * from food_order;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 2 TRANSACTION TABLE CREATION order_item
CREATE TABLE order_item (
    order_item_id INT,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    price_each DECIMAL(8,2) NOT NULL,
    CONSTRAINT orderitem_id_pk PRIMARY KEY (order_item_id),
    CONSTRAINT orderitem_orderid_fk FOREIGN KEY (order_id) REFERENCES food_order(order_id),
    CONSTRAINT orderitem_itemid_fk FOREIGN KEY (item_id) REFERENCES menu_item(item_id)
);
-- DATA INSERTION
INSERT INTO order_item (order_item_id, order_id, item_id, quantity, price_each) VALUES
(1, 1, 3, 2, 179.00),
(2, 1, 5, 1, 89.00),
(3, 2, 7, 1, 139.00),
(4, 3, 2, 1, 199.00),
(5, 3, 6, 2, 119.00),
(6, 4, 10, 1, 189.00),
(7, 4, 4, 1, 59.00),
(8, 5, 11, 1, 299.00),
(9, 6, 14, 2, 79.00),
(10, 7, 16, 1, 249.00),
(11, 7, 18, 1, 109.00),
(12, 8, 8, 2, 159.00),
(13, 9, 1, 1, 149.00),
(14, 10, 20, 1, 69.00),
(15, 11, 15, 1, 139.00),
(16, 12, 9, 1, 99.00),
(17, 13, 13, 1, 79.00),
(18, 14, 17, 1, 89.00),
(19, 15, 19, 1, 79.00),
(20, 16, 12, 1, 179.00);
select * from order_item;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 3 TRANSACTION TABLE CREATION payment
CREATE TABLE payment (
    payment_id INT,
    order_id INT NOT NULL,
    payment_mode VARCHAR(20),
    payment_status VARCHAR(20),
    paid_on DATETIME,
    CONSTRAINT payment_id_pk PRIMARY KEY (payment_id),
    CONSTRAINT payment_orderid_fk FOREIGN KEY (order_id) REFERENCES food_order(order_id)
);
-- DATA INSERTION
INSERT INTO payment (payment_id, order_id, payment_mode, payment_status, paid_on) VALUES
(1, 1, 'UPI', 'Paid', '2025-06-01 12:16:00'),
(2, 2, 'Card', 'Paid', '2025-06-01 13:01:00'),
(3, 3, 'UPI', 'Paid', '2025-06-02 14:32:00'),
(4, 4, 'Cash', 'Paid', '2025-06-02 15:46:00'),
(5, 5, 'Card', 'Paid', '2025-06-02 16:11:00'),
(6, 6, 'Cash', 'Paid', '2025-06-03 11:26:00'),
(7, 7, 'UPI', 'Paid', '2025-06-03 18:01:00'),
(8, 8, 'Card', 'Paid', '2025-06-04 09:46:00'),
(9, 9, 'Cash', 'Paid', '2025-06-04 13:11:00'),
(10, 10, 'UPI', 'Paid', '2025-06-04 19:21:00'),
(11, 11, 'UPI', 'Paid', '2025-06-05 12:11:00'),
(12, 12, 'Card', 'Paid', '2025-06-05 13:46:00'),
(13, 13, 'Cash', 'Paid', '2025-06-06 10:31:00'),
(14, 14, 'Card', 'Paid', '2025-06-06 17:01:00'),
(15, 15, 'UPI', 'Paid', '2025-06-07 14:51:00'),
(16, 16, 'UPI', 'Paid', '2025-06-07 15:41:00'),
(17, 17, 'Card', 'Paid', '2025-06-07 16:31:00'),
(18, 18, 'Cash', 'Paid', '2025-06-08 12:01:00'),
(19, 19, 'UPI', 'Paid', '2025-06-08 18:16:00'),
(20, 20, 'Card', 'Paid', '2025-06-09 11:36:00');
select * from payment;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 4 TRANSACTION TABLE CREATION DELIVERY
CREATE TABLE delivery (
    delivery_id INT,
    order_id INT NOT NULL,
    delivery_staff_id INT,
    zone_id INT,
    delivery_status VARCHAR(30),
    delivered_at DATETIME,
    CONSTRAINT delivery_id_pk PRIMARY KEY (delivery_id),
    CONSTRAINT delivery_orderid_fk FOREIGN KEY (order_id) REFERENCES food_order(order_id),
    CONSTRAINT delivery_staffid_fk FOREIGN KEY (delivery_staff_id) REFERENCES staff(staff_id),
    CONSTRAINT delivery_zoneid_fk FOREIGN KEY (zone_id) REFERENCES delivery_zone(zone_id)
);
-- DATA INSERTION
INSERT INTO delivery (delivery_id, order_id, delivery_staff_id, zone_id, delivery_status, delivered_at) VALUES
(1, 1, 4, 3, 'Delivered', '2025-06-01 12:45:00'),
(2, 3, 8, 5, 'Delivered', '2025-06-02 15:00:00'),
(3, 5, 13, 2, 'Delivered', '2025-06-02 16:40:00'),
(4, 7, 12, 8, 'Delivered', '2025-06-03 18:30:00'),
(5, 9, 7, 10, 'Delivered', '2025-06-04 13:45:00'),
(6, 11, 15, 12, 'Delivered', '2025-06-05 12:30:00'),
(7, 12, 6, 14, 'Delivered', '2025-06-05 14:20:00'),
(8, 14, 18, 6, 'Delivered', '2025-06-06 17:30:00'),
(9, 16, 10, 17, 'Delivered', '2025-06-07 16:00:00'),
(10, 18, 3, 19, 'Delivered', '2025-06-08 12:30:00'),
(11, 19, 11, 20, 'Delivered', '2025-06-08 18:40:00');
select * from DELIVERY;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 5 TRANSACTION TABLE CREATION inventory_stock
CREATE TABLE inventory_stock (
    stock_id INT,
    branch_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity_available DECIMAL(10,2),
    last_updated DATE,
    CONSTRAINT invstock_id_pk PRIMARY KEY (stock_id),
    CONSTRAINT invstock_branchid_fk FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    CONSTRAINT invstock_ingid_fk FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
);
-- DATA INSERTION
INSERT INTO inventory_stock (stock_id, branch_id, ingredient_id, quantity_available, last_updated) VALUES
(1, 20, 6, 39.38, '2025-05-22'),
(2, 6, 14, 85.71, '2025-06-15'),
(3, 3, 14, 88.56, '2025-06-10'),
(4, 14, 10, 53.92, '2025-06-08'),
(5, 1, 3, 41.24, '2025-06-03'),
(6, 5, 8, 76.89, '2025-05-30'),
(7, 2, 1, 62.17, '2025-06-01'),
(8, 19, 7, 91.00, '2025-06-12'),
(9, 9, 5, 37.66, '2025-06-13'),
(10, 7, 13, 42.30, '2025-06-09'),
(11, 4, 9, 58.25, '2025-06-14'),
(12, 12, 2, 70.10, '2025-06-05'),
(13, 10, 12, 67.75, '2025-06-07'),
(14, 13, 11, 31.50, '2025-06-06'),
(15, 8, 4, 45.90, '2025-06-02'),
(16, 18, 15, 54.65, '2025-06-04'),
(17, 11, 20, 29.90, '2025-06-11'),
(18, 15, 18, 73.88, '2025-06-10'),
(19, 16, 16, 66.30, '2025-06-13'),
(20, 17, 19, 49.75, '2025-06-09');
select * from inventory_stock;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 6 TRANSACTION TABLE CREATION inventory_usage
CREATE TABLE inventory_usage (
    usage_id INT,
    branch_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    used_quantity DECIMAL(10,2),
    usage_date DATE NOT NULL,
    CONSTRAINT invusage_id_pk PRIMARY KEY (usage_id),
    CONSTRAINT invusage_branchid_fk FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    CONSTRAINT invusage_ingid_fk FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
);
-- DATA INSERTION
INSERT INTO inventory_usage (usage_id, branch_id, ingredient_id, used_quantity, usage_date) VALUES
(1, 20, 3, 5.52, '2025-06-04'),
(2, 20, 2, 3.48, '2025-06-09'),
(3, 10, 18, 9.65, '2025-06-07'),
(4, 6, 6, 4.23, '2025-06-10'),
(5, 11, 1, 7.10, '2025-06-08'),
(6, 1, 5, 2.75, '2025-06-11'),
(7, 12, 8, 8.20, '2025-06-05'),
(8, 9, 7, 6.33, '2025-06-06'),
(9, 3, 12, 5.40, '2025-06-04'),
(10, 14, 10, 9.00, '2025-06-03'),
(11, 5, 9, 3.21, '2025-06-02'),
(12, 17, 15, 4.60, '2025-06-01'),
(13, 8, 11, 6.90, '2025-06-09'),
(14, 15, 13, 7.55, '2025-06-08'),
(15, 2, 4, 3.30, '2025-06-07'),
(16, 4, 16, 2.80, '2025-06-10'),
(17, 16, 17, 5.75, '2025-06-05'),
(18, 13, 19, 8.40, '2025-06-06'),
(19, 18, 20, 6.15, '2025-06-11'),
(20, 7, 5, 4.33, '2025-06-10');
select * from inventory_usage;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 7 TRANSACTION TABLE CREATION staff_attendance
CREATE TABLE staff_attendance (
    attendance_id INT,
    staff_id INT NOT NULL,
    branch_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    shift VARCHAR(20),
    present BOOLEAN DEFAULT TRUE,
    CONSTRAINT attendance_id_pk PRIMARY KEY (attendance_id),
    CONSTRAINT attendance_staffid_fk FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    CONSTRAINT attendance_branchid_fk FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
-- DATA INSERTION
INSERT INTO staff_attendance (attendance_id, staff_id, branch_id, attendance_date, shift, present) VALUES
(1, 1, 1, '2025-06-08', 'Morning', TRUE),
(2, 2, 2, '2025-06-08', 'Evening', TRUE),
(3, 3, 3, '2025-06-08', 'Full Day', TRUE),
(4, 4, 4, '2025-06-08', 'Morning', TRUE),
(5, 5, 5, '2025-06-08', 'Evening', TRUE),
(6, 6, 6, '2025-06-08', 'Full Day', TRUE),
(7, 7, 7, '2025-06-08', 'Morning', TRUE),
(8, 8, 8, '2025-06-08', 'Evening', TRUE),
(9, 9, 9, '2025-06-08', 'Full Day', TRUE),
(10, 10, 10, '2025-06-08', 'Morning', FALSE),
(11, 11, 11, '2025-06-08', 'Evening', TRUE),
(12, 12, 12, '2025-06-08', 'Full Day', TRUE),
(13, 13, 13, '2025-06-08', 'Morning', TRUE),
(14, 14, 14, '2025-06-08', 'Evening', FALSE),
(15, 15, 15, '2025-06-08', 'Full Day', TRUE),
(16, 16, 16, '2025-06-08', 'Morning', TRUE),
(17, 17, 17, '2025-06-08', 'Evening', TRUE),
(18, 18, 18, '2025-06-08', 'Full Day', TRUE),
(19, 19, 19, '2025-06-08', 'Morning', FALSE),
(20, 20, 20, '2025-06-08', 'Evening', TRUE);
select * from staff_attendance;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 8 TRANSACTION TABLE CREATION menu_price_history
CREATE TABLE menu_price_history (
    price_id INT,
    item_id INT NOT NULL,
    old_price DECIMAL(8,2),
    new_price DECIMAL(8,2),
    changed_on DATE,
    CONSTRAINT pricehistory_id_pk PRIMARY KEY (price_id),
    CONSTRAINT pricehistory_itemid_fk FOREIGN KEY (item_id) REFERENCES menu_item(item_id)
);
-- DATA INSERTION
INSERT INTO menu_price_history (price_id, item_id, old_price, new_price, changed_on) VALUES
(1, 1, 139.00, 149.00, '2025-06-01'),
(2, 2, 189.00, 199.00, '2025-06-02'),
(3, 3, 169.00, 179.00, '2025-06-03'),
(4, 4, 55.00, 59.00, '2025-06-04'),
(5, 5, 79.00, 89.00, '2025-06-04'),
(6, 6, 109.00, 119.00, '2025-06-05'),
(7, 7, 129.00, 139.00, '2025-06-05'),
(8, 8, 149.00, 159.00, '2025-06-06'),
(9, 9, 89.00, 99.00, '2025-06-06'),
(10, 10, 179.00, 189.00, '2025-06-07'),
(11, 11, 279.00, 299.00, '2025-06-07'),
(12, 12, 169.00, 179.00, '2025-06-08'),
(13, 13, 69.00, 79.00, '2025-06-08'),
(14, 14, 149.00, 159.00, '2025-06-09'),
(15, 15, 129.00, 139.00, '2025-06-09'),
(16, 16, 239.00, 249.00, '2025-06-10'),
(17, 17, 89.00, 99.00, '2025-06-10'),
(18, 18, 99.00, 109.00, '2025-06-11'),
(19, 19, 69.00, 79.00, '2025-06-11'),
(20, 20, 59.00, 69.00, '2025-06-12');
select * from menu_price_history;
-- -------------------------------------------------------------------------------------------------------------------------------------
-- 9 TRANSACTION TABLE CREATION daily_sales_report
CREATE TABLE daily_sales_report (
    report_id INT,
    branch_id INT NOT NULL,
    report_date DATE NOT NULL,
    total_orders INT,
    total_sales DECIMAL(12,2),
    CONSTRAINT salesreport_id_pk PRIMARY KEY (report_id),
    CONSTRAINT salesreport_branchid_fk FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
-- DATA INSERTION
INSERT INTO daily_sales_report (report_id, branch_id, report_date, total_orders, total_sales) VALUES
(1, 1, '2025-06-01', 25, 4820.50),
(2, 2, '2025-06-01', 18, 3529.75),
(3, 3, '2025-06-01', 22, 4011.00),
(4, 4, '2025-06-02', 30, 5890.25),
(5, 5, '2025-06-02', 20, 3775.00),
(6, 6, '2025-06-02', 27, 5129.40),
(7, 7, '2025-06-03', 19, 3660.30),
(8, 8, '2025-06-03', 24, 4720.00),
(9, 9, '2025-06-03', 15, 2890.75),
(10, 10, '2025-06-04', 28, 5455.00),
(11, 11, '2025-06-04', 16, 3075.60),
(12, 12, '2025-06-04', 21, 4189.10),
(13, 13, '2025-06-05', 17, 3250.00),
(14, 14, '2025-06-05', 22, 4600.25),
(15, 15, '2025-06-05', 20, 3999.90),
(16, 16, '2025-06-06', 29, 6102.20),
(17, 17, '2025-06-06', 23, 4390.45),
(18, 18, '2025-06-06', 18, 3545.00),
(19, 19, '2025-06-07', 31, 6221.75),
(20, 20, '2025-06-07', 26, 5100.00);
select * from daily_sales_report;
-- -------------------------------------------------------------------------------------------------------------------------------------