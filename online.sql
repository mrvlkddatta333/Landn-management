DROP DATABASE 

CREATE DATABASE IF NOT EXISTS `online`;
USE `online`;

-- users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    user_type ENUM('citizen', 'registrar') NOT NULL
);


-- lands table
CREATE TABLE lands (
    land_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,  -- Foreign key to users table (land owner)
    land_area_sqft FLOAT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    survey_number VARCHAR(50) NOT NULL,
    is_registered BOOLEAN DEFAULT 0,  -- Whether the land is registered or not
    FOREIGN KEY (owner_id) REFERENCES users(user_id)
);

-- transaction table
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_id INT NOT NULL,  -- Foreign key to users table (buyer)
    land_id INT NOT NULL,  -- Foreign key to lands table
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (buyer_id) REFERENCES users(user_id),
    FOREIGN KEY (land_id) REFERENCES lands(land_id)
);


