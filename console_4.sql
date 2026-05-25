CREATE DATABASE HotelDB;
CREATE Schema hotel;
CREATE TABLE hotel.room_types(
    room_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL UNIQUE,
    price_per_night NUMERIC(10, 2) CHECK(price_per_night > 0),
    max_capacity INT CHECK (max_capacity > 0)
);

CREATE TABLE hotel.rooms(
    room_id SERIAL PRIMARY KEY,
    room_number VARCHAR(50) NOT NULL UNIQUE,
    room_type_id INT REFERENCES hotel.room_types(room_type_id),
    status VARCHAR(20) CHECK(status IN ('Available', 'Occupied', 'Maintenance'))
);
CREATE TABLE hotel.customers(
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);
CREATE TABLE hotel.bookings(
    booking_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES hotel.customers(customer_id),
    room_id INT REFERENCES hotel.rooms(room_id),
    check_in DATE NOT NULL,
    checkout DATE NOT NULL,
    status VARCHAR(20) CHECK(status IN ('Pending', 'Confirmed', 'Cancelled'))
);
CREATE TABLE hotel.payments(
    payment_id SERIAL PRIMARY KEY,
    booking_id INT,
    amount NUMERIC(10, 2) CHECK (amount >= 0),
    payment_date DATE NOT NULL,
    method VARCHAR(20) CHECK(method IN('Credit card', 'Cash', 'Bank Transfer')),
    FOREIGN KEY (booking_id) REFERENCES hotel.bookings(booking_id)
)