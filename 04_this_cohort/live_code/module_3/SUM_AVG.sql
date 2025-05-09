--SUM & AVG

--how much did a customer spend on each day
SELECT 
market_date
,customer_id
,SUM(CAST(quantity AS decimal(5,2))*cost_to_customer_per_qty) as total_cost

FROM customer_purchases
GROUP BY market_date, customer_id;

--how much does each customer spend on average
SELECT 
customer_first_name
,customer_last_name
,ROUND(AVG(quantity*cost_to_customer_per_qty),2) as avg_spend

FROM customer_purchases cp
INNER JOIN customer c
	ON cp.customer_id = c.customer_id
GROUP BY c.customer_id
