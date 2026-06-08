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

- **Standard Class shipping** had the highest delay rate among all shipping modes — roughly XX% of orders arrived late
- The **top 3 high-risk regions** for delays were [your findings here]
- A **logistic regression model** was trained to predict late deliveries and achieved **XX% accuracy** on test data

> *(Update the XX% values once you finalize your model results)*

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

## 🚀 How to Run the Notebook

1. Clone this repository
2. Install dependencies: `pip install pandas scikit-learn matplotlib seaborn`
3. Open `supply_chain_analysis.ipynb` in Jupyter or VS Code
4. Run all cells from top to bottom

---

*Built with SQL, Python, and Power BI | Dataset: [add source if public]*
