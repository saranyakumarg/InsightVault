-- Seed tags table with common tags
INSERT INTO tags (slug)
SELECT * FROM (
    SELECT 'technology' UNION ALL
    SELECT 'science' UNION ALL
    SELECT 'health' UNION ALL
    SELECT 'business' UNION ALL
    SELECT 'education' UNION ALL
    SELECT 'entertainment' UNION ALL
    SELECT 'sports' UNION ALL
    SELECT 'travel' UNION ALL
    SELECT 'lifestyle' UNION ALL
    SELECT 'politics' UNION ALL
    SELECT 'news' UNION ALL
    SELECT 'opinion' UNION ALL
    SELECT 'tutorial' UNION ALL
    SELECT 'review' UNION ALL
    SELECT 'guide'
) AS new_tags
WHERE NOT EXISTS (SELECT 1 FROM tags);