# 📊 Marketing Analytics & Customer Churn Prediction

This project is a complete marketing analytics and churn prediction case study. I cleaned and explored customer data using Excel and SQL, visualized key patterns in Power BI, and built a Python model to predict customer churn.

---

## 📁 Folder Structure
```
Marketing Analytics & Customer Churn Prediction/
├── datasets/
│   ├── cleaned/                  # Cleaned CSVs for analysis
│   └── raw/                      # Raw dataset before cleaning
│
├── notebooks/
│   └── churn_prediction_model.ipynb   # Python notebook for ML model
│
├── sql_scripts/
│   └── SQL_script.sql                # SQL queries for analysis
│
├── reports/
│   ├── Data_Quality_Report.docx
│   ├── Descriptive_Analytics_Report.xlsx
│   └── initial_insights.docx
│
├── dashboards/
│   ├── Marketing Analytics Dashboard.pbix
│   └── giphy.gif                      # Dashboard preview animation
```

---

## 🛠️ Tools Used
- **SQL (MySQL)** – data analysis
- **Excel** – cleaning, formulas, PivotTables
- **Power BI** – dashboard building
- **Python (scikit-learn)** – churn prediction

---

## ✅ What I Did in This Project

### 1. 🔹 Data Cleaning
- Fixed wrong registration dates (like "15:20.8") to proper datetime format
- Checked for missing values and fixed invalid click rates
- Removed outliers in `TotalSpent` and `NumberOfOrders`
- Added logic checks: `email_clicks <= email_opens`

📄 Report: `Data_Quality_Report.docx`

---

### 2. 🔹 Excel-Based Analysis
- Calculated KPIs: average order value, churn %, spend by channel
- Created PivotTables by segment and channel
- Built summary charts: bar, pie, histogram

📄 File: `Descriptive_Analytics_Report.xlsx`

---

### 3. 🔹 RFM Segmentation (Excel)
- Scored customers using:
  - Recency (days since last purchase)
  - Frequency (number of orders)
  - Monetary (total spent)
- Labeled customers: Loyal, At Risk, Potential Loyalists, etc.

Used this to enhance churn analysis.

---

### 4. 🔹 SQL Business Insights
Answered key questions:
- Which acquisition channel brings most users?
- What’s the average spend per segment?
- Who hasn’t purchased in 90+ days?
- Gender-wise spend patterns
- Campaign ROI (spend vs click rate)

📄 File: `SQL_script.sql`

---

### 5. 🔹 Power BI Dashboard
- KPIs: Revenue, Orders, Avg Spend
- Filters: Country, Segment, Gender
- Charts: Ad click rate, Email campaign performance, Top channels

📁 File: `Marketing Analytics Dashboard.pbix`
### 📊 Power BI Dashboard
![Dashboard Screenshot](images/powerbi_dashboard.png)

---

### 6. 🔹 Churn Prediction (Machine Learning)
- Used Random Forest and Logistic Regression
- Input features:
  - total_spent, avg_order_value, number_of_orders, days_since_last_purchase
- Output: `churned` (1 = yes, 0 = no)

🎯 Result:
- Random Forest performed better for catching churners
- Accuracy: 87%
- Key feature: Days since last purchase

📄 File: `churn_prediction_model.ipynb`

---

## 📌 Insights Summary (from `initial_insights.docx`)
- **Google Ads** brought the most customers (3,044)
- **High Value** customers spend ₹715 on average
- 130+ customers inactive for 90+ days – at churn risk
- Gender spending is similar across Male, Female, Other
- Few customers bring ₹1000+/click ROI → focus on them

---

## 🎓 What I Learned
- Cleaned real-world data from scratch
- Explored business KPIs using Excel + SQL
- Built dashboards with Power BI filters and cards
- Created churn prediction model in Python
- Structured the full project for GitHub and resume

---

Thanks for reading! This project shows how we can go from raw data to insights to predictions - in a clean, end-to-end process.

