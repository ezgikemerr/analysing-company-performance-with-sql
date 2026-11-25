# Analysing Company Performance with SQL

## Project overview

Northwind Traders is a company that deals with specially food products imported and exported worldwide. This project evaluates the company’s operational and strategic effectiveness while providing actionable insights to support data-driven decision-making. This project shows a comprehensive analysis of Northwind Traders’ performance focusing on sales, product, pricing and logistic strategies using retrospective data. 

 Its catalogue shows what customers can buy today, while its order lines record the prices, quantities and discounts on past sales. This project uses **PostgreSQL** to connect those two views and answer ten questions for the Product, Pricing, Logistics, HR and Sales teams.

The analysis follows three parts of the business: how products are priced, how orders and stock are managed, and how employees contribute to sales. Each query uses the level of detail its question requires. For example, the shipping analysis counts each order once, while the sales analysis starts with individual order lines so discounts are applied to the right quantities.

## How to run the queries locally

### 1. Clone the repository

On this repository’s GitHub page, click **Code → HTTPS** and copy the URL. Replace `<repository-url>` below with that URL, then run:

```bash
git clone https://github.com/ezgikemerr/analysing-company-performance-with-sql.git
cd analysing-company-performance-with-sql
```

You can now open `analysis.md` to explore the findings and figures. To run the SQL queries yourself, continue with the database setup below. You can read the full analysis and view the figures directly on GitHub. Running the SQL requires a populated Northwind PostgreSQL database. The original assignment dataset is not distributed with this repository.

## Key findings

| Area | Finding |
| --- | --- |
| Product pricing | Tarte au sucre was the most expensive active product in the $20–$50 band at **$49.30**. |
| Dispatch | Among qualifying destinations in 1998, Sweden had the longest average time to dispatch at **13.29 days**, compared with **5.38 days** for Germany. |
| Freight | April 1998 led the qualifying months with **74 orders** and approximately **$6,394** in freight. |
| Sales | **Beverages** generated the most net sales overall. **Margaret Peacock** led employee sales within that category. |

[Explore the detailed findings and figures in analysis.md](analysis.md)

## Business questions and SQL approach

| Query | Business question | What the query does |
| --- | --- | --- |
| [Q1](analysis.md#q1) | Which active products cost $20–$50? | Filters the catalogue on availability and inclusive price limits, then ranks products by price. |
| [Q2](analysis.md#q2) | Which destinations took at least five days on average to dispatch in 1998? | Calculates average dispatch time and counts distinct orders by destination, retaining countries with more than ten orders. |
| [Q3](analysis.md#q3) | How old was each employee at hire, and who manages them? | Calculates completed years at hire and joins each employee to their manager. |
| [Q4](analysis.md#q4) | Which busy months had the highest freight charges? | Groups 1997–1998 orders by month and ranks months with more than 35 orders by total freight. |
| [Q5](analysis.md#q5) | Which products fall outside the 20–30% price-change band? | Compares catalogue prices with average historical order-line prices and flags changes outside the band. |
| [Q6](analysis.md#q6) | Which price bands drive sales in each category? | Groups products by catalogue price band and calculates net sales and distinct orders. |
| [Q7](analysis.md#q7) | Where is inventory held, and how much is on order? | Aggregates stock, units on order and reorder thresholds by category and supplier region. |
| [Q8](analysis.md#q8) | How does each active product compare with its category? | Calculates the category mean and median and labels each product against both benchmarks. |
| [Q9](analysis.md#q9) | How do employees compare on sales, order value and discounting? | Aggregates order lines by employee and ranks employees by net sales. |
| [Q10](analysis.md#q10) | Which categories matter most to each employee and to the company? | Calculates employee–category net sales as a share of both employee sales and company sales. |

## Repository structure

```text
analysing-company-performance-with-sql/
├── image/         # Charts and figures used in analysis.md
├── query/         # PostgreSQL scripts for the ten business questions
├── results/       # Query results exported as CSV files
├── analysis.md    # Detailed findings and figures for each question
└── README.md      # Project overview, key findings and setup instructions
```







