## Vehicle Rental System — Database Design & SQL Queries

This repository contains a database design and SQL query assignment for a **Vehicle Rental System**. The goal of this assignment is to demonstrate a solid understanding of:

- Relational database structure and schema design
- Entity Relationship Diagrams (ERD)
- Advanced SQL querying with joins, exists conditions, grouping, and filters

You will also explore real-world constraints such as availability of vehicles and relational linkages between users, bookings, and vehicles. :contentReference[oaicite:1]{index=1}

---

## 🛠️ Features & Scope

This project includes the following components:

### 🔹 [ERD](https://drawsql.app/teams/none-4574/diagrams/vehicle-rental-system) (Entity Relationship Diagram)
A conceptual diagram that connects the main entities of the system:

| Table      | Primary Role |
|------------|---------------|
| Users      | Stores customers and admin info |
| Vehicles   | Manages vehicle inventory |
| Bookings   | Tracks rental agreements |

The relationships are represented as:
- **One-to-Many**: Users → Bookings
- **Many-to-One**: Bookings → Vehicles  
(NB: Logical One-to-One between a booking, its user, and vehicle) :contentReference[oaicite:2]{index=2}

---

## 📁 SQL Queries & Results

### 🚀 What’s Included

1. **INNER JOIN** — Get booking info with user + vehicle details  
2. **NOT EXISTS** — Find vehicles that were never booked  
3. **WHERE clause** — List all available vehicles of a specific type  
4. **GROUP BY + HAVING** — Vehicles having more than 2 bookings :contentReference[oaicite:3]{index=3}

📌 These queries are also provided in `queries.sql` inside this repository.

---
