# 📊 Airbnb Data Analysis — Project Insights

## 1. Overview

This document summarizes the key findings obtained from the Airbnb Data Analysis project.

The analysis was performed using *Python for Exploratory Data Analysis (EDA)* and *PostgreSQL for SQL-based analysis*.

The dataset contains *226,030 Airbnb listings* across the United States.

---

# 🔍 Key Insights

## 1. Entire Homes/Apartments Dominate the Listings

The analysis of room types shows that *Entire home/apt* is the most common accommodation type.

| Room Type | Listings | Share |
|---|---:|---:|
| Entire home/apt | 154,173 | 68.21% |
| Private room | 65,887 | 29.15% |
| Shared room | 4,029 | 1.78% |
| Hotel room | 1,941 | 0.86% |

### Finding

*68.21% of all Airbnb listings are Entire home/apt*, making it the dominant accommodation category in the dataset.

Private rooms represent the second-largest category at *29.15%*, while shared rooms and hotel rooms account for a much smaller portion.

### Business Interpretation

The Airbnb marketplace in this dataset is strongly concentrated around complete-property accommodation rather than shared accommodation.

---

# 💰 2. Airbnb Prices Vary Significantly by Location

The analysis of average prices across neighbourhood groups shows substantial differences.

| Neighbourhood Group | Average Price |
|---|---:|
| Newport | 379.49 |
| Maui | 359.39 |
| Kauai | 333.38 |
| Washington | 329.87 |
| Hawaii | 270.88 |
| Honolulu | 263.83 |
| Queen Anne | 259.74 |
| Other Cities | 240.14 |
| Downtown | 227.29 |
| City of Los Angeles | 217.27 |

### Finding

*Newport has the highest average listing price among the neighbourhood groups shown, at 379.49.*

### Business Interpretation

Location appears to be an important factor when comparing Airbnb listing prices. Different neighbourhood groups show considerably different average price levels.

> Note: The dataset's price field is used as provided; the analysis does not establish a currency conversion.

---

# 🏘️ 3. Listing Distribution Is Concentrated in Certain Neighbourhoods

The analysis identified neighbourhoods with the highest number of Airbnb listings.

| Neighbourhood | Number of Listings |
|---|---:|
| Unincorporated Areas | 8,020 |
| Hollywood | 4,384 |
| Primary Urban Center | 4,179 |
| Hennepin | 3,931 |
| Kihei-Makena | 3,894 |
| Lahaina | 3,477 |
| Williamsburg | 3,411 |
| Bedford-Stuyvesant | 3,368 |
| San Jose | 2,857 |
| Harlem | 2,461 |

### Finding

*Unincorporated Areas has the highest number of listings with 8,020 listings.*

Hollywood and Primary Urban Center follow with *4,384* and *4,179* listings respectively.

### Business Interpretation

Airbnb listings are not evenly distributed across neighbourhoods. Certain areas contain significantly larger concentrations of listings.

> Note: Listing count represents the number of properties in the dataset and should not be interpreted as confirmed booking volume.

---

# 🏙️ 4. Aggregate Listed Prices Differ Across Locations

The project also analyzed the total of listing prices across neighbourhood groups.

| Neighbourhood Group | Sum of Listing Prices |
|---|---:|
| Manhattan | 3,903,927 |
| City of Los Angeles | 3,808,917 |
| Maui | 2,838,089 |
| Other Cities | 2,751,731 |
| Brooklyn | 2,210,070 |
| Honolulu | 1,665,300 |
| Hawaii | 1,348,148 |
| Kauai | 1,082,498 |

### Finding

*Manhattan has the highest aggregate listed-price total among the groups shown, followed by the City of Los Angeles.*

### Business Interpretation

A high aggregate listed-price value can result from a combination of:

- Higher individual listing prices
- A larger number of listings
- Both factors together

> Important: This is the *sum of listing prices*, not actual Airbnb revenue. The dataset does not provide enough information to calculate actual revenue or booking income.

---

# 🧹 5. Significant Missing Data Was Identified

Data-quality analysis revealed missing values in several columns.

| Column | Missing Values |
|---|---:|
| neighbourhood_group | 115,845 |
| last_review | 48,602 |
| reviews_per_month | 48,602 |
| host_name | 33 |
| name | 28 |

### Finding

neighbourhood_group has the largest amount of missing information, with *115,845 missing values*.

Review-related fields also contain a substantial number of missing values.

### Business Interpretation

Missing data is an important consideration when performing analysis because it can affect:

- Aggregations
- Visualizations
- Comparisons
- Statistical conclusions

Therefore, data-quality checks were performed before continuing with the analysis.

---

# 🧾 6. Zero-Price Listings Were Identified

The EDA identified *62 listings with a price of 0*.

These records were removed from price-based analysis because zero-price listings could distort:

- Average price
- Price distribution
- Price comparisons
- Other price-related calculations

### Finding

Data validation is important before performing pricing analysis because invalid or unusual values can significantly affect analytical results.

---

# 👤 7. Host Listing Activity

The SQL analysis examined hosts based on the number of listings they manage.

The analysis used aggregation with:

```sql
SELECT
    host_id,
    host_name,
    COUNT(*) AS listings
FROM airbnb
GROUP BY host_id, host_name
ORDER BY listings DESC
LIMIT 10