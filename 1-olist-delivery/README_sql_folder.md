# SQL Queries: Olist Delivery Analysis

All queries run on SQLite (DB Browser for SQLite) against the public Olist Brazilian E-Commerce dataset. Only orders with status `delivered` and a recorded delivery date are used for delivery KPIs.

| File | Question | Key SQL used |
|---|---|---|
| `01_status_count.sql` | What statuses do orders have? | `GROUP BY`, `COUNT` |
| `02_kpi_summary.sql` | How fast and how reliable is delivery overall? | `AVG`, `julianday`, `CASE WHEN` |
| `03_late_by_state.sql` | In which states are deliveries late? | `JOIN`, `GROUP BY`, `CASE WHEN` |
| `04_late_by_seller.sql` | Which sellers have the highest late rates? | `WITH` (CTE), `DISTINCT`, `HAVING` |
| `05_data_quality.sql` | Can the data be trusted? | `WHERE`, `DISTINCT`, `ORDER BY`, `LIMIT` |

## Task 1: Order status count
**Question:** How many orders are in each status?
**Result:** 96,478 orders are delivered. The rest are shipped (1,107), canceled (625), unavailable (609), invoiced (314), processing (301), and a few created or approved.
**Why it matters:** Only delivered orders have a delivery outcome, so all delivery KPIs use them.

## Task 2: KPI summary
**Question:** What are the average delivery time and on-time rate?
**Result:** 96,470 delivered orders with a delivery date, 12.6 days average delivery time, 91.9% delivered on or before the estimated date (8.1% late).

## Task 3: Late rate by state
**Question:** Where are deliveries late?
**Method:** Join orders to customers on `customer_id`, flag late orders, group by state.
**Result:** Highest late rates are in Alagoas (23.9%) and Maranhão (19.7%). São Paulo has the most orders (40,494) at 5.9% late. Rio de Janeiro has 13.5% late and 1,664 late orders.

## Task 4: Late rate by seller
**Question:** Which sellers have the highest late rates?
**Method:** A CTE builds one row per seller and order with a late flag (`DISTINCT` avoids double counting orders with several items). Sellers with fewer than 50 orders are excluded with `HAVING`.
**Result:** The worst 10 sellers have late rates of 21.2% to 30.1%, but they account for only about 3% of all late orders.

## Task 5: Data quality check
**Question:** Are there missing values, duplicates, or extreme outliers that could distort the KPIs?

**Checks run**
1. Orders with no delivery date, grouped by status. Non-delivered orders are expected to have none.
2. Delivered orders with no delivery date.
3. Row count versus unique order IDs, to detect duplicates.
4. The 10 most delayed delivered orders, to spot outliers.

**Findings**
- 8 orders have status "delivered" but no delivery date (96,478 delivered, 96,470 with a date). They are excluded from the KPIs.
- Duplicate check: _fill in total_rows and unique_orders from your result_
- Largest delay beyond the estimated date: _fill in days from your result_

**Impact on the analysis:** The exclusions are small relative to 96,470 orders, so the KPIs are not materially affected.
