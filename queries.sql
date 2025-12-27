 -- create users table
create type
  user_role as enum('Admin', 'Customer');

create table
  users (
    user_id serial primary key,
    name varchar(100) not null,
    email varchar(100) unique not null,
    password varchar(30) not null,
    phone varchar(30) not null,
    role user_role not null default 'Customer'
  );

-- insert 
insert into
  users (name, email, password, phone, role)
values
  (
    'Alice',
    'alice@gmail.com',
    '123asd',
    '+8801307495864',
    'Admin'
  ),
  (
    'Bob',
    'bob@gmail.com',
    '123asd',
    '+8801307495864',
    'Customer'
  ),
  (
    'Charlie',
    'charlie@gmail.com',
    '123asd',
    '+8801307495864',
    'Customer'
  );

-- create vehicle table
create type
  vehicle_type as enum('car', 'bike', 'truck');

create type
  vehicle_status as enum('available', 'rented', 'maintenance');

create table
  vehicles (
    vehicle_id serial primary key,
    name varchar(150) not null,
    type vehicle_type not null,
    model varchar(20) not null,
    registration_number varchar(50) unique not null,
    rental_price int not null,
    status vehicle_status not null
  );

-- insert
insert into
  vehicles (
    name,
    type,
    model,
    registration_number,
    rental_price,
    status
  )
values
  (
    'Toyota Corolla',
    'car',
    '2022',
    'ABC-123',
    '50',
    'available'
  ),
  (
    'Honda Civic',
    'car',
    '2021',
    'DEF-456',
    '60',
    'rented'
  ),
  (
    'Yamaha R15',
    'bike',
    '2023',
    'GHI-789',
    '30',
    'available'
  ),
  (
    'Ford F-150',
    'truck',
    '2020',
    'JKL-012',
    '100',
    'maintenance'
  );

-- create booking table
create type
  booking_status as enum('pending', 'confirmed', 'completed', 'cancelled');

create table
  bookings (
    booking_id serial primary key,
    user_id int not null references users (user_id),
    vehicle_id int not null references vehicles (vehicle_id),
    start_date date not null default now(),
    end_date date not null,
    status booking_status not null default 'pending',
    total_cost int not null
  );

-- insert
insert into
  bookings (
    user_id,
    vehicle_id,
    start_date,
    end_date,
    status,
    total_cost
  )
values
  (
    1,
    2,
    '2023-10-01',
    '2023-10-05',
    'completed',
    240
  ),
  (
    1,
    2,
    '2023-11-01',
    '2023-11-03',
    'completed',
    120
  ),
  (3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
  (1, 1, '2023-12-10', '2023-12-12', 'pending', 100);


-- query 1: JOIN
select booking_id, u.name as customer_name, v.name as vehicle_name, start_date, end_date, b.status from bookings as b
join users as u using(user_id) join vehicles as v using (vehicle_id);


-- Query 2: EXISTS
select *
from vehicles as v
where not  exists (
  select *
  from bookings as b
  where b.vehicle_id = v.vehicle_id
);


-- Query 3: WHERE
select * from vehicles
where type = 'car' and status = 'available';
