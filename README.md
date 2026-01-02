# vehicle rental system – database design & sql queries

## project overview
This project implements a simplified **vehicle rental system** database.  
It demonstrates relational database design, entity relationships, and SQL query writing using joins, subqueries, filtering, and aggregation.

The system manages users, vehicles, and bookings, and supports real-world rental scenarios such as booking history, vehicle availability, and booking analytics.

---

## database design
The database consists of three tables:

### 1. users
Stores system users including admins and customers.

**key fields**
- user_id (primary key)
- role (admin / customer)
- email (unique)

### 2. vehicles
Stores all vehicles available for rental.

**key fields**
- vehicle_id (primary key)
- registration_number (unique)
- availability_status (available / rented / maintenance)

### 3. bookings
Stores rental bookings and links users with vehicles.

**key fields**
- booking_id (primary key)
- user_id (foreign key → users)
- vehicle_id (foreign key → vehicles)
- booking_status

---

## relationships
- one user can make many bookings (1:N)
- one vehicle can have many bookings over time (1:N)
- each booking is linked to exactly one user and one vehicle

---

## sql queries explanation

All required queries are written in **queries.sql** and are based on the provided sample input/output.

### query 1: join
Retrieves booking information along with customer name and vehicle name using `inner join`.

### query 2: exists
Finds vehicles that have never been booked using `not exists`.

### query 3: where
Retrieves available vehicles of a specific type using `where`.

### query 4: group by and having
Counts bookings per vehicle and displays only vehicles with more than two bookings using `group by`, `count`, and `having`.

---

## how to run
1. Create the database tables using the provided `create table` statements.
2. Insert sample data using the provided `insert` statements.
3. Run the queries from `queries.sql` to verify outputs.

---

## author
Assignment submission – Vehicle Rental System  
Database Design & SQL Queries
