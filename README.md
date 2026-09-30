# Royal Leaf Function Hall Booking — Fresher JDBC Project

This project demonstrates a complete mini application using:
- HTML/CSS/JavaScript for the frontend
- Node.js for the frontend server + API proxy
- Java 17 + JDBC for the backend
- MySQL for persistent data

## Project flow
Home → Function Halls → Food → Booking & Payment → Success animation

## Requirements
1. JDK 17+
2. Node.js 18+
3. MySQL 8+
4. Maven 3.9+

## 1) Start MySQL
Make sure MySQL is running. The Java program automatically creates the `function_hall_db` database and all tables.

The default JDBC settings are:
- URL: `jdbc:mysql://localhost:3306/function_hall_db?createDatabaseIfNotExist=true&serverTimezone=UTC`
- user: `root`
- password: empty

For a different password, set environment variables before starting Java:
Windows PowerShell:
`$env:DB_USER="root"; $env:DB_PASSWORD="yourpassword"`

Linux/macOS:
`export DB_USER=root`
`export DB_PASSWORD=yourpassword`

## 2) Start the Java JDBC backend
Open terminal in `backend`:

```bash
mvn compile exec:java
```

You should see:
`Java JDBC API running at http://localhost:8080`

## 3) Start the Node.js frontend server
Open another terminal in the project root:

```bash
node server.js
```

You should see:
`Frontend server running at http://localhost:3000`

Open:
`http://localhost:3000`

## Important for your trainer demo
The payment screens are demo-only. UPI/Card/Cash are saved in the MySQL `payments` table with the booking total and status `DEMO_CONFIRMED`; no real money is charged. Every selected food item is saved in `booking_items` with quantity and price, and the selected hall is saved in `bookings`.

## Files
- frontend/index.html — home page
- frontend/halls.html — hall packages
- frontend/food.html — 22 veg + 22 non-veg items
- frontend/booking.html — cart, customer form and payment option
- frontend/success.html — booking success animation
- frontend/style.css — responsive UI + add/remove/success animations
- frontend/app.js — frontend logic and API calls
- server.js — Node.js static server + proxy
- backend/pom.xml — Java/JDBC dependency configuration
- backend/src/main/java/com/functionhall/Main.java — Java HTTP API + JDBC + DB setup


## What is saved in MySQL
- `halls` — every function hall/package available for selection
- `foods` — 22 Veg + 22 Non-Veg products
- `bookings` — customer, date, event, selected hall, payment method and final server-calculated total
- `booking_items` — every selected food product and quantity
- `payments` — selected payment method, amount and demo payment status

## Demo flow
1. Open Home.
2. Open Function Halls and select any hall.
3. Open Food and switch between Veg and Non-Veg. Add as many items/quantities as required.
4. Open Booking. Check the hall, food list and calculated total.
5. Select UPI, Card or Cash.
6. Click **Confirm Booking**.
7. Java/JDBC writes the booking, all food rows and payment row to MySQL.
8. The success page shows the generated booking ID and success animation.
