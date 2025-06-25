-- Create schemas for each layer
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS core;
CREATE SCHEMA IF NOT EXISTS mart;


-- Raw Layer: Table for storing raw JSON data from APIs
CREATE TABLE IF NOT EXISTS raw.raw_data (
    id SERIAL PRIMARY KEY,
    raw_data_int INT NOT NULL,
    raw_data_varchar VARCHAR(255) NOT NULL,
    raw_data_json JSONB NOT NULL,
    is_processed BOOLEAN DEFAULT FALSE,
    ingestion_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Core Layer: Fact and dimension tables
CREATE TABLE dim_dates (
    date_id DATE PRIMARY KEY,
    year INTEGER,
    month INTEGER,
    day INTEGER,
    quarter INTEGER,
    day_of_week INTEGER,
    day_name TEXT,
    is_weekend BOOLEAN
);


INSERT INTO dim_dates (date_id, year, month, day, quarter, day_of_week, day_name, is_weekend)
SELECT
    d::DATE AS date_id,
    EXTRACT(YEAR FROM d)::INT AS year,
    EXTRACT(MONTH FROM d)::INT AS month,
    EXTRACT(DAY FROM d)::INT AS day,
    EXTRACT(QUARTER FROM d)::INT AS quarter,
    EXTRACT(DOW FROM d)::INT AS day_of_week,
    TO_CHAR(d, 'Day') AS day_name,
    CASE WHEN EXTRACT(DOW FROM d) IN (0, 6) THEN TRUE ELSE FALSE END AS is_weekend
FROM generate_series('2020-01-01'::DATE, '2030-12-31'::DATE, INTERVAL '1 day') AS d;


CREATE TABLE IF NOT EXISTS core.fact_data (
    fact_id SERIAL PRIMARY KEY,
    date_id date NOT NULL,
    FOREIGN KEY (date_id) REFERENCES core.dim_dates(date_id),
);


-- Mart Layer: Views for reporting and analysis
CREATE VIEW IF NOT EXISTS mart.vw_fact_data AS
SELECT 
    f.fact_id,
    d.date_id,
    d.year,
    d.month,
    d.day,
    d.quarter,
    d.day_of_week,
    d.day_name,
    d.is_weekend
FROM core.fact_data f
JOIN core.dim_dates d ON f.date_id = d.date_id;

-- Grant permissions to public role
GRANT ALL PRIVILEGES ON SCHEMA raw TO public;
GRANT ALL PRIVILEGES ON SCHEMA staging TO public;
GRANT ALL PRIVILEGES ON SCHEMA serving TO public;