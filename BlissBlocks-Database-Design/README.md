# BlissBlocks Database Design and Modeling

## Overview

This document outlines the design and modeling of a database for BlissBlocks, a construction toy company focused on creativity and innovation. The database is designed to efficiently manage product data, including inventories, parts, categories, colors, and set information. This project was undertaken as a major assignment for a database course.

## Team Members

*   Muhammad Naufal Farabbi (2211110013)
*   Muhammad Fadhlandhifan Siregar (2211110016)
*   Andi Hisyam F. F (2211110017)
*   Muhammad Ihsan Prawira Hutomo (2211110022)
*   Hanif Fakhri Pratama (2211110037)

## Project Goals

*   To design a robust and efficient database to support BlissBlocks' operational needs.
*   To ensure data integrity, security, and accessibility for informed decision-making.
*   To create a scalable database solution that can adapt to the company's growth.

## Project Scope

The project encompasses the following key areas:

*   **Data Understanding:** Analysis of the data requirements for managing BlissBlocks' product information.
*   **ERD Design:** Creation of an Entity-Relationship Diagram (ERD) to visually represent the database structure and relationships between entities.
*   **Database Normalization:** Implementation of database normalization techniques (1NF, 2NF, and 3NF) to minimize data redundancy and improve data integrity.
*   **MySQL Implementation:** Translation of the logical database design into a physical implementation using MySQL.

## Database Design

The database design incorporates the following key entities and tables:

*   **Part\_category:** Defines categories for Lego parts (e.g., Baseplates, Bricks).
*   **Parts:** Stores detailed information about each Lego part, including name and category.
*   **Colors\_1, Colors\_2:** Manages color information, including RGB values and aliases.
*   **Inventories:** Tracks inventory information, including version and set number.
*   **Inventory\_Part:** Represents the relationship between inventories and parts, including quantity and color.
*   **Themes:** Stores information about Lego set themes.
*   **Sets:** Contains data about Lego sets, including name, year, theme, and number of parts.
*   **Inventory\_Sets:** Connects inventories and sets, indicating which inventories are included in specific sets.

## Database Relationships

The database utilizes various relationships to ensure data consistency and integrity:

*   **One-to-Many:**
    *   Part\_Category to Parts (One category can have many parts).
    *   Themes to Sets (One theme can have many sets).
    *   Inventories to Inventory\_Sets (One inventory can be in many sets).
    *   Sets to Inventory\_Sets (One set can have many inventories).
    *   Colors\_1 to Inventory\_Part (One color can be in many inventory parts).
    *   Parts to Inventory\_Part (One part can be in many inventory parts).
    *   Inventories to Inventory\_Part (One inventory can have many parts).
*   **One-to-One:**
    *   Colors\_1 to Colors\_2 (One color has one alias).

## Normalization

The database design adheres to the principles of database normalization, including:

*   **1NF (First Normal Form):** Ensuring that each table cell contains only atomic values.
*   **2NF (Second Normal Form):** Eliminating partial dependencies on the primary key.
*   **3NF (Third Normal Form):** Removing transitive dependencies between non-key attributes.

## Implementation

The database was implemented using MySQL. The implementation involved creating tables, defining primary and foreign keys, and establishing relationships between tables.

## Key Learnings

*   Understanding the importance of data modeling and normalization in database design.
*   Applying ERD concepts to create a logical database structure.
*   Translating a logical design into a physical implementation using MySQL.
*   Working collaboratively as a team to achieve project goals.

## Recommendations for Future Improvement

*   Implement ongoing database optimization to improve performance.
*   Consistently manage foreign keys to maintain data integrity.
*   Monitor and adjust database performance as needed.
*   Implement best practices for data security, disaster recovery, and reliability.
