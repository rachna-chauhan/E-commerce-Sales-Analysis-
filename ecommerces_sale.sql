use ecommerce;

select sum(sales) as total_sales,
sum(profit) as total_profit,
count(distinct order_id) as total_orders
from ecommerces_sales_new;

select sub_category,sum(profit) as profitnew
from ecommerces_sales_new
group by sub_category
order by profitnew desc limit 5;

select category,sum(sales) as total_sales,sum(profit) as total_profit
from ecommerces_sales_new
group by category
order by total_sales desc;

select ship_mode,sum(sales) as revenue,sum(profit) as profit
from ecommerces_sales_new
group by ship_mode
order by revenue desc;

select discount,round(AVG(profit),2)as avg_profit
from ecommerces_sales_new
group by discount
order by discount;

select date_format(order_date, '%Y-%m') as month,
sum(sales) as monthly_Sales
from ecommerces_sales_new
group by month;

select year(order_date) as year,
sum(sales) as sales,sum(profit) as profit
from ecommerces_sales_new
group by year;

SELECT 
    state,
    SUM(sales) AS sales
FROM ecommerces_sales_new
GROUP BY state
ORDER BY sales DESC
LIMIT 10;

SELECT 
    customer_name,
    SUM(sales) AS total_spent
FROM ecommerces_sales_new
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;

SELECT * 
FROM(select category,sub_category,SUM(sales) as sales,RANK() OVER(partition by category order by sum(sales)DESC) as rnk
from ecommerces_sales_new group by category,sub_category) ranked where rnk <= 5;

select order_date,
sum(sales) over(order by order_date) as runningsale 
from ecommerces_sales_new;

select category,
ROUND(SUM(profit)/SUM(sales)*100,2)as profit_Ration 
from ecommerces_sales_new group by category;