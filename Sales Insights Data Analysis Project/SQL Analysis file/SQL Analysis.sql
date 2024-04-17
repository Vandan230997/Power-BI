create database sales;

use sales;

Select * from customers;

Select * from transactions;

Select * from products;

select * from transactions where market_code = "Mark001";

select * from transactions where currency = "USD";

# Transcations in year 2020
select * from transactions t
join sales.date d
on t.order_date =  d.date
where year = 2020;

# Total Revenue in year 2020
select sum(sales_amount) from transactions t
join sales.date d
on t.order_date =  d.date
where year = 2020;

# Total Revenue in year 2020 and chennai
select sum(sales_amount) from transactions t
join sales.date d
on t.order_date =  d.date
where year = 2020 and market_code = 'Mark001';

# Distinct Products sold in Chennai
select distinct product_code 
from transactions 
where market_code = "Mark001";

# Check sales amount less than 0
select * from transactions where sales_amount <=0;

# Check sum of sales in 2020

select sum(sales_amount)
from transactions
where year(order_date)=2020;