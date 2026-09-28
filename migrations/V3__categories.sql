CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    parent_id INT REFERENCES categories(id)
);

INSERT INTO categories (name, parent_id)
SELECT 'Electronics', NULL
WHERE NOT EXISTS (
    SELECT 1 FROM categories WHERE name = 'Electronics'
);

INSERT INTO categories (name, parent_id)
SELECT 'Computers', e.id
FROM categories e
WHERE e.name = 'Electronics'
AND NOT EXISTS (
    SELECT 1 FROM categories WHERE name = 'Computers'
);

INSERT INTO categories (name, parent_id)
SELECT 'Laptops', c.id
FROM categories c
WHERE c.name = 'Computers'
AND NOT EXISTS (
    SELECT 1 FROM categories WHERE name = 'Laptops'
);

INSERT INTO categories (name, parent_id)
SELECT 'Phones', e.id
FROM categories e
WHERE e.name = 'Electronics'
AND NOT EXISTS (
    SELECT 1 FROM categories WHERE name = 'Phones'
);