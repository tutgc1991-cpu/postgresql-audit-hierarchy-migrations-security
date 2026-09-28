SELECT
    id,
    name,
    parent_id
FROM categories
ORDER BY id;

WITH RECURSIVE tree AS (
    SELECT
        id,
        name,
        parent_id,
        0 AS depth,
        name::TEXT AS path
    FROM categories
    WHERE parent_id IS NULL

    UNION ALL

    SELECT
        c.id,
        c.name,
        c.parent_id,
        t.depth + 1,
        t.path || ' > ' || c.name
    FROM categories c
    JOIN tree t
        ON c.parent_id = t.id
)
SELECT
    id,
    repeat('  ', depth) || name AS tree,
    depth,
    path
FROM tree
ORDER BY path;