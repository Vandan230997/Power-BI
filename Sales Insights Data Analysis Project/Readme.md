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
  
```sql
SELECT * FROM transactions t JOIN sales.date d ON t.order_date =  d.date where year = 2020;
```

* Total Revenue in year 2020

```sql
SELECT SUM(sales_amount) FROM transactions t JOIN sales.date d ON t.order_date =  d.date WHERE year = 2020;
```

* Total Revenue in year 2020 and Chennai

```sql
SELECT SUM(sales_amount) FROM transactions t JOIN sales.date d ON t.order_date =  d.date WHERE year = 2020 AND market_code = 'Mark001';
```

* Distinct Products sold in Chennai

```sql 
SELECT DISTINCT product_code FROM transactions WHERE market_code = "Mark001";
```

* Check sales amount less than 0

```sql 
SELECT * FROM transactions WHERE sales_amount <=0;
```

* Check sum of sales in 2020

```sql 
SELECT SUM(sales_amount) FROM transactions WHERE YEAR(order_date)=2020;
```

* Total Revenue in year 2020 in Mumbai

```sql 
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date WHERE date.year=2020 AND transactions.market_code="Mark002";
```

* Total revenue in year 2019, January Month

```sql 
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date WHERE date.year=2020 AND date.month_name="January" AND transactions.currency="INR\r" OR transactions.currency="USD\r");
```


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<h3>ETL and Data Cleaning (Power BI)</h3>
Performed below steps to clean the data for analysis

![image](https://github.com/Vandan230997/Power-BI/assets/165855297/fd39a211-6de6-4bde-9946-2009a3568633)

* Removed unnecessary data sales_markets table pertaining to states outside India as it only works in India.
* Removed the transactions with sales_amount less than or equal to 0 as it does not make sense.
* Created conditional columns to convert some of the transaction amounts to USD.
* Removed Duplicate values in sales transactions table.
* After performing the transformations, loaded the data in semantic model.


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<h3>Data Modelling</h3>

![image](https://github.com/Vandan230997/Power-BI/assets/165855297/cdd3f182-6051-4ec7-be3e-7b7f0faf8401)

Adhering to best practices, the data modeling for this project has been executed in alignment with the star schema methodology. The star schema offers several advantages, primarily enabling easy slicing of data based on dimensions utilizing the fact table. By structuring the data in this manner, complex joins are avoided, consequently enhancing the performance of reporting processes.

In this project, the data has been meticulously modeled following the star schema paradigm. The central component of the schema is the "Sales Transactions" table, serving as the fact table due to its granular representation of data. This table captures the core sales data and acts as the focal point for analysis and reporting.

Complementing the fact table, four additional tables have been established, namely:

* Sales Customers: This dimension table contains information related to customer attributes and demographics.
* Sales Products: A dimension table housing product-related details such as descriptions, categories, and specifications.
* Sales Markets: This dimension table encompasses market-specific information, including geographical data and market segments.
* Sales Date: Providing temporal context, this dimension table includes date-related attributes such as day, month, year, and any other relevant time-based information.

By segregating the data into fact and dimension tables within the star schema framework, the project ensures a streamlined and efficient approach to data analysis. This schema design facilitates seamless querying and reporting processes, empowering stakeholders to derive actionable insights swiftly and accurately from the dataset.

<b> DAX (Data Analysis Expressions)
Key Measures:</b>

```Revenue = SUM('sales transactions'[sales_amount])
Total Qty sold = SUM('sales transactions'[sales_qty]) 

Total Cost = SUM('sales transactions'[cost_price])
Total Profit = SUM('sales transactions'[norm sales amount])

Average Profit Margin Percentage = AVERAGE('sales transactions'[profit_margin_percentage])

Profit Margin % = DIVIDE([Total Profit],[Revenue],0)

Profit Margin Contribution % = DIVIDE([Total Profit],CALCULATE([Total Profit],ALL('sales customers'),ALL('sales products'),ALL('sales markets')))

Sales Contribution % = DIVIDE([Revenue],CALCULATE([Revenue],ALL('sales customers'),ALL('sales products'),ALL('sales markets')))

Target Difference = [Profit Margin %] - [Profit Target Value]

Revenue LY = CALCULATE([Revenue],SAMEPERIODLASTYEAR('sales date'[date]))
```

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3>Dashboard Development</h3>

<h4> Sales Insight </h4>

![image](https://github.com/Vandan230997/Power-BI/assets/165855297/79d1c2b3-3f8e-4906-b58d-b00e4626a2ff)

* Purpose: To highlight overall sales insights over markets, customers, and product with respect to date.


<h4> Profit Analysis </h4>

![image](https://github.com/Vandan230997/Power-BI/assets/165855297/e2410ffe-d4c0-443c-b4a4-f8cb06d8456b)


* Purpose: To highlight profit insights over markets and customers with metrics such as Revenue contribution %, Profit Contribution %, Profit Margin % 
  

<h4> Performance Insights </h4>

![image](https://github.com/Vandan230997/Power-BI/assets/165855297/fa202d7c-beed-4af4-aeef-f019b9574b9a)


* Purpose: To measure the performance of profits in different markets and per customer with respect to targets. Setting target helps assess the performance of markets with respect to profit margin %. Markets performing below target will be highlighted in grey.


<h3>Insights</h3>
Performed below steps to clean the data for analysis
