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

### 2. Data Exploration & Cleaning
*   **Database Creation:** (If necessary) Create a database to house the gallstone data.  Example: `CREATE DATABASE gallstone_db;`
*   **Table Creation:** Create a table named `gallstone_data` to store the patient information.  The table structure includes columns for Gallstone Status, Age, Gender, Comorbidity, and other relevant features.
