-- Create access_levels table
CREATE TABLE access_levels (
    accesslevel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL
);