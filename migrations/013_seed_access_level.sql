-- Seed access_levels table with common job roles and access levels
INSERT INTO access_levels (name, description)
SELECT * FROM (
    SELECT 'Admin', 'Administrator access level with full system access and configuration permissions' UNION ALL
    SELECT 'QA', 'Quality Assurance access level with testing and validation permissions' UNION ALL
    SELECT 'Developer', 'Developer access level with code development and deployment permissions' UNION ALL
    SELECT 'HR', 'Human Resources access level with employee management and recruitment permissions' UNION ALL
    SELECT 'Manager', 'Manager access level with team management and project oversight permissions' UNION ALL
    SELECT 'Designer', 'Design access level with UI/UX and creative asset management permissions' UNION ALL
    SELECT 'Analyst', 'Data Analyst access level with reporting and analytics permissions' UNION ALL
    SELECT 'Support', 'Customer Support access level with ticket management and user assistance permissions'
) AS new_access_levels
WHERE NOT EXISTS (SELECT 1 FROM access_levels LIMIT 1);