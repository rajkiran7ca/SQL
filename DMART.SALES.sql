SELECT * FROM dmart.sales;

SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;


ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

SELECT
	date,
	DAYNAME(date)
FROM sales;


-- Add month_name column
SELECT
	date,
	MONTHNAME(date)
FROM sales;


------- How many unique cities does the data have? ------------
SELECT 
	DISTINCT city
FROM sales;

------- In which city is each branch?--------
SELECT 
	DISTINCT city,
    branch
FROM sales;

-- How many unique product lines does the data have?---------
SELECT
	DISTINCT product_line
FROM sales;


-- What is the most selling product line----------
SELECT
	SUM(quantity) as qty,
    product_line
FROM sales
GROUP BY product_line
ORDER BY qty DESC;


-- What product line had the largest revenue?
SELECT
	product_line,
	SUM(total) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;


-- What is the city with the largest revenue?
SELECT
	branch,
	city,
	SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch 
ORDER BY total_revenue;


-- What product line had the largest VAT?
SELECT
	product_line,
	AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;


----- each product line and add a column to those product------ 
----- line showing "Good", "Bad". Good if its greater than average sales --------

SELECT 
	AVG(quantity) AS avg_qnty
FROM sales;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;


-----------END----------
