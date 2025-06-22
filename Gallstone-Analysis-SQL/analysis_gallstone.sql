-- Gallstone Dataset Analysis SQL Project

-- ----------------------------------------------------------------------------
-- 1. Database Setup (Run this section only if you need to create the database and table)
-- ----------------------------------------------------------------------------

-- Create the database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS gallstone_db;

-- Use the database
USE gallstone_db;

-- Create the gallstone_data table
CREATE TABLE IF NOT EXISTS gallstone_data (
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

-- ----------------------------------------------------------------------------
-- 2. Data Exploration & Cleaning
-- ----------------------------------------------------------------------------

-- 2.1. Record Count
SELECT COUNT(*) FROM gallstone_data;

-- 2.2. Unique Values (Example: Gender, Comorbidity)
SELECT DISTINCT Gender FROM gallstone_data;
SELECT DISTINCT Comorbidity FROM gallstone_data;
-- Add more SELECT DISTINCT for other categorical columns

-- 2.3. Missing Value Check
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


-- ----------------------------------------------------------------------------
-- 3. Data Analysis & Findings
-- ----------------------------------------------------------------------------

-- 3.1. Basic Descriptive Statistics
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

-- 3.2. Gallstone Prevalence by Gender
SELECT
    Gender,                                                                 -- Gender of the patient
    COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones
    COUNT(CASE WHEN `Gallstone_Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones
    (COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence
FROM
    gallstone_data
GROUP BY
    Gender;

-- 3.3. Relationship between Age and Gallstone Status
SELECT
    Gallstone_Status,              -- Gallstone status (1 = present, 0 = absent)
    AVG(Age) AS average_age         -- Average age for each group
FROM
    gallstone_data
GROUP BY
    Gallstone_Status;

-- 3.4. Gallstone Prevalence by Comorbidity
SELECT
    Comorbidity,                                                              -- Type of comorbidity
    COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones and this comorbidity
    COUNT(CASE WHEN `Gallstone_Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones and this comorbidity
    (COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence for this comorbidity
FROM
    gallstone_data
GROUP BY
    Comorbidity
ORDER BY
    prevalence_percentage DESC;  -- Ordered by highest prevalence

-- 3.5. Analysis for Binary Comorbidities (CAD, Hypothyroidism, Hyperlipidemia, DM)

-- 3.5.1 Coronary Artery Disease (CAD)
SELECT
    `Coronary Artery Disease (CAD)`,                                                                 -- CAD status (1 = present, 0 = absent)
    COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones and CAD
    COUNT(CASE WHEN `Gallstone_Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones and CAD
    (COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence for CAD
FROM
    gallstone_data
GROUP BY
    `Coronary Artery Disease (CAD)`;

-- 3.5.2 Hypothyroidism
SELECT
    Hypothyroidism,                                                                 -- Hypothyroidism status (1 = present, 0 = absent)
    COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones and Hypothyroidism
    COUNT(CASE WHEN `Gallstone_Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones and Hypothyroidism
    (COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence for Hypothyroidism
FROM
    gallstone_data
GROUP BY
    Hypothyroidism;

-- 3.5.3 Hyperlipidemia
SELECT
    Hyperlipidemia,                                                                 -- Hyperlipidemia status (1 = present, 0 = absent)
    COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones and Hyperlipidemia
    COUNT(CASE WHEN `Gallstone_Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones and Hyperlipidemia
    (COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence for Hyperlipidemia
FROM
    gallstone_data
GROUP BY
    Hyperlipidemia;

-- 3.5.4 Diabetes Mellitus (DM)
SELECT
    `Diabetes Mellitus (DM)`,                                                                 -- Diabetes Mellitus (DM) status (1 = present, 0 = absent)
    COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones and Diabetes Mellitus (DM)
    COUNT(CASE WHEN `Gallstone_Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones and Diabetes Mellitus (DM)
    (COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence for Diabetes Mellitus (DM)
FROM
    gallstone_data
GROUP BY
    `Diabetes Mellitus (DM)`;

-- 3.6. Relationship between BMI and Gallstone Status
SELECT
    CASE
        WHEN `Body Mass Index (BMI)` < 18.5 THEN 'Underweight'
        WHEN `Body Mass Index (BMI)` >= 18.5 AND `Body Mass Index (BMI)` < 25 THEN 'Normal weight'
        WHEN `Body Mass Index (BMI)` >= 25 AND `Body Mass Index (BMI)` < 30 THEN 'Overweight'
        WHEN `Body Mass Index (BMI)` >= 30 THEN 'Obese'
        ELSE 'Unknown'
    END AS bmi_category,                                                      -- BMI category
    COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) AS gallstone_present,  -- Number of patients with gallstones in this category
    COUNT(CASE WHEN `Gallstone_Status` = 0 THEN 1 END) AS gallstone_absent,   -- Number of patients without gallstones in this category
    (COUNT(CASE WHEN `Gallstone_Status` = 1 THEN 1 END) / COUNT(*)) * 100 AS prevalence_percentage -- Percentage of gallstone prevalence in this category
FROM
    gallstone_data
GROUP BY
    bmi_category
ORDER BY
    prevalence_percentage DESC;  -- Ordered by highest prevalence