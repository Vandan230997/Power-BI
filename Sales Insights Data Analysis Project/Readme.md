<h2>AtliQ Hardware Sales Insights Data Analysis Project</h2>


<h3>Table of Content</h3>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Backgroud </h4> 
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. Objective </h4> 
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. AIMS Grid for Data Analysis </h4> 
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. Import the Data </h4> 
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. Data Analysis Discovery phase (SQL) </h4> 
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6. ETL and Data Cleaning (Power BI) </h4> 
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7. Data Modelling </h4>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8. Dashboard Development </h4>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9. Insights </h4>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10. References </h4> 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3>Background:</h3>
Atliq Hardware supplies its products to multiple stores, including Surge Store, Nomad Store, Excel Store, and Electricalsara stores, and maintains offices across India. However, the company has observed a downward trend in sales, prompting the Sales Director to initiate a data analysis project. Regional managers from different regions, including north, south, east, west, and central India, have been tasked with providing insights into the sales performance in their respective areas.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3>Objective</h3>
The objective of this data analysis project is to investigate the declining sales trend of Atliq Hardware, a company specializing in computer hardware and peripherals. The Sales Director of Atliq Hardware aims to gain insights into the sales performance across various regions of India and understand the factors contributing to the decline. By leveraging data analysis techniques, the company aims to identify potential areas for improvement and devise strategies such as discount offers and improved customer engagement to reverse the declining sales trend.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3>AIMS Grid for Data Analysis Project</h3>

* Purpose: To unlock sales insight that are not visible before the sales team for decision support and automate them to reduced manual time spent in data gathering.

* Stakeholders: Sales Director, Marketing Team, Customer Service Team, Data & Analytics Team, IT
  
* End Result: An automated dashboard providing quick & latest sales insights in order to support data driven decision making.
  
* Success criteria: Dashboard(s) uncovering sales order insights with latest data available. Sales team able to take better decisions and prove 10% cost savings of total spend. Sales Analysts stop data gathering manually in order to save 20% of their business time and reinvest it in value added activity.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3>Import the data</h3>
Imported the Data from SQL dump file to SQL server database.

![image](https://github.com/Vandan230997/Power-BI/assets/165855297/3ff5125d-bb02-4b9c-a0c8-d75add8a6cc7)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3>Data Analysis Discovery phase (SQL)</h3>
Imported the data into MYSQL database and ran queries to understand the data. Following are the SQL queries to perform ad hoc analysis.

* Transcations in year 2020
  
```sql SELECT * FROM transactions t JOIN sales.date d ON t.order_date =  d.date where year = 2020;```

* Total Revenue in year 2020

```sql SELECT SUM(sales_amount) FROM transactions t JOIN sales.date d ON t.order_date =  d.date WHERE year = 2020;```

* Total Revenue in year 2020 and Chennai

```sql SELECT SUM(sales_amount) FROM transactions t JOIN sales.date d ON t.order_date =  d.date WHERE year = 2020 AND market_code = 'Mark001';```

* Distinct Products sold in Chennai

```sql SELECT DISTINCT product_code FROM transactions WHERE market_code = "Mark001";```

* Check sales amount less than 0

```sql SELECT * FROM transactions WHERE sales_amount <=0;```

* Check sum of sales in 2020

```sql SELECT SUM(sales_amount) FROM transactions WHERE YEAR(order_date)=2020;

* Total Revenue in year 2020 in Mumbai

```sql SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date WHERE date.year=2020 AND transactions.market_code="Mark002";

* Total revenue in year 2019, January Month

```sql SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date WHERE date.year=2020 AND date.month_name="January" AND transactions.currency="INR\r" OR transactions.currency="USD\r");
