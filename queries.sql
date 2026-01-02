-- create users table

create table users (
    user_id int primary key auto_increment,
    role varchar(20) not null,
    name varchar(100) not null,
    email varchar(150) not null unique,
    password varchar(255) not null,
    phone varchar(20)
);



-- create vehicles table

create table vehicles (
    vehicle_id int primary key auto_increment,
    vehicle_name varchar(100) not null,
    vehicle_type varchar(20) not null,
    model int not null,
    registration_number varchar(50) not null unique,
    price_per_day decimal(10,2) not null,
    availability_status varchar(20) not null
);



-- create bookings table

create table bookings (
    booking_id int primary key auto_increment,
    user_id int not null,
    vehicle_id int not null,
    start_date date not null,
    end_date date not null,
    booking_status varchar(20) not null,
    total_cost decimal(10,2) not null,
    foreign key (user_id) references users(user_id),
    foreign key (vehicle_id) references vehicles(vehicle_id)
);

-- sample insert data: users

insert into users (user_id, name, email, phone, role, password) values
(1, 'david', 'david@gmail.com', '01711111111', 'customer', 'pass123'),
(2, 'emma', 'emma@gmail.com', '01822222222', 'customer', 'pass123'),
(3, 'admin1', 'admin1@gmail.com', '01933333333', 'admin', 'admin123');




-- sample insert data: vehicles

insert into vehicles (
    vehicle_id,
    vehicle_name,
    vehicle_type,
    model,
    registration_number,
    price_per_day,
    availability_status
) values
(1, 'nissan sunny', 'car', 2021, 'dha-101', 55, 'available'),
(2, 'suzuki gixxer', 'bike', 2022, 'dha-202', 25, 'rented'),
(3, 'toyota hiace', 'truck', 2020, 'dha-303', 120, 'maintenance'),
(4, 'honda city', 'car', 2023, 'dha-404', 70, 'available');




-- sample insert data: bookings

insert into bookings (
    booking_id,
    user_id,
    vehicle_id,
    start_date,
    end_date,
    booking_status,
    total_cost
) values
(1, 1, 2, '2024-01-05', '2024-01-07', 'completed', 75),
(2, 2, 2, '2024-02-10', '2024-02-12', 'completed', 75),
(3, 1, 2, '2024-03-01', '2024-03-03', 'confirmed', 75),
(4, 1, 4, '2024-03-15', '2024-03-17', 'pending', 140);


-- join

select 
    b.booking_id,
    u.name as customer_name,
    v.vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status as status
from bookings b
inner join users u on b.user_id = u.user_id
inner join vehicles v on b.vehicle_id = v.vehicle_id;



-- not exists

select 
    v.vehicle_id,
    v.vehicle_name as name,
    v.vehicle_type as type,
    v.model,
    v.registration_number,
    v.price_per_day as rental_price,
    v.availability_status as status
from vehicles v
where not exists (
    select 1
    from bookings b
    where b.vehicle_id = v.vehicle_id
);

-- where

select 
    vehicle_id,
    vehicle_name as name,
    vehicle_type as type,
    model,
    registration_number,
    price_per_day as rental_price,
    availability_status as status
from vehicles
where availability_status = 'available'
and vehicle_type = 'car';

-- group by and having

select 
    v.vehicle_name,
    count(b.booking_id) as total_bookings
from vehicles v
inner join bookings b on v.vehicle_id = b.vehicle_id
group by v.vehicle_name
having count(b.booking_id) > 2;
