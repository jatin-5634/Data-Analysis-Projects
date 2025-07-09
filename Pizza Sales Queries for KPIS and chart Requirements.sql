select * from pizza_sales
-- Total Revenue Query 
select sum(total_price) as [Total Revenue] from pizza_sales


-- Average Order Value
select sum(total_price) / count(distinct order_id) as [Average Order Value] from pizza_sales


-- Total Pizza Sold
select sum(quantity)as [Total Pizza Sold] from pizza_sales

-- Total Orders
select count(distinct order_id) as [Total Orders] from pizza_sales

-- Average Order Per Pizza
select cast(sum(quantity) as Decimal(10,2))  / cast(count(distinct order_id) as Decimal(10,2)) as [Average Order Per Pizza] from pizza_sales


-- Daily Trends of Total Orders
select datename(dw,order_date) as [Order Day] ,count(Distinct order_id) as [Total Orders]
from pizza_sales
group by Datename(dw,order_date)

--Monthly Trends for total Orders
select datename(month,order_date) as [Order Month] ,count(distinct order_id) as [Total Orders]
from pizza_sales
group  by datename(month,order_date) 

-- Percentage of sales by Pizza Category
select pizza_category,sum(total_price) as [Total Sales],sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as PCT
from pizza_sales 
group by pizza_category

-- Percentage of sales by pizza size
select pizza_size,sum(total_price) as [Total sales],sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as PCT
from pizza_sales 
group by pizza_size
order by PCT desc

-- Top 5 Best Seller by Revenue
select TOP 5 pizza_name,sum(total_price) as [Total Revenue]from pizza_sales
group by pizza_name 
order by  [Total Revenue] desc



-- Bottom 5 Pizzas by Revenue
select  TOP 5 pizza_name,sum(total_price) as [Total Revenue] from pizza_sales
group by pizza_name
order by [Total Revenue] asc


 --- Top 5 Pizzas by Quantity
select TOP 5 pizza_name,sum(Quantity) as [Total Quantity]from pizza_sales
group by pizza_name 
order by  [Total Quantity] desc

-- Bottom 5 by quantity
select TOP 5 pizza_name,sum(Quantity) as [Total Quantity]from pizza_sales
group by pizza_name 
order by  [Total Quantity] asc

-- Top 5 pizzas by  total Sales

select TOP 5 pizza_name,count(distinct order_id) as [Total Orders]from pizza_sales
group by pizza_name 
order by  [Total Orders] desc

-- Bottom 5 by Sales
select TOP 5 pizza_name,count(distinct order_id) as [Total Orders]from pizza_sales
group by pizza_name 
order by  [Total Orders] asc



