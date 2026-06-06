CREATE DATABASE ecommerce;
USE ecommerce ;

Create table orders (
	order_id varchar(200),
    customer_id varchar(200),
    order_status varchar(200),
    order_purchase_timestamp varchar(200),
    order_approved_at varchar(200),
    order_delivered_carrier_date varchar(200),
    order_delivered_customer_date varchar(200),
    order_estimated_delivery_date varchar(200)
    );

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select count(*) from orders;

CREATE TABLE items (
	order_id varchar(200),
    order_item_id varchar(200),
	product_id varchar(200),
    seller_id varchar(200),
	shipping_limit_date varchar(200),
    price varchar(200),
    freight_value varchar(200)
    );
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_items.csv'
INTO TABLE items
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
 select count(*) from items limit 10; 
 
 create table payments (
	order_id varchar(200),
	payment_sequential varchar(200),
    payment_type varchar(200),
    payment_installments varchar(200),
    payment_value varchar(200)
    );
 
 LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_payment.csv'
INTO TABLE payments
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
 
 create table reviews (
	review_id varchar(200),
	order_id varchar(200),
	review_score varchar(200),
	review_comment_title varchar(200),
	review_comment_message varchar(500),
	review_creation_date varchar(200),
	review_answer_timestamp varchar(200)
    );
 
 
ALTER TABLE reviews MODIFY COLUMN review_comment_message TEXT;
 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_reviews.csv'
INTO TABLE reviews
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp);

SELECT * FROM reviews;
create table product (
	product_id varchar(200),
	product_category_name varchar(200),
	product_name_lenght varchar(200),
	product_description_lenght varchar(200),
	product_photos_qty varchar(500),
	product_weight_g varchar(200),
	product_length_cm varchar(200),
    product_height_cm varchar(200),
    product_width_cm varchar(200)
    );
    
  LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
INTO TABLE product
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select count(*) from product;

create table seller (
	seller_id varchar(200),
	seller_zip_code_prefix varchar(200),
	seller_state varchar(200),
    seller_city varchar(200)
	);
  LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sellers.csv'
INTO TABLE seller
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

  select count(*) from seller;  
  
  #Data Cleaning 
  select review_id,count(*) as occurnaace 
  from reviews 
  group by review_id 
  having count(*) >1;
  
DESCRIBE orders
  select customer_id,count(*) as occurnaace 
  from orders 
  group by customer_id 
  having count(*) >1;
  
  describe items
  
  select product_id,count(*) as occurnaace 
  from items 
  group by product_id 
  having count(*) >1;
  
  select * from items 
  where product_id = 'ac6c3623068f30de03045865e4e10089';
  
select
	SUM(CASE WHEN order_id is null then 1 else 0 end ) as null_order_id,
    SUM(CASE WHEN product_id is null then 1 else 0 end ) as product_id_null,
    SUM(CASE WHEN order_item_id is null then 1 else 0 end ) as order_item_id_nulls,
    SUM(CASE WHEN seller_id is null then 1 else 0 end ) as seller_id_nulls,
    SUM(CASE WHEN shipping_limit_date is null then 1 else 0 end ) as shipping_limit_nulls,
    SUM(CASE WHEN price is null then 1 else 0 end ) as price_nulls,
    SUM(CASE WHEN freight_value is null then 1 else 0 end ) as freight_value_nulls
    from items
    
    
 select
	SUM(CASE WHEN order_id is null then 1 else 0 end ) as null_order_id,
    SUM(CASE WHEN customer_id is null then 1 else 0 end ) as customer_id_null,
    SUM(CASE WHEN order_status is null then 1 else 0 end ) as ordr_status_nulls,
    SUM(CASE WHEN order_purchase_timestamp is null then 1 else 0 end ) as order_purchase_nulls,
    SUM(CASE WHEN order_approved_at is null then 1 else 0 end ) as order_approved_at_nulls,
    SUM(CASE WHEN order_delivered_carrier_date is null then 1 else 0 end ) as order_delivered_carrier_nulls,
    SUM(CASE WHEN order_delivered_customer_date is null then 1 else 0 end ) as order_delivered_customer_nulls,
	SUM(CASE WHEN order_estimated_delivery_date is null then 1 else 0 end ) as order_estimated_delivery_nulls
    from orders   
 
 describe reviews;
	
