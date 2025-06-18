-- Seed roles table with common entity types
INSERT INTO roles (name, description)
SELECT * FROM (
    SELECT 'Admin', 'Administrator role with full access to all features' UNION ALL
    SELECT 'Contributor', 'Contributor role with content creation and moderation permissions' UNION ALL
    SELECT 'User', 'User role with content viewing and interaction permissions'
) AS new_roles
WHERE NOT EXISTS (
    SELECT 1 FROM roles
);