# Olist Delivery Performance Analysis

## Business problem
Customers complain about late deliveries. How bad is the problem, where is it concentrated, and what should the company do about it?

## Data
Olist Brazilian E-Commerce Public Dataset (Kaggle), about 99,000 orders from 2016 to 2018. Publicly available data; this is an independent analysis.

## Tools
SQL (SQLite, DB Browser for SQLite), spreadsheet (charts), Power BI / Tableau (dashboard, in progress)

## Method
1. Cleaned the data: kept only delivered orders with a recorded delivery date.
2. Calculated delivery KPIs: average delivery time and on-time rate (delivered on or before the estimated date).
3. Broke the late rate down by customer state and by seller.

## Data quality notes
- 96,478 orders have status "delivered"; 8 of them have no delivery date and were excluded, leaving 96,470.
- Canceled, unavailable, shipped, invoiced, processing, and created orders have no delivery outcome and were excluded.

## Key findings
1. **Overall performance:** Of 96,470 delivered orders, 91.9% arrived on or before the estimated date. Average delivery time was 12.6 days.
2. **By state:** Late deliveries are concentrated in northeastern states. Alagoas (AL) has a 23.9% late rate and Maranhão (MA) 19.7%, against an overall rate of 8.1%. São Paulo (SP), which accounts for about 42% of orders, has a 5.9% late rate but the most late orders in absolute terms (2,387).
3. **By seller:** _(to be added after Task 4)_
4. **Late delivery and reviews:** _(to be added)_

## Recommendations
_(to be written after all findings are complete)_

## Limitations
- Based on a public dataset covering 2016-2018.
- The data shows where deliveries are late, not why; causes such as distance or carrier performance are not in the data.
- States with few orders have unstable late rates.

## Files
- `sql/01_status_count.sql`: order status counts
- `sql/02_kpi_summary.sql`: overall KPIs
- `sql/03_late_by_state.sql`: late rate by state
