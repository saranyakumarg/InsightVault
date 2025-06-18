-- Create content table
CREATE TABLE IF NOT EXISTS contents (
    content_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    content TEXT NOT NULL,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    publish_date DATETIME,
    modified_date DATETIME,
    status ENUM('draft', 'published', 'archived') DEFAULT 'draft',
    version_id INT,
    FOREIGN KEY (author_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

