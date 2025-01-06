# Music Store Database SQL Queries - Beginner to Advanced

This repository contains a collection of SQL queries designed to solve real-world data problems using the **Music Store** database. The project is organized into three levels based on query complexity: **Beginner**, **Moderate**, and **Advanced**. Each level progressively covers essential database operations, from simple data retrieval to complex data analysis.

The **Music Store database** simulates a real-world music retail environment. It includes information about customers, their purchases, and the music products available in the store. This project helps users improve their SQL skills by working on practical scenarios related to business operations, customer insights, and sales analysis.

### **Levels of Queries**

1. **Beginner Level**:  
   Basic SQL queries that focus on simple data retrieval operations using `SELECT`, `WHERE`, `ORDER BY`, and `JOIN` statements. These queries are useful for understanding how to extract and display specific information from one or more tables.
   
2. **Moderate Level**:  
   Intermediate queries that require the use of **aggregate functions** (`SUM`, `AVG`, `COUNT`), **GROUP BY**, and **HAVING** clauses. These queries involve more complex table joins and subqueries to derive meaningful insights from the dataset.

3. **Advanced Level**:  
   Complex SQL queries designed to solve challenging data problems. These queries utilize advanced SQL concepts such as **window functions** (`ROW_NUMBER`, `RANK`), **CTEs (Common Table Expressions)**, **correlated subqueries**, and conditional logic using `CASE WHEN`.

 **Dataset Overview**

The dataset includes the following tables:
- **Customers**: Contains details of the store’s customers.
- **Orders**: Tracks purchases made by customers.
- **Albums**: Stores information about music albums.
- **Artists**: Contains details about music artists.
- **Tracks**: Lists all the tracks in each album.
- **Genres**: Represents different genres of music.

This repository contains SQL queries designed to solve various questions based on the Music Store database. The project is structured into three levels of complexity: **Beginner**, **Moderate**, and **Advanced**. Each level includes a set of queries that help explore different aspects of the dataset, such as retrieving basic information, performing aggregations, and solving complex data problems.

## Table of Contents
1. [Overview](#overview)
2. [Dataset](#dataset)
3. [Levels of Queries](#levels-of-queries)
    - [Beginner Level](#beginner-level)
    - [Moderate Level](#moderate-level)
    - [Advanced Level](#advanced-level)
4. [Technologies Used](#technologies-used)
5. [How to Run](#how-to-run)
6. [Contributing](#contributing)
7. [License](#license)

## Overview
The Music Store database represents a fictional online music store. It contains tables related to customers, orders, albums, artists, and more. This project focuses on creating and executing SQL queries to extract insights from the data.

## Dataset
The database schema includes the following key tables:
- **Customers**: Information about customers.
- **Orders**: Records of customer purchases.
- **Albums**: Details of music albums.
- **Artists**: Information about artists.
- **Tracks**: Tracks included in the albums.
- **Genres**: Different music genres.

## Levels of Queries

### Beginner Level
In this level, basic SQL queries are written to retrieve and display simple data from the tables. These queries focus on:
- Selecting specific columns.
- Filtering records using `WHERE` conditions.
- Sorting data using `ORDER BY`.
- Using simple `JOIN`s to combine tables.

### Moderate Level
Moderate-level queries involve intermediate SQL concepts such as:
- Grouping data using `GROUP BY` and applying aggregate functions (`COUNT`, `SUM`, `AVG`, etc.).
- Using `HAVING` to filter grouped data.
- Writing subqueries to solve nested problems.
- More complex `JOIN`s involving multiple tables.

### Advanced Level
Advanced-level queries focus on solving complex data problems, including:
- Window functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`).
- CTEs (Common Table Expressions) for better query readability.
- Advanced subqueries and correlated subqueries.
- Complex filtering and conditional logic using `CASE WHEN`.

## Technologies Used
- **SQL**: Structured Query Language for database operations.
- **Postgre sql**: Used to execute and test the queries.
- **Git & GitHub**: Version control and repository hosting.

