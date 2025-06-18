-- Create content_levels table for access control
CREATE TABLE IF NOT EXISTS content_levels (
    content_level_id INT AUTO_INCREMENT PRIMARY KEY,
    content_id INT NOT NULL,
    access_level_id INT NOT NULL,
    FOREIGN KEY (content_id) REFERENCES contents(content_id),
    FOREIGN KEY (access_level_id) REFERENCES access_levels(access_level_id),
    UNIQUE (content_id, access_level_id)
);