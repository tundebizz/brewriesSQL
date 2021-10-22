CREATE TABLE sales (
  sales_id NUMERIC (10),
  sales_rep VARCHAR(50),
  emails VARCHAR(255),
  brands VARCHAR(50),
  plant_cost INTEGER,
  unit_price INTEGER,
  quantity INTEGER,
  cost INTEGER,
  profit INTEGER,
  countries VARCHAR (50),
  region VARCHAR (50),
  months VARCHAR (50),  
  years VARCHAR (50),
  PRIMARY KEY (sales_id)
);



--Question A1
SELECT SUM(profit) AS Last_3_Years_Profit
FROM Sales
WHERE years IN ('2019','2018','2017');

--Question A2
SELECT 
CASE
    WHEN Countries IN ('Ghana','Nigeria') THEN 'Anglophone'
	WHEN Countries IN ('Togo','Senegal','Benin') THEN 'Francophone'
END AS Territory,
SUM (profit) AS Total_Profit
FROM Sales
GROUP BY Territory
ORDER BY Total_Profit DESC;

--Question A3
SELECT countries, SUM(profit) AS TotalProfit
FROM Sales
WHERE years IN ('2019')
GROUP BY countries
ORDER BY totalprofit DESC
LIMIT 1;

--Question A4
SELECT years, SUM(profit) AS TotalProfit
FROM Sales
GROUP BY years
ORDER BY totalprofit DESC
LIMIT 1;

--Question A5
SELECT months, SUM(profit) AS TotalProfit
FROM Sales
WHERE years IN ('2019','2018','2017')
GROUP BY months
ORDER BY totalprofit ASC
LIMIT 1;

--Question A5
SELECT months, SUM(profit) AS TotalProfit
FROM Sales
WHERE years IN ('2019','2018','2017')
GROUP BY months
ORDER BY totalprofit ASC
LIMIT 1;

--Question A6
SELECT MIN(profit) AS Minimum_Profit_In_December
FROM Sales
WHERE years IN ('2018') AND months IN ('December') ;



--Question A7
SELECT months, ((SUM(profit) * 100)/(SELECT SUM(profit)
FROM sales
WHERE years IN ('2019'))) AS Percentage_Profit
FROM Sales
WHERE years IN ('2019')
GROUP BY months
ORDER BY Percentage_Profit DESC;


--Question A8
SELECT brands, SUM(profit) AS totalprofit
FROM Sales
WHERE countries IN ('Senegal') 
GROUP BY brands
ORDER BY totalprofit DESC
LIMIT 1;

---Question B1
SELECT brands, SUM(quantity) AS TotalQuantity
FROM Sales
WHERE years IN ('2019','2018') AND countries IN ('Senegal', 'Benin','Togo')
GROUP BY brands
ORDER BY TotalQuantity DESC
LIMIT 3;

---Question B2
SELECT brands, SUM(quantity) AS TotalProfit
FROM Sales
WHERE countries IN ('Ghana')
GROUP BY brands
ORDER BY totalprofit DESC
LIMIT 2;

--Question B3
SELECT brands, SUM(quantity) AS TotalQuantity
FROM Sales
WHERE countries IN ('Nigeria') AND brands NOT LIKE '%malt%'
AND years IN ('2019','2018','2017')
GROUP BY brands
ORDER BY TotalQuantity DESC;


--Question B4
SELECT brands, SUM(quantity) AS TotalQuantity
FROM Sales
WHERE countries IN ('Nigeria','Ghana') AND brands LIKE '%malt%'
AND years IN ('2019','2018')
GROUP BY brands
ORDER BY totalquantity DESC;

--Question B5
SELECT brands, SUM(quantity) AS TotalQuantity
FROM Sales
WHERE countries IN ('Nigeria')
AND years IN ('2019')
GROUP BY brands
ORDER BY totalquantity DESC
LIMIT 1;


--Question B6
SELECT brands, SUM(quantity) AS TotalQuantity
FROM Sales
WHERE countries IN ('Nigeria')
AND region IN ('southsouth')
GROUP BY brands
ORDER BY totalquantity DESC
LIMIT 1;

--Question B7
SELECT brands, SUM(quantity) AS TotalQuantity
FROM Sales
WHERE countries IN ('Nigeria') AND brands NOT LIKE '%malt%'
GROUP BY brands
ORDER BY totalquantity DESC;

--Question B8
SELECT region, SUM(quantity) AS TotalQuantity
FROM Sales
WHERE countries IN ('Nigeria') AND brands IN ('budweiser')
GROUP BY region
ORDER BY totalquantity DESC;

--Question B9
SELECT region, SUM(quantity) AS TotalQuantity
FROM Sales
WHERE countries IN ('Nigeria') AND brands IN ('budweiser')
AND years IN ('2019')
GROUP BY region
ORDER BY totalquantity DESC;

--Question C1
SELECT countries, SUM(quantity) AS TotalQuantity
FROM Sales
WHERE brands NOT LIKE '%malt%'
GROUP BY countries
ORDER BY totalquantity DESC
LIMIT 1;

--Question C2
SELECT sales_rep, SUM(quantity) AS TotalQuantity
FROM Sales
WHERE countries IN('Senegal') AND brands IN ('budweiser')
GROUP BY sales_rep
ORDER BY totalquantity DESC
LIMIT 1;


--Question C3
SELECT countries, SUM(profit) AS TotalProfit
FROM Sales
WHERE months IN('October','November','December')
AND years IN ('2019')
GROUP BY countries
ORDER BY totalprofit DESC
LIMIT 1;








