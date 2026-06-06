# Ecommerce Project

## Data Cleaning & Preprocessing
Dataset: Olist Brazilian E-Commerce Dataset
Business Problem: Customer satisfaction is declining — identify operational, seller, product, and delivery factors driving poor reviews.

## Tables Analyzed
Since the business problem is focused on customer satisfaction, I only checked the three most critical tables — orders, reviews, and items. Payments, sellers, and products were skipped at this stage as they were not directly required for answering the core business questions.

## Duplicate Check
In the reviews table, duplicate review_ids were found where the order_ids were different for each entry. Since the order_ids differed, this appears to be a data collection issue on Olist's end rather than a processing error, so these were kept as-is. In the items table, product_id and seller_id appeared multiple times across rows, which is expected behavior since the same product can appear in multiple orders — no action was taken. No duplicates were found in the orders table.

## Null Check
No nulls were found in the reviews or items tables across any column. In the orders table, delivery date columns were null for non-delivered orders, which is expected since those orders never reached the customer — no action was taken.

## Inconsistency Check
Order status had 8 distinct values — delivered, shipped, canceled, unavailable, invoiced, processing, created, and approved — all valid with no unexpected entries. Review scores contained only values between 1 and 5 with no anomalies found.

## Cleaning Decisions
Analysis was restricted to delivered orders only, which totaled 96,478 out of 99,441 orders. Cancelled, unavailable, and other non-delivered statuses were excluded since they cannot have meaningful delivery experience data. Additionally, 8 delivered orders were found to have missing delivery dates — these were excluded from delivery time analysis only but retained for review score analysis.

## 5 Business Question were 
1. Which product categories get the worst reviews and why\

2. Do cancelled orders have longer processing times than delivered orders

3. Does location/city cause late deliveries

4. Which sellers consistently get poor reviews

5. Does late delivery cause declining customer satisfaction

## Insights 
1. I found that the average rating when an order is on time is 4.09, and the average rating when it's delivered late is 2.16. It matters because the rating is drastically low when a product is delivered late. The business should penalize sellers with late deliveries by charging a fee, and compensate affected customers with discount coupons to retain their loyalty.
2. I found that among low-rated orders, cama_mesa_banho received the most complaints with 3,221 bad reviews and an average rating of 1.84, followed by moveis_decoracao with 2,375 complaints and 1.79 average rating. This matters because two product categories are consistently dragging down platform satisfaction scores. Olist should tighten seller standards for these categories and reduce visibility of consistently poorly-rated products until quality improves
3. I found that that late delivery takes 15.67 hours processing Canceled orders take 14.32 hours. Normal orders, which have null categories, take 10 hours, which is the baseline for the order. This matters because orders that are cancelled or delivered late take 40-50% longer to process than normal orders, suggesting processing delays contribute to poor outcomes. Olist should set a maximum processing time target of 10 hours for all orders and flag sellers who consistently exceed this threshold
4. I found the seller ID '4a3ca9315b744ce9f8e9374361493884' has the most number of poor reviews which is 650. It matters because the seller has the worst reviews amongst all. The business should Penalize the seller or issue a warning to reduce the visibility from the Olist till the time he improves his rating
5.	I Found that Sao Paulo has the most number of late deliveries, which is 176. It matters because this late delivery can be worse the customer satisfaction. The business should adjust the delivery date in those specific areas by 2-3 days

Tools Used 
SQL PowerBI

