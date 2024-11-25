CREATE DATABASE fleetmanagementsystem;
CREATE USER 'fleetmanagementsystem'@'%' IDENTIFIED BY 'fleetmanagementsystem';
GRANT ALL PRIVILEGES ON fleetmanagementsystem.* TO 'fleetmanagementsystem'@'%';
FLUSH PRIVILEGES;

USE fleetmanagementsystem;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    make VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    license_plate VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    registration_number VARCHAR(50),
    make VARCHAR(50),
    model VARCHAR(50),
    insurance_expiry DATE,
    last_maintenance DATE
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE trips (
    id INT AUTO_INCREMENT PRIMARY KEY,
    start_location VARCHAR(255) NOT NULL,
    end_location VARCHAR(255) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    vehicle_id INT NOT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);

CREATE TABLE drivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
    license_number VARCHAR(50),
    contact_info VARCHAR(50)
);

CREATE TABLE driver_vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES drivers(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);

CREATE TABLE driver_trips (
    id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT NOT NULL,
    trip_id INT NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES drivers(id),
    FOREIGN KEY (trip_id) REFERENCES trips(id)
);

CREATE TABLE fuel_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT,
    trip_id INT,
    fuel_used DECIMAL(10, 2),
    cost DECIMAL(10, 2)
);