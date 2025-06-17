-- Create content_levels table for access control
CREATE TABLE content_levels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content_id INT NOT NULL,
    accesslevel_id INT NOT NULL,
    FOREIGN KEY (content_id) REFERENCES contents(content_id),
    FOREIGN KEY (accesslevel_id) REFERENCES access_levels(accesslevel_id),
    UNIQUE (content_id, accesslevel_id)
);