use suhasdb;

-- Get all rows
SELECT * FROM suhasdb.ecommerce;

-- Filter purchases made by females
SELECT * FROM suhasdb.ecommerce WHERE Gender = 'Female';

-- Count how many purchases in each city
SELECT Location, COUNT(*) AS purchase_count
FROM suhasdb.ecommerce
GROUP BY Location;

-- Joins 
SELECT e.CID, e.Product_Category, p.Product_Name
FROM ecommerce e
INNER JOIN products p ON e.Product_Category = p.Category;

-- Customers who spent more than average net amount (Subqueries)
SELECT * FROM suhasdb.ecommerce
WHERE `Net Amount` > (
    SELECT AVG(`Net Amount`) FROM suhasdb.ecommerce
);

-- Total revenue  Aggregate Functions (SUM, AVG)
SELECT SUM(`Net Amount`) AS total_revenue FROM suhasdb.ecommerce;


SELECT Product_Category, AVG(Discount_Amount) AS avg_discount
FROM suhasdb.ecommerce
GROUP BY Product_Category
ORDER BY avg_discount DESC;

-- Revenue by age group
SELECT `Age Group`, SUM(`Net Amount`) AS total_revenue
FROM ecommerce
GROUP BY `Age Group`
ORDER BY total_revenue DESC;