select
	SUM(CASE WHEN review_id is null then 1 else 0 end ) as null_review_id,
    SUM(CASE WHEN order_id is null then 1 else 0 end ) as orderr_id_null,
    SUM(CASE WHEN review_score is null then 1 else 0 end ) as review_score_nulls,
    SUM(CASE WHEN review_comment_title is null then 1 else 0 end ) as review_comment_title_nulls,
    SUM(CASE WHEN review_comment_message is null then 1 else 0 end ) as review_comment_message_nulls,
    SUM(CASE WHEN review_creation_date is null then 1 else 0 end ) as review_creation_date_nulls,
    SUM(CASE WHEN review_answer_timestamp is null then 1 else 0 end ) as review_answer_timestamp_nulls
    from reviews;
    
    
    SELECT order_status, COUNT(*) as count
FROM orders
GROUP BY order_status
ORDER BY count DESC;

SELECT order_status, 
       COUNT(*) as total,
       SUM(CASE WHEN order_delivered_customer_date = '' OR order_delivered_customer_date IS NULL THEN 1 ELSE 0 END) as missing_delivery_date
FROM orders
GROUP BY order_status;

SELECT DISTINCT order_status FROM orders;

SELECT DISTINCT review_score FROM reviews;
SELECT distinct(order_status) from orders  LIMIT 10;

#Insights 
# Which Product categories get the worst rating and why ?(here worst arting menas rating less than equal to 3 )
SELECT 
	DISTINCT(p.product_category_name),
    count(r.review_score) as count_rating , 
    AVG(r.review_score) as avg_rating
    FROM reviews AS r 
JOIN items AS i
	ON r.order_id =i.order_id
JOIN product AS p 
	ON p.product_id = i.product_id
WHERE review_score <= 3
GROUP BY product_category_name
ORDER BY count(review_score) DESC;

# Do Cancelled orders have longer processing time than late deliveries 
SELECT 
	CASE
		WHEN order_status = 'canceled' then "Cancelled order"
        WHEN order_delivered_carrier_date > order_estimated_delivery_date THEN 'Late Deliveries'
END AS Category,
AVG(TIMESTAMPDIFF(HOUR,order_purchase_timestamp,order_approved_at)) AS avg_processing_time
from orders 
group by Category;

#Do location or city cause late deliveries 
select 
    s.seller_state,
    count(*) as occurnace 
from orders as o 
join items as i 
	on o.order_id = i.order_id
join seller as s 
	on s.seller_id = i.seller_id
where o.order_delivered_carrier_date > o.order_estimated_delivery_date
group by 
	s.seller_state
order by 
	occurnace desc;
    
# Whixh Seller consistently get poor reviews here poor menans less tha equal to 3 
select 
    s.seller_id,
    count(*) as poor_rating 
from REVIEWS  as r
join items as i 
	on r.order_id = i.order_id
join seller as s 
	on s.seller_id = i.seller_id
where r.review_score <= 3
Group by s.seller_id
order by poor_rating desc;

#Does late Delivery cause declining customer satisfaction?
select 
	CASE 
		WHEN  o.order_delivered_carrier_date > o.order_estimated_delivery_date
	THEN 'Late delivery '
	ELSE 'om - time deliver'
END AS Delivery_Status,
	Avg(r.review_score) as avg_rating,
    count(*) as occurnace 
from  orders as o
join reviews as r
	on r.order_id = o.order_id
GROUP BY Delivery_Status
ORDER BY AVG_RATING;

SELECT product_category_name FROM PRODUCT 
WHERE product_category_name IS NULL;