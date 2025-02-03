-- Create schemas for each layer
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS serving;


-- Raw Layer: Table for storing raw JSON data from APIs
CREATE TABLE IF NOT EXISTS raw.raw_data (
    id SERIAL PRIMARY KEY,
    raw_data_int INT NOT NULL,
    raw_data_varchar VARCHAR(255) NOT NULL,
    raw_data_json JSONB NOT NULL,
    is_processed BOOLEAN DEFAULT FALSE,
    ingestion_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Staging Layer: Tables for cleaning and processing data
CREATE TABLE IF NOT EXISTS staging.staging_data (
    id SERIAL PRIMARY KEY,
    staging_data_int INT NOT NULL,
    staging_data_varchar VARCHAR(255) NOT NULL,
    staging_datetime_utc TIMESTAMP NOT NULL,
);

-- Serving Layer: Fact and dimension tables
CREATE TABLE IF NOT EXISTS serving.dim_date (
    date_id BIGINT PRIMARY KEY,
    year INT NOT NULL,
    quarter INT NOT NULL,
    month INT NOT NULL,
    number_of_week INT NOT NULL,
    day INT NOT NULL,
    day_of_week INT NOT NULL,
    day_name VARCHAR(10) NOT NULL,
    is_weekend BOOLEAN
);


CREATE TABLE IF NOT EXISTS serving.fact_data (
    fact_id SERIAL PRIMARY KEY,
    datetime_utc TIMESTAMP NOT NULL,
    datetime_local TIMESTAMP NOT NULL,
    date_local_id BIGINT NOT NULL,
    data_type VARCHAR(255) NOT NULL,
    data_value FLOAT NOT NULL,
    FOREIGN KEY (date_local_id) REFERENCES serving.dim_date(date_id),
    CONSTRAINT fw_city_date_utc_unique UNIQUE (city_id, datetime_utc)
);


-- Grant permissions to public role
GRANT ALL PRIVILEGES ON SCHEMA raw TO public;
GRANT ALL PRIVILEGES ON SCHEMA staging TO public;
GRANT ALL PRIVILEGES ON SCHEMA serving TO public;