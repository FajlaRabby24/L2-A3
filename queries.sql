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
    type
      vehicle_type not null,
      model varchar(20) not null,
      registration_number varchar(50) not null,
      rental_price int not null,
      status vehicle_status not null
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
