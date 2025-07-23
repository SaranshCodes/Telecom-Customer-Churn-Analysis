# Telecom-Customer-Churn-Analysis

## Project Objective
To analyze customer behavior and identify key patterns related to churn using historical data. The aim is to help businesses reduce customer attrition through data-driven decisions.

## Tools & Technologies
SQL — Structured queries for analysis and segmentation
Python — Data cleaning & exploratory analysis using pandas, matplotlib and seaborn
Power BI — Visual analytics & interactive dashboard
Jupyter Notebook — Code execution environment
Power BI Desktop — Report & dashboard creation

## Process Workflow
1. SQL Analysis (MySQL):
Data exploration
Filtering and joins
Churn-based segmentation

2.Python Preprocessing:
Missing value treatment
Data formatting & transformation
Exporting cleaned dataset for Power BI

3.Power BI Dashboard:
Card KPIs, clustered column charts, pie charts
Tenure vs Churn trends
Slicers for interactive filtering

## SQL Analysis
Structured into 3 parts:

1. General Customer Overview
- Total customers
- Distribution by gender, city, and internet service
- Monthly charge stats

2. Customer Profile by Status
- Active vs Churned customer behavior
- Contract types & payment method breakdown
- Age group and internet service usage patterns

3. Churn-Specific Analysis
- Top reasons for churn
- Tenure and charges of churned customers
- Churn distribution by demographic & service factors

## Python Analysis
- Cleaned and standardized column names
- Converted relevant columns to numeric/categorical formats
- Visualized churn rates by features like contract type, age group, and monthly charges (for validation before Power BI)
  
## Power BI Dashboard
- KPI Cards: Total customers, churned customers, churn rate, etc.
- Top 10 Churn Reasons: Pie chart for quick visual reference
- Churn by Contract Type: Clustered column chart
- Churn vs Tenure and Monthly Charges: Line + bar combo chart
- Customer Status Breakdown
- Slicers: Gender, City, Internet Type, Age Group for dynamic filtering
- One-Page Layout: Clean, focused, and interactive

## Key Insights
- Month-to-month contracts show higher churn rates
- Customers with fiber optics and higher monthly charges churn more
- Electronic check users show increased churn tendency
- Tenure plays a vital role — churn reduces with longer tenure
- DSL users churn less compared to fiber users
  
## Conclusion
- This project effectively combines SQL, Python, and Power BI to derive business-relevant insights from churn data. It highlights patterns that can support strategic decision-making, customer retention plans, and revenue protection.

## Created by
**Saransh Umrao**
