-- Create content_versions table for version history
CREATE TABLE IF NOT EXISTS content_versions (
    version_id INT AUTO_INCREMENT PRIMARY KEY,
    content_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (content_id) REFERENCES contents(content_id)
);