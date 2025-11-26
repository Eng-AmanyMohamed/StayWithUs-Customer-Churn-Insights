# 📊 StayWithUs-Customer-Churn-Insights
**This is the graduation project for the Data Engineer Track at DEPI (Digital Egypt Pioneers Initiative)**

### 🎯 Project Overview

Customer churn—when customers stop using a company’s product or service—is a major challenge impacting revenue and growth. 
StayWithUs is an end-to-end data engineering and machine learning project that leverages historical customer data to predict churn risk and empower businesses with actionable retention strategies.
By combining exploratory data analysis, predictive modeling, and strategic insights, this project transforms raw customer data into a powerful tool for reducing attrition and enhancing customer lifetime value.

---
### 🧩 Key Objectives
- Perform Exploratory Data Analysis (EDA) to uncover behavioral patterns linked to churn.
- Preprocess and clean customer data for modeling.
- Build and evaluate a classification model (Logistic Regression, Random Forest, or XGBoost) to predict churn.
- Deploy the model via a user-friendly interface (Flask app).
- Recommend targeted retention strategies based on model insights.

---
### 📊 Milestone 1: Data Collection, Exploration & Preprocessing
- Collected and loaded the Telecome Customer Churn dataset (7,050 rows, 33 columns).
- Performed EDA to uncover churn patterns (e.g., by contract type, tenure, payment method).
- Handled missing values, removed duplicates, and validated data quality.
- Encoded categorical features and scaled numerical ones to produce a modeling-ready dataset.

---

### 🤖 Milestone 2: Predictive Model Development
- Trained and compared classifiers (Logistic Regression, Random Forest, XGBoost).
- Used stratified train/test split to address class imbalance.
- Evaluated models using Accuracy, Precision, Recall, F1, and ROC-AUC—prioritizing Recall.
- Extracted feature importance to explain key churn drivers (contract, tenure).

---

### 🚀 Milestone 3: Deployment & Retention Strategy
- Built a Flask app with a user-friendly interface for real-time churn predictions.
- Translated model insights into actionable retention tactics (e.g., discounts, support outreach).
- Delivered a comprehensive retention strategy report aligned with stakeholder needs.
- Prepared final demo, presentation, and documentation for end-to-end project handover.

---
## 🛠️ Technologies & Tools Used

| Category       | Technology |
|----------------|----------|
| Language           | Python |
| Data Processing    | Pandas, NumPy |
| Visualization      | Matplotlib, Seaborn |
| Machine Learning   | Scikit-learn |
| Model Evaluation   | Accuracy, Precision, Recall |
| Deployment         | Flask |
| Version Control    | Git, GitHub  |
| Documentation      | Jupyter Notebooks, Markdown, PowerPoint  |

---

## 🗂️ Project Structure
```
staywithus-Customer-churn-insights/
│
├── RawData/                    # Raw and cleaned datasets
│   ├── Telco_customer_churn.xls
│   ├── Encoded_cleaned_customer_churn.xls
│   └── cleaned_customer_churn.xls
│
├── notebooks/               # Jupyter notebooks for EDA and modeling
│   ├── M1 DataCleaning.ipynb
|   ├── M1 DataCleaning encoded for ML.ipynb
│   └── 02_model_training.ipynb
│
├── src/                     # Source code
│   ├── preprocessing.py
│   ├── model.py
│   └── app.py               # Flask deployment
│
├── reports/                 # Summary insights and evaluation metrics
│   ├── eda_summary.pdf
│   └── model_evaluation.pdf
│
├── requirements.txt         # Python dependencies
```
---
## 👥 Team Members
- Abdullah Ashraf Elsayed 
- Abdalla Hamdi Hussein
- Amany Mohamed Hussein
- Shimaa Alaa Gomaa
- Rawan Hossam Said

