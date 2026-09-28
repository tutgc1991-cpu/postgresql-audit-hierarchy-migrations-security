CREATE TABLE IF NOT EXISTS students (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    enrolled_on DATE DEFAULT CURRENT_DATE
);

INSERT INTO students (name, email, enrolled_on)
VALUES
    ('Kofi Mensah', 'kofi@example.com', '2026-09-01'),
    ('Ama Boateng', 'ama@example.com', '2026-09-02'),
    ('Kwame Asante', 'kwame@example.com', '2026-09-03')
ON CONFLICT (email) DO NOTHING;