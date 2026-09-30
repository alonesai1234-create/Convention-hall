# Deploying this project to Render

The message **"Cannot connect to Java backend"** appears when only the Node frontend is deployed. The browser is calling `/api/halls`, Node proxies that request to `JAVA_API`, and `JAVA_API` defaults to `http://localhost:8080`. On Render, `localhost` is the frontend service itself, not the Java service.

Deploy the two services separately:

## 1. Java/JDBC backend
Create a Render Web Service from the `backend` folder.

- Runtime: Docker
- Dockerfile path: `backend/Dockerfile`
- Add environment variables:
  - `DB_URL` = your hosted MySQL JDBC URL
  - `DB_USER` = your MySQL user
  - `DB_PASSWORD` = your MySQL password
- Render provides `PORT`; the Java backend now reads it automatically.

After deployment, copy the backend URL, for example:
`https://your-java-backend.onrender.com`

## 2. Node frontend
Create another Render Web Service from the project root.

- Runtime: Node
- Build command: `npm install` (or leave empty)
- Start command: `node server.js`
- Environment variable:
  - `JAVA_API` = your Java backend URL from step 1

The Node frontend now also uses Render's `PORT` automatically.

## 3. MySQL
The JDBC backend needs a reachable MySQL 8 database. Do not use `localhost` for `DB_URL` on Render. Use the connection/JDBC URL supplied by your hosted MySQL provider.

## 4. Test
Open the Node frontend URL and go to **Function Halls**. The hall cards should load. Then test Food → Booking → Payment → Confirm Booking.

### Important
UPI/Card/Cash in this student project are **demo payment choices**. They are stored as payment records; the application does not charge real money.
