-- Create the database only if it doesn't exist
DO $$ 
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'lf_fundb') THEN
      CREATE DATABASE lf_fundb;
   END IF;
END $$;

-- Connect to the database
\c lf_fundb;

-- Create the users table only if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INT
);

-- Insert sample rows only if they don’t already exist
INSERT INTO users (first_name, last_name, age)
SELECT 'Freddie', 'Meyers', 28
WHERE NOT EXISTS (SELECT 1 FROM users WHERE first_name = 'Freddie' AND last_name = 'Meyers');

INSERT INTO users (first_name, last_name, age)
SELECT 'Lizzie', 'Coady', 29
WHERE NOT EXISTS (SELECT 1 FROM users WHERE first_name = 'Lizzie' AND last_name = 'Coady');
