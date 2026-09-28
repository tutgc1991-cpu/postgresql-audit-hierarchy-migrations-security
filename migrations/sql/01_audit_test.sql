SELECT
    id,
    name,
    email,
    enrolled_on
FROM students
ORDER BY id;

UPDATE students
SET name = 'Kofi M.'
WHERE id = 1;

DELETE FROM students
WHERE id = 3;

INSERT INTO students (
    name,
    email,
    enrolled_on
)
VALUES (
    'Yaw Mensah',
    'yaw@example.com',
    CURRENT_DATE
);

SELECT
    id,
    tbl,
    op,
    old_row->>'name' AS was,
    new_row->>'name' AS now,
    old_row->>'email' AS old_email,
    new_row->>'email' AS new_email,
    changed_by,
    at
FROM audit_log
ORDER BY id DESC;