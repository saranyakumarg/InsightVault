-- Create users table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    password VARCHAR(255),
    email VARCHAR(100) NOT NULL UNIQUE,
    role_id INT NOT NULL,
    access_level_id INT NOT NULL,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    registration_token VARCHAR(255),
    token_expiry DATETIME,
    is_registered BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (access_level_id) REFERENCES access_levels(access_level_id)
);