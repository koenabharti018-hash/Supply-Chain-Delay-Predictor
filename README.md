# 📦 Supply Chain Delay Predictor

A data analytics project exploring why deliveries get delayed — and building a model to predict them before they happen.

---

## 🧩 The Problem

Late deliveries are one of the most common pain points in supply chain management, but they're rarely random. There are patterns — certain shipping modes, regions, and order types that consistently underperform. This project digs into 180,000+ real supply chain records to find those patterns and predict which orders are likely to arrive late.

---

## 🛠️ Tools Used

- **SQL (SSMS)** — for slicing and querying the raw data
- **Python** — Pandas for data cleaning, Scikit-learn for building the prediction model
- **Power BI** — for building an interactive dashboard to visualize delay trends

---

## 🔍 What I Found

- **Standard Class shipping** had the highest delay rate among all shipping modes.
- The **top 3 high-risk regions** for delays were (serial-wise) **Central Africa, South Asia and East Africa.**
- A **logistic regression model** was trained to predict late deliveries and achieved **97.49% accuracy** on test data

---

## 📂 What's in This Repo

| File | What it contains |
|------|-----------------|
| `supply_chain_analysis.ipynb` | Full Python notebook — data cleaning, EDA, and the ML model |
| `SQL_queries.sql` | The 4 SQL queries used to explore and aggregate the data |
| `dashboard_screenshot.png` | A preview of the Power BI dashboard |

---

## 💡 Why This Project

I built this as part of my data analytics portfolio to practice working with large datasets end-to-end — from raw SQL queries all the way to a predictive model and a business-ready dashboard. Supply chain is a domain where data can have real operational impact, which made it a genuinely interesting problem to work through.

---

*Built with SQL, Python, and Power BI | Dataset: [kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis]*
