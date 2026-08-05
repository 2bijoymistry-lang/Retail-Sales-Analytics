# Retail Sales Analytics Dashboard

An interactive Power BI dashboard that consolidates customer, order, product, and transaction data into a single executive reporting layer — built to replace manual, spreadsheet-based sales reporting with a governed, self-service BI solution.

**[View the full case study →](./Retail_Sales_Analytics_Case_Study.pdf)**

## Overview

Retail organizations generate high transaction volumes across products, customers, payment methods, and regions. Without a centralized reporting layer, teams fall back on manual spreadsheets — leading to inconsistent numbers, delayed insight, and duplicated effort. This project builds a star-schema data model and a centralized DAX measure library in Power BI to give stakeholders a single, trusted, interactive view of sales performance.

## Key Features

- Executive KPI summary — Total Sales, Total Orders, Total Customers, Quantity Sold, Average Order Value
- Monthly sales trend analysis
- Regional sales comparison
- Category-wise sales breakdown
- Customer distribution by state
- Payment mode analysis
- Fully cross-filtered, slicer-driven interactivity (Year, Quarter, Month, Category, Payment Mode)

## Tech Stack

| Layer | Tools |
|---|---|
| Data preparation & exploration | Excel, Python (Pandas, NumPy, Matplotlib, Seaborn), Google Colab |
| Querying & validation | SQL |
| ETL / transformation | Power Query |
| Data modeling | Power BI (Star Schema) |
| Business logic | DAX |
| Presentation | Power BI Desktop / Service |

## Data Model

Star schema with four dimension tables (`Customers`, `Products`, `Calendar`, and the order header `Orders`) surrounding a central fact table (`Order_Details`), plus a disconnected `KPI Measures` table hosting the centralized DAX library.

```
Customers ──▶ Orders ──▶ Order_Details ◀── Products
                 ▲
                 │
             Calendar
```

| From | To | Cardinality |
|---|---|---|
| Customers.CustomerID | Orders.CustomerID | One-to-Many |
| Orders.OrderID | Order_Details.OrderID | One-to-Many |
| Products.ProductID | Order_Details.ProductID | One-to-Many |
| Calendar.Date | Orders.OrderDate | One-to-Many |

## Core DAX Measures

```dax
Total Sales = SUM(Order_Details[Net Sales])

Total Orders = DISTINCTCOUNT(Orders[OrderID])

Total Customers = DISTINCTCOUNT(Customers[CustomerID])

Total Quantity Sold = SUM(Order_Details[Quantity])

Average Order Value = DIVIDE([Total Sales], [Total Orders])
```

## Repository Structure

```
├── Retail_Sales_Analytics_Case_Study.pdf   # Full BI case study (BRD, data model, DAX, insights)
├── Retail_Sales_Analytics.pbix             # Power BI source file
├── /screenshots                            # Dashboard preview images
└── README.md
```

## Business Insights (Sample)

- Category mix is well balanced — Furniture leads at ~27% of total sales, followed closely by Grocery and Clothing, indicating no single-category dependency.
- Payment mode adoption is evenly spread across Net Banking, Credit Card, Cash, Debit Card, and UPI.
- Maharashtra, Delhi, and Tamil Nadu are the top three states by customer count, suggesting priority markets for retention campaigns.

Full analysis and recommendations are in the [case study](./Retail_Sales_Analytics_Case_Study.pdf).

## Known Limitations & Next Steps

- Row-level security (RLS) is not yet configured.
- Time Intelligence measures (YTD, YoY) are documented but not yet implemented, pending marking the Calendar table as an official date table.
- Static data extract; no live/scheduled refresh configured in this phase.

## Author

**Bijoy Mistry** — Business Intelligence Developer | Data Analyst | Power BI Developer
