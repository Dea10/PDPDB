-- CREATE DATABASE IF NOT EXISTS pdp;
USE pdp;

CREATE TABLE IF NOT EXISTS menu (
    id_menu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    menu_title VARCHAR(25) NOT NULL,
    menu_description VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS product_category_cat (
    id_product_category INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_category VARCHAR(25) NOT NULL,
    product_category_description VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS product (
    id_product INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(25) NOT NULL,
    product_description VARCHAR(50) NOT NULL,
    product_price DECIMAL(6, 2) NOT NULL,
    product_handcrafting_time INT NOT NULL,
    id_product_category INT NOT NULL,
    FOREIGN KEY (id_product_category) REFERENCES product_category_cat(id_product_category)
);

CREATE TABLE IF NOT EXISTS product_product_category (
    id_product_product_category INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_product INT NOT NULL,
    id_product_category INT NOT NULL,
    FOREIGN KEY (id_product) REFERENCES product(id_product),
    FOREIGN KEY (id_product_category) REFERENCES product_category_cat(id_product_category)
);

CREATE TABLE IF NOT EXISTS product_status_catalog (
    id_product_status INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_status VARCHAR(25) NOT NULL,
    product_status_description VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS menu_product (
    id_menu_product INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_menu INT NOT NULL,
    id_product INT NOT NULL,
    id_product_status INT NOT NULL,
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_product) REFERENCES product(id_product),
    FOREIGN KEY (id_product_status) REFERENCES product_status_catalog(id_product_status)
);

-- Users
CREATE TABLE IF NOT EXISTS user_type_catalog (
    id_user_type INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_type VARCHAR(25) NOT NULL,
    user_type_description VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS user (
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(25) NOT NULL,
    user_email VARCHAR(75) NOT NULL,
    user_password VARCHAR(25) NOT NULL,
    id_user_type INT NOT NULL,
    FOREIGN KEY (id_user_type) REFERENCES user_type_catalog(id_user_type)
);

-- Customers
CREATE TABLE IF NOT EXISTS customer (
    id_customer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(25) NOT NULL,
    customer_email VARCHAR(75) NOT NULL,
    customer_password VARCHAR(25) NOT NULL
);

-- Purchases
CREATE TABLE IF NOT EXISTS purchase_status_cat (
    id_purchase_status INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    purchase_status VARCHAR(25) NOT NULL,
    purchase_status_description VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS purchase (
    id_purchase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_customer INT NOT NULL,
    purchase_total DECIMAL(10, 2) NOT NULL,
    purchase_total_items INT NOT NULL,
    purchase_creation_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    purchase_delivery_date_appt DATETIME NOT NULL,
    purchase_delivery_date_track DATETIME NOT NULL,
    id_purchase_status INT NOT NULL,
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
    FOREIGN KEY (id_purchase_status) REFERENCES purchase_status_cat(id_purchase_status)
);

CREATE TABLE IF NOT EXISTS purchase_product (
    id_purchase_product INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_purchase INT NOT NULL,
    id_product INT NOT NULL,
    FOREIGN KEY (id_purchase) REFERENCES purchase(id_purchase),
    FOREIGN KEY (id_product) REFERENCES product(id_product)
);