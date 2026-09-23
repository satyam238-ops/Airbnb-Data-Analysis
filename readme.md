# 🏠 Airbnb Data Analysis — Python & SQL

## 📌 Project Overview

This project analyzes Airbnb listing data to understand *pricing, room types, neighbourhoods, hosts, reviews, and availability*.

The project follows a complete data analytics workflow:

*Raw Data → Python EDA → Data Cleaning → PostgreSQL → SQL Analysis → Business Insights*

The main objective is to explore the Airbnb market and identify meaningful patterns using Python for exploratory analysis and SQL for structured analytical queries.

---

## 🎯 Project Objectives

The analysis focuses on:

- Understanding the distribution of Airbnb listings
- Analyzing prices across different room types
- Comparing neighbourhood-level pricing
- Identifying hosts with a large number of listings
- Studying review patterns
- Analyzing listing availability
- Comparing different room types and their characteristics
- Ranking neighbourhoods using SQL window functions
- Practicing real-world SQL analytical techniques

---

## 📂 Dataset

*Dataset:* AB_US_2020.csv

The dataset contains Airbnb listing information including:

- id
- name
- host_id
- host_name
- neighbourhood_group
- neighbourhood
- latitude
- longitude
- room_type
- price
- minimum_nights
- number_of_reviews
- last_review
- reviews_per_month
- calculated_host_listings_count
- availability_365
- city
- month

The cleaned dataset is also saved as:

airbnb_cleaned.csv

---

# 🐍 Python Exploratory Data Analysis

Python was used for the initial exploration and preparation of the dataset.

### Key EDA Activities

- Loaded and inspected the Airbnb dataset
- Checked dataset structure and column information
- Examined data types
- Identified missing values
- Investigated numerical and categorical variables
- Analyzed price distribution
- Explored room-type distribution
- Examined review-related variables
- Studied availability patterns
- Investigated relationships between important variables
- Performed data cleaning and preparation for further analysis

### Python Libraries

- Pandas
- NumPy
- Matplotlib
- Seaborn

The complete Python analysis is available in:

Air_Bnb_EDA.ipynb

---

# 🛢️ SQL Analysis

After the Python EDA, the cleaned Airbnb data was loaded into *PostgreSQL* for deeper analytical querying.

### SQL Analysis Performed

#### 1. Listing Distribution

Analyzed the number of Airbnb listings across different:

- Cities
- Neighbourhoods
- Room types

#### 2. Room Type Analysis

Compared room types based on:

- Number of listings
- Average price
- Average number of reviews
- Average monthly reviews

#### 3. Neighbourhood Analysis

Analyzed neighbourhoods based on:

- Number of listings
- Average price
- Listing distribution

Neighbourhoods were also ranked within cities using SQL window functions.

#### 4. Host Analysis

Identified hosts with a high number of Airbnb listings and examined host-level listing patterns.

#### 5. Pricing Analysis

Used aggregation functions to analyze:

- Average prices
- Price differences between neighbourhoods
- Price differences between room types

#### 6. Review Analysis

Explored:

- Number of reviews
- Reviews per month
- Relationship between listing characteristics and reviews

#### 7. Availability Analysis

Analyzed availability_365 to understand how frequently listings are available throughout the year.

---

# 🧠 SQL Concepts Used

This project helped apply practical SQL concepts including:

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- COUNT()
- AVG()
- MAX()
- MIN()
- ROUND()
- Aggregate functions
- Subqueries
- CTEs
- Window functions
- RANK()
- ROW_NUMBER()
- PARTITION BY
- JOIN concepts
- Conditional filtering
- Data aggregation

Example of neighbourhood ranking:

```sql
RANK() OVER (
    PARTITION BY city
    ORDER BY AVG(price) DESC
)

## 👨‍💻 Author

*Satyam*

Aspiring Data Analyst | Python | SQL | Power BI | Excel

🔗 *GitHub:* [satyam238-ops](https://github.com/satyam238-ops)

🔗 *LinkedIn:* [Satyam Chaurasia](https://www.linkedin.com/in/satyam-chaurasia/)