# Gallstone Dataset Analysis SQL Project

## Project Overview

**Project Title:** Gallstone Dataset Analysis
**Level:** Beginner
**Database:** gallstone_db (example - adjust to your actual database name)

This project demonstrates SQL skills and techniques for exploring and analyzing a dataset related to gallstone presence and various patient characteristics. The project involves setting up a database (if needed), performing data exploration, and answering specific questions through SQL queries to understand potential relationships and risk factors. This project is suitable for individuals starting their journey in data analysis and seeking to apply SQL to healthcare-related data.

## Objectives

*   **Database Setup:** Create and populate a database with the gallstone dataset (if you're starting from raw data).
*   **Data Exploration:** Perform initial data exploration to understand the structure and content of the dataset.
*   **Data Cleaning:** Identify and address any data quality issues (e.g., missing values, inconsistencies).
*   **Relationship Analysis:** Use SQL to investigate potential relationships between patient characteristics and gallstone presence.

## Project Structure

### 1. Database Setup

*   **Database Creation:** (If necessary) Create a database to house the gallstone data.  Example: `CREATE DATABASE gallstone_db;`
*   **Table Creation:** Create a table named `gallstone_data` to store the patient information.  The table structure includes columns for Gallstone Status, Age, Gender, Comorbidity, and other relevant features.

```sql
CREATE TABLE gallstone_data (
    Gallstone_Status INT,
    Age INT,
    Gender VARCHAR(10),
    Comorbidity VARCHAR(50),
    `Coronary Artery Disease (CAD)` INT,
    Hypothyroidism INT,
    Hyperlipidemia INT,
    `Diabetes Mellitus (DM)` INT,
    Height INT,
    Weight FLOAT,
    `Body Mass Index (BMI)` FLOAT,
    TBW FLOAT,
    ECW FLOAT,
    ICW FLOAT,
    `Extracellular Fluid/Total Body Water (ECF/TBW)` FLOAT,
    `Total Body Fat Ratio (TBFR)` FLOAT,
    `Lean Mass (LM)` FLOAT,
    `Body Protein Content (Protein)` FLOAT,
    VFR INT,
    `Bone Mass (BM)` FLOAT,
    `Muscle Mass (MM)` FLOAT,
    Obesity FLOAT,
    `Total Fat Content (TFC)` FLOAT,
    VFA FLOAT,
    `Visceral Muscle Area (VMA)` FLOAT,
    `Hepatic Fat Accumulation (HFA)` VARCHAR(50),
    Glucose FLOAT,
    `Total Cholesterol (TC)` FLOAT,
    `Low Density Lipoprotein (LDL)` FLOAT,
    `High Density Lipoprotein (HDL)` FLOAT,
    Triglyceride FLOAT,
    AST FLOAT,
    ALT FLOAT,
    ALP FLOAT,
    Creatinine FLOAT,
    GFR FLOAT,
    CRP FLOAT,
    HGB FLOAT,
    `Vitamin D` FLOAT
);
```

### 2. Data Exploration & Cleaning
*   **Record Count:** Determine the total number of records in the dataset.
*   **Unique Values:** Investigate unique values in categorical columns (e.g., Gender, Comorbidity).
*   **Missing Value Check:** Identify any columns with missing values.

```sql
SELECT COUNT(*) FROM gallstone_data;

SELECT DISTINCT Gender FROM gallstone_data;
SELECT DISTINCT Comorbidity FROM gallstone_data;
-- Add more SELECT DISTINCT for other categorical columns

SELECT
    COUNT(*) AS total_records,
    COUNT(Gallstone_Status) AS Gallstone_Status_count,
    COUNT(Age) AS Age_count,
    COUNT(Gender) AS Gender_count,
    COUNT(Comorbidity) AS Comorbidity_count,
    COUNT(`Coronary Artery Disease (CAD)`) AS CAD_count,
    COUNT(Hypothyroidism) AS Hypothyroidism_count,
    COUNT(Hyperlipidemia) AS Hyperlipidemia_count,
    COUNT(`Diabetes Mellitus (DM)`) AS DM_count,
    COUNT(Height) AS Height_count,
    COUNT(Weight) AS Weight_count,
    COUNT(`Body Mass Index (BMI)`) AS BMI_count,
    COUNT(TBW) AS TBW_count,
    COUNT(ECW) AS ECW_count,
    COUNT(ICW) AS ICW_count,
    COUNT(`Extracellular Fluid/Total Body Water (ECF/TBW)`) AS ECF_TBW_count,
    COUNT(`Total Body Fat Ratio (TBFR)`) AS TBFR_count,
    COUNT(`Lean Mass (LM)`) AS LM_count,
    COUNT(`Body Protein Content (Protein)`) AS Protein_count,
    COUNT(VFR) AS VFR_count,
    COUNT(`Bone Mass (BM)`) AS BM_count,
    COUNT(`Muscle Mass (MM)`) AS MM_count,
    COUNT(Obesity) AS Obesity_count,
    COUNT(`Total Fat Content (TFC)`) AS TFC_count,
    COUNT(VFA) AS VFA_count,
    COUNT(`Visceral Muscle Area (VMA)`) AS VMA_count,
    COUNT(`Hepatic Fat Accumulation (HFA)`) AS HFA_count,
    COUNT(Glucose) AS Glucose_count,
    COUNT(`Total Cholesterol (TC)`) AS TC_count,
    COUNT(`Low Density Lipoprotein (LDL)`) AS LDL_count,
    COUNT(`High Density Lipoprotein (HDL)`) AS HDL_count,
    COUNT(Triglyceride) AS Triglyceride_count,
    COUNT(AST) AS AST_count,
    COUNT(ALT) AS ALT_count,
    COUNT(ALP) AS ALP_count,
    COUNT(Creatinine) AS Creatinine_count,
    COUNT(GFR) AS GFR_count,
    COUNT(CRP) AS CRP_count,
    COUNT(HGB) AS HGB_count,
    COUNT(`Vitamin D`) AS VitaminD_count
FROM gallstone_data;

--If there are missing values, you might decide to delete the rows with missing values
--DELETE FROM gallstone_data WHERE column_name IS NULL; --Replace column_name with the actual column that has missing values

```
### 3 Data Analysis & Findings
The following SQL queries were developed to answer specific questions about the gallstone dataset:

**3.1. Basic Descriptive Statistics**
```sql
SELECT
    COUNT(*) AS total_patients,  -- Total number of patients in the dataset
    AVG(Age) AS average_age,      -- Average age of patients
    MIN(Age) AS min_age,          -- Minimum age of patients
    MAX(Age) AS max_age,          -- Maximum age of patients
    AVG(`Body Mass Index (BMI)`) AS average_bmi,      -- Average BMI of patients
    MIN(`Body Mass Index (BMI)`) AS min_bmi,          -- Minimum BMI of patients
    MAX(`Body Mass Index (BMI)`) AS max_bmi,          -- Maximum BMI of patients
    AVG(Glucose) AS average_glucose, -- Average glucose level of patients
    MIN(Glucose) AS min_glucose,  -- Minimum glucose level of patients
    MAX(Glucose) AS max_glucose   -- Maximum glucose level of patients
FROM
    gallstone_data;
```
**Explanation**
* `total_patients`: The total number of patients in the dataset
* `average_age`: The average age of the patients.
* `min_age`: The minimum age of the patients.
* `max_age`: The maximum age of the patients.
* `average_bmi`: The average Body Mass Index (BMI) of the patients.
* `min_bmi`: The minimum BMI of the patients.
* `max_bmi`: The maximum BMI of the patients.
* `average_glucose`: The average glucose level of the patients.
* `min_glucose`: The minimum glucose level of the patients.
* `max_glucose`: The maximum glucose level of the patients.

**3.2. Gallstone Prevalence by Gender**
```sql
SELECT
    Gender,                                                                 -- Gender of the patient
    COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones
    COUNT(CASE WHEN `Gallstone Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones
    (COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence
FROM
    gallstone_data
GROUP BY
    Gender;
```
**Explanation:**
This query calculates the prevalence of gallstones based on gender:
* It groups the data by `Gender`.
* `gallstone_present`: Counts the number of patients with gallstones (`Gallstone Status` = 1) for each gender.
* `gallstone_absent`: Counts the number of patients without gallstones (`Gallstone Status` = 0) for each gender.

**3.3. Relationship between Age and Gallstone Status**
```sql
SELECT
    `Gallstone Status`,              -- Gallstone status (1 = present, 0 = absent)
    AVG(Age) AS average_age         -- Average age for each group
FROM
    gallstone_data
GROUP BY
    `Gallstone Status`;
```
**Explanation**
This query examines the relationship between age and gallstone status:
* It groups the data by `Gallstone Status`.
* `average_age`: Calculates the average age of patients for each gallstone status group (present or absent).

**3.4. Gallstone Prevalence by Comorbidity**
```sql
SELECT
    Comorbidity,                                                              -- Type of comorbidity
    COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones and this comorbidity
    COUNT(CASE WHEN `Gallstone Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones and this comorbidity
    (COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence for this comorbidity
FROM
    gallstone_data
GROUP BY
    Comorbidity
ORDER BY
    prevalence_percentage DESC;  -- Ordered by highest prevalence
```
**Explanation**:

This query calculates the prevalence of gallstones based on different comorbidities:
* It groups the data by `Comorbidity`.
* `gallstone_present`: Counts the number of patients with gallstones for each comorbidity.
* `gallstone_absent`: Counts the number of patients without gallstones for each comorbidity.
* `prevalence_percentage`: Calculates the percentage of patients with gallstones for each comorbidity, ordered in descending order to show the most prevalent comorbidities first.


**3.5. Analysis for Binary Comorbidities (CAD, Hypothyroidism, Hyperlipidemia, DM)**
**SQL Query (for Coronary Artery Disease (CAD))**:
```sql
SELECT
    `Coronary Artery Disease (CAD)`,                                                                 -- CAD status (1 = present, 0 = absent)
    COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones and CAD
    COUNT(CASE WHEN `Gallstone Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones and CAD
    (COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence for CAD
FROM
    gallstone_data
GROUP BY
    `Coronary Artery Disease (CAD)`;
```
**Explanation**:

This query analyzes the relationship between Coronary Artery Disease (CAD) and gallstone status:
* It groups the data by `Coronary Artery Disease (CAD)`.
* `gallstone_present`: Counts the number of patients with gallstones for each CAD status (0 or 1).
* `gallstone_absent`: Counts the number of patients without gallstones for each CAD status.
* `prevalence_percentage`: Calculates the percentage of patients with gallstones for each CAD status.

**SQL Query (for Hypothyroidism)**:
```sql
SELECT
    Hypothyroidism,                                                                 -- Hypothyroidism status (1 = present, 0 = absent)
    COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones and Hypothyroidism
    COUNT(CASE WHEN `Gallstone Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones and Hypothyroidism
    (COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence for Hypothyroidism
FROM
    gallstone_data
GROUP BY
    Hypothyroidism;
```
**Explanation**:
This query analyzes the relationship between Hypothyroidism and gallstone status:
* It groups the data by `Hypothyroidism`.
* `gallstone_present`: Counts the number of patients with gallstones for each Hypothyroidism status (0 or 1).
* `gallstone_absent`: Counts the number of patients without gallstones for each Hypothyroidism status.
* `prevalence_percentage`: Calculates the percentage of patients with gallstones for each Hypothyroidism status.

**SQL Query (for Hyperlipidemia)**:
```sql
SELECT
    Hyperlipidemia,                                                                 -- Hyperlipidemia status (1 = present, 0 = absent)
    COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones and Hyperlipidemia
    COUNT(CASE WHEN `Gallstone Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones and Hyperlipidemia
    (COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence for Hyperlipidemia
FROM
    gallstone_data
GROUP BY
    Hyperlipidemia;
```
**Explanation**:
This query analyzes the relationship between Hyperlipidemia and gallstone status:
* It groups the data by `Hyperlipidemia`.
* `gallstone_present`: Counts the number of patients with gallstones for each Hyperlipidemia status (0 or 1).
* `gallstone_absent`: Counts the number of patients without gallstones for each Hyperlipidemia status.
* `prevalence_percentage`: Calculates the percentage of patients with gallstones for each Hyperlipidemia status.

**SQL Query (for Diabetes Mellitus (DM))**
```sql
SELECT
    `Diabetes Mellitus (DM)`,                                                                 -- Diabetes Mellitus (DM) status (1 = present, 0 = absent)
    COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones and Diabetes Mellitus (DM)
    COUNT(CASE WHEN `Gallstone Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones and Diabetes Mellitus (DM)
    (COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence for Diabetes Mellitus (DM)
FROM
    gallstone_data
GROUP BY
    `Diabetes Mellitus (DM)`;
```
**Explanation**:

This query analyzes the relationship between Diabetes Mellitus (DM) and gallstone status:
* It groups the data by `Diabetes Mellitus (DM)`.
* `gallstone_present`: Counts the number of patients with gallstones for each Diabetes Mellitus (DM) status (0 or 1).
* `gallstone_absent`: Counts the number of patients without gallstones for each Diabetes Mellitus (DM) status.
* `prevalence_percentage`: Calculates the percentage of patients with gallstones for each Diabetes Mellitus (DM) status.

**3.6. Relationship between BMI and Gallstone Status**
```sql
SELECT
    CASE
        WHEN `Body Mass Index (BMI)` < 18.5 THEN 'Underweight'
        WHEN `Body Mass Index (BMI)` >= 18.5 AND `Body Mass Index (BMI)` < 25 THEN 'Normal weight'
        WHEN `Body Mass Index (BMI)` >= 25 AND `Body Mass Index (BMI)` < 30 THEN 'Overweight'
        WHEN `Body Mass Index (BMI)` >= 30 THEN 'Obese'
        ELSE 'Unknown'
    END AS bmi_category,                                                      -- BMI category
    COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones in this category
    COUNT(CASE WHEN `Gallstone Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones in this category
    (COUNT(CASE WHEN `Gallstone Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence in this category
FROM
    gallstone_data
GROUP BY
    bmi_category
ORDER BY
    prevalence_percentage DESC;  -- Ordered by highest prevalence
```
**Explanation**:
This query examines the relationship between BMI category and gallstone status:
* It creates BMI categories (Underweight, Normal weight, Overweight, Obese) using a `CASE` statement.
* It groups the data by the calculated `bmi_category`.
* `gallstone_present`: Counts the number of patients with gallstones in each BMI category.
* `gallstone_absent`: Counts the number of patients without gallstones in each BMI category.
* `prevalence_percentage`: Calculates the percentage of patients with gallstones in each BMI category, ordered in descending order to show the categories with the highest prevalence first.

## Findings
**1. Coronary Artery Disease (CAD):** The analysis suggests a potentially lower gallstone prevalence among individuals with CAD (approximately 25.00%) compared to those without CAD (approximately 50.49%). However, it is crucial to acknowledge the limited sample size within the CAD group, which necessitates a cautious interpretation of this finding. Further statistical validation is required to confirm the significance of this observation.

**2. Hypothyroidism:** Similarly, the analysis indicates a potentially lower gallstone prevalence among individuals with Hypothyroidism (approximately 33.33%) compared to those without Hypothyroidism (approximately 50.00%). As with the CAD finding, the small sample size for the Hypothyroidism group warrants caution. Furthermore, potential confounding factors, such as the use of thyroid hormone replacement therapy, should be considered in subsequent analyses. Statistical validation is also needed.

**3. Hyperlipidemia and Diabetes Mellitus (DM):** The analysis did not reveal any statistically significant relationship between the presence of gallstones and either Hyperlipidemia or Diabetes Mellitus (DM). This suggests that, within this dataset, neither condition independently demonstrates a significant association with gallstone prevalence.

**4. Body Mass Index (BMI) Category:** Gallstone prevalence appears to be highest among individuals classified as obese (approximately 52.89%) and overweight (approximately 51.91%). A lower gallstone prevalence was observed in the normal weight category (approximately 40.00%). Notably, no gallstones were observed in the underweight category; however, the extremely small sample size for this group limits the interpretability of this result. Overall, there appears to be a trend of increasing gallstone prevalence with increasing BMI, at least up to the obese and overweight categories. Statistical confirmation and consideration of confounding variables are recommended.

## Conclusion
This project provides a basic introduction to analyzing a gallstone dataset using SQL. By performing data exploration and answering specific questions, we can gain insights into potential risk factors and relationships associated with gallstone presence. Further analysis, potentially using more advanced statistical techniques, could build upon these findings.
