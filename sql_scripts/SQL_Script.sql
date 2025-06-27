-- ============================================================================
-- MARKETING ANALYTICS DATABASE SETUP
-- ============================================================================

-- Create Marketing Database (if needed)
CREATE DATABASE marketing_analytics;
USE marketing_analytics;

-- Create Customer Master Table
CREATE TABLE customers (
  customer_id VARCHAR(12) PRIMARY KEY,
  age INT CHECK (age BETWEEN 18 AND 100),
  gender VARCHAR(10),
  country VARCHAR(30),
  registration_date DATE,
  acquisition_channel VARCHAR(30),
  CONSTRAINT valid_gender CHECK (gender IN ('Male', 'Female', 'Other')),
  CONSTRAINT valid_channel CHECK (acquisition_channel IN ('Google Ads', 'Facebook Ads', 'Email', 'Organic Search', 'Referral', 'Direct'))
);

-- Create Marketing Campaign Interaction Table
CREATE TABLE campaign_interactions (
  interaction_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id VARCHAR(12),
  email_opens INT DEFAULT 0,
  email_clicks INT DEFAULT 0,
  ad_impressions INT DEFAULT 0,
  ad_clicks INT DEFAULT 0,
  email_click_rate DECIMAL(5,4),
  ad_click_rate DECIMAL(5,4),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  CONSTRAINT valid_clicks CHECK (email_clicks <= email_opens),
  CONSTRAINT valid_ad_clicks CHECK (ad_clicks <= ad_impressions)
);

-- Create Purchase Behavior Table
CREATE TABLE purchase_behavior (
  behavior_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id VARCHAR(12),
  total_spent DECIMAL(10,2),
  number_of_orders INT,
  days_since_last_purchase INT,
  avg_order_value DECIMAL(10,2),
  customer_segment VARCHAR(20),
  churned BOOLEAN,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  CONSTRAINT valid_segment CHECK (customer_segment IN ('High Value', 'Medium Value', 'Low Value'))
);

select count(*) from customers;
select count(*) from campaign_interactions;
select count(*) from purchase_behavior;

-- Q1: Distribution of customers across acquisition channels
SELECT acquisition_channel, COUNT(*) AS customer_count
FROM customers
GROUP BY acquisition_channel;

-- Q2: Segment-wise average total spent and order count
SELECT customer_segment,
       ROUND(AVG(total_spent), 2) AS avg_spent,
       ROUND(AVG(number_of_orders), 1) AS avg_orders
FROM purchase_behavior
GROUP BY customer_segment;

-- Q3: Identify potential churn-risk customers
SELECT customer_id
FROM purchase_behavior
WHERE days_since_last_purchase > 90 AND churned = 0;

-- Q4: Correlation between email clicks and total spent
SELECT ci.customer_id, ci.email_clicks, pb.total_spent
FROM campaign_interactions ci
JOIN purchase_behavior pb ON ci.customer_id = pb.customer_id;

-- Q5: Gender-wise average spending
SELECT c.gender, ROUND(AVG(pb.total_spent), 2) AS avg_spent
FROM customers c
JOIN purchase_behavior pb ON c.customer_id = pb.customer_id
GROUP BY c.gender;

-- Q6: Estimated Campaign ROI (Revenue per Click)
SELECT ci.customer_id,
       ROUND(pb.total_spent / NULLIF((ci.email_clicks + ci.ad_clicks), 0), 2) AS estimated_roi
FROM campaign_interactions ci
JOIN purchase_behavior pb ON ci.customer_id = pb.customer_id
ORDER BY estimated_roi DESC;
