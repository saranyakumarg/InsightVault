-- Seed categories table with common categories
INSERT INTO categories (name, slug)
SELECT * FROM (
    SELECT 'Technology', 'tech' UNION ALL
    SELECT 'Science', 'science' UNION ALL
    SELECT 'Health', 'health' UNION ALL
    SELECT 'Business', 'business' UNION ALL
    SELECT 'Education', 'education' UNION ALL
    SELECT 'Entertainment', 'entertainment' UNION ALL
    SELECT 'Sports', 'sports' UNION ALL
    SELECT 'Travel', 'travel' UNION ALL
    SELECT 'Lifestyle', 'lifestyle' UNION ALL
    SELECT 'Politics', 'politics'
) AS new_categories
WHERE NOT EXISTS (SELECT 1 FROM categories);