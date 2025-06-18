-- Create content_tags table for many-to-many relationship
CREATE TABLE IF NOT EXISTS content_tags (
    content_tag_id INT AUTO_INCREMENT PRIMARY KEY,
    content_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (content_id) REFERENCES contents(content_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id),
    UNIQUE (content_id, tag_id)
);

