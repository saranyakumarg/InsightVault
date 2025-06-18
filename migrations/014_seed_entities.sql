-- Seed entities table with common entity types
INSERT INTO entities (name, description) 
SELECT * FROM (
    SELECT 'user_profile', 'User profile information and settings' UNION ALL
    SELECT 'content_creation', 'Content creation and publishing' UNION ALL
    SELECT 'content_approval', 'Content approval and moderation' UNION ALL
    SELECT 'content_rejection', 'Content rejection and feedback' UNION ALL
    SELECT 'access_level', 'User access level management' UNION ALL
    SELECT 'user_content_interaction', 'User interactions with content' UNION ALL
    SELECT 'content_status', 'Content status update' UNION ALL
    SELECT 'user_permission', 'User permission management' UNION ALL
    SELECT 'content_version', 'Content version management' UNION ALL
    SELECT 'user_activity', 'User activity tracking'
) AS new_entities
WHERE NOT EXISTS (SELECT 1 FROM entities);