-- Create access_levels table
CREATE TABLE IF NOT EXISTS access_levels (
    access_level_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL
);