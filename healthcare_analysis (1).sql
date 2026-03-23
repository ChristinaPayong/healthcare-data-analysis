-- ============================================================
-- Healthcare Data Analysis — SQL Project
-- Author: Christina Payong
-- Description: Analysis of patient data, treatments and
--              hospital performance indicators
-- ============================================================


-- ============================================================
-- PART 1 — DATABASE SCHEMA CREATION
-- ============================================================

CREATE TABLE dim_patient (
    patient_id      INT PRIMARY KEY,
    age             INT,
    gender          VARCHAR(10),
    region          VARCHAR(50),
    insurance_type  VARCHAR(30)
);

CREATE TABLE dim_doctor (
    doctor_id       INT PRIMARY KEY,
    specialty       VARCHAR(50),
    department      VARCHAR(50),
    seniority_years INT
);

CREATE TABLE dim_treatment (
    treatment_id    INT PRIMARY KEY,
    treatment_name  VARCHAR(100),
    category        VARCHAR(50),
    avg_duration_days INT
);

CREATE TABLE dim_date (
    date_id         INT PRIMARY KEY,
    full_date       DATE,
    day             INT,
    month           INT,
    quarter         INT,
    year            INT,
    week_number     INT,
    is_weekend      BOOLEAN
);

CREATE TABLE fact_hospitalization (
    hospitalization_id  INT PRIMARY KEY,
    patient_id          INT REFERENCES dim_patient(patient_id),
    doctor_id           INT REFERENCES dim_doctor(doctor_id),
    treatment_id        INT REFERENCES dim_treatment(treatment_id),
    admission_date_id   INT REFERENCES dim_date(date_id),
    discharge_date_id   INT REFERENCES dim_date(date_id),
    length_of_stay      INT,
    total_cost          DECIMAL(10,2),
    readmission         BOOLEAN,
    satisfaction_score  INT
);


-- ============================================================
-- PART 2 — SAMPLE DATA INSERTION
-- ============================================================

INSERT INTO dim_patient VALUES
(1, 45, 'F', 'Île-de-France', 'Public'),
(2, 62, 'M', 'Auvergne-Rhône-Alpes', 'Private'),
(3, 38, 'F', 'Nouvelle-Aquitaine', 'Public'),
(4, 71, 'M', 'Occitanie', 'Complementary'),
(5, 29, 'F', 'Hauts-de-France', 'Public'),
(6, 55, 'M', 'Bretagne', 'Private'),
(7, 48, 'F', 'Île-de-France', 'Complementary'),
(8, 67, 'M', 'Provence-Alpes-Côte d Azur', 'Public'),
(9, 34, 'F', 'Grand Est', 'Private'),
(10, 59, 'M', 'Normandie', 'Public');

INSERT INTO dim_doctor VALUES
(1, 'Cardiology',    'Internal Medicine', 15),
(2, 'Oncology',      'Cancer Center',     22),
(3, 'Neurology',     'Neurosciences',      8),
(4, 'Orthopedics',   'Surgery',           12),
(5, 'Pulmonology',   'Internal Medicine',  6),
(6, 'Endocrinology', 'Internal Medicine', 18),
(7, 'Gastrology',    'Digestive System',  10),
(8, 'Dermatology',   'Dermatology',        4);

INSERT INTO dim_treatment VALUES
(1, 'Coronary angioplasty',    'Interventional cardiology', 5),
(2, 'Chemotherapy cycle',      'Oncology',                  7),
(3, 'MRI + neurological eval', 'Diagnostic neurology',      2),
(4, 'Hip replacement',         'Orthopedic surgery',        8),
(5, 'Respiratory therapy',     'Pulmonology',               4),
(6, 'Insulin management',      'Endocrinology',             3),
(7, 'Colonoscopy',             'Gastroenterology',          1),
(8, 'Biologic therapy',        'Dermatology',               6);

INSERT INTO dim_date VALUES
(20240101, '2024-01-01', 1,  1, 1, 2024, 1,  FALSE),
(20240115, '2024-01-15', 15, 1, 1, 2024, 3,  FALSE),
(20240201, '2024-02-01', 1,  2, 1, 2024, 5,  FALSE),
(20240215, '2024-02-15', 15, 2, 1, 2024, 7,  FALSE),
(20240301, '2024-03-01', 1,  3, 1, 2024, 9,  FALSE),
(20240315, '2024-03-15', 15, 3, 1, 2024, 11, FALSE),
(20240401, '2024-04-01', 1,  4, 2, 2024, 14, FALSE),
(20240415, '2024-04-15', 15, 4, 2, 2024, 16, FALSE),
(20240501, '2024-05-01', 1,  5, 2, 2024, 18, FALSE),
(20240515, '2024-05-15', 15, 5, 2, 2024, 20, FALSE),
(20240601, '2024-06-01', 1,  6, 2, 2024, 22, FALSE),
(20240615, '2024-06-15', 15, 6, 2, 2024, 24, TRUE),
(20240701, '2024-07-01', 1,  7, 3, 2024, 27, FALSE),
(20240715, '2024-07-15', 15, 7, 3, 2024, 29, FALSE),
(20240801, '2024-08-01', 1,  8, 3, 2024, 31, FALSE),
(20240815, '2024-08-15', 15, 8, 3, 2024, 33, FALSE),
(20240901, '2024-09-01', 1,  9, 3, 2024, 36, FALSE),
(20240915, '2024-09-15', 15, 9, 3, 2024, 38, TRUE),
(20241001, '2024-10-01', 1,  10,4, 2024, 40, FALSE),
(20241015, '2024-10-15', 15, 10,4, 2024, 42, FALSE);

INSERT INTO fact_hospitalization VALUES
(1,  1, 1, 1, 20240101, 20240115, 6,  8500.00, FALSE, 4),
(2,  2, 2, 2, 20240115, 20240201, 7,  12400.00, TRUE, 3),
(3,  3, 3, 3, 20240201, 20240215, 2,  3200.00, FALSE, 5),
(4,  4, 4, 4, 20240215, 20240301, 9,  15600.00, FALSE, 4),
(5,  5, 5, 5, 20240301, 20240315, 4,  4800.00, TRUE,  3),
(6,  6, 6, 6, 20240315, 20240401, 3,  2900.00, FALSE, 5),
(7,  7, 7, 7, 20240401, 20240415, 1,  1800.00, FALSE, 4),
(8,  8, 8, 8, 20240415, 20240501, 6,  7200.00, TRUE,  3),
(9,  9, 1, 1, 20240501, 20240515, 5,  9100.00, FALSE, 5),
(10, 10,2, 2, 20240515, 20240601, 8,  13800.00, FALSE, 4),
(11, 1, 3, 3, 20240601, 20240615, 3,  3600.00, FALSE, 5),
(12, 2, 4, 4, 20240615, 20240701, 7,  14200.00, TRUE,  2),
(13, 3, 5, 5, 20240701, 20240715, 4,  5100.00, FALSE, 4),
(14, 4, 6, 6, 20240715, 20240801, 2,  2700.00, FALSE, 5),
(15, 5, 7, 7, 20240801, 20240815, 1,  1600.00, FALSE, 4),
(16, 6, 8, 8, 20240815, 20240901, 5,  6800.00, TRUE,  3),
(17, 7, 1, 2, 20240901, 20240915, 6,  10200.00, FALSE, 5),
(18, 8, 2, 3, 20240915, 20241001, 4,  4400.00, FALSE, 4),
(19, 9, 3, 4, 20241001, 20241015, 8,  16100.00, FALSE, 5),
(20, 10,4, 5, 20241015, 20241015, 3,  3900.00, TRUE,  3);


-- ============================================================
-- PART 3 — ANALYTICAL QUERIES
-- ============================================================

-- Query 1: Average length of stay and cost by specialty
SELECT
    doc.specialty,
    COUNT(h.hospitalization_id)         AS total_hospitalizations,
    ROUND(AVG(h.length_of_stay), 1)     AS avg_length_of_stay,
    ROUND(AVG(h.total_cost), 2)         AS avg_cost,
    ROUND(SUM(h.total_cost), 2)         AS total_revenue
FROM fact_hospitalization h
JOIN dim_doctor doc ON h.doctor_id = doc.doctor_id
GROUP BY doc.specialty
ORDER BY total_revenue DESC;


-- Query 2: Readmission rate by treatment category
SELECT
    t.category                                          AS treatment_category,
    COUNT(h.hospitalization_id)                         AS total_cases,
    SUM(CASE WHEN h.readmission THEN 1 ELSE 0 END)     AS readmissions,
    ROUND(
        100.0 * SUM(CASE WHEN h.readmission THEN 1 ELSE 0 END)
        / COUNT(h.hospitalization_id), 1
    )                                                   AS readmission_rate_pct
FROM fact_hospitalization h
JOIN dim_treatment t ON h.treatment_id = t.treatment_id
GROUP BY t.category
ORDER BY readmission_rate_pct DESC;


-- Query 3: Monthly cost trend with running total
SELECT
    d.year,
    d.month,
    ROUND(SUM(h.total_cost), 2)                     AS monthly_cost,
    ROUND(SUM(SUM(h.total_cost)) OVER (
        PARTITION BY d.year
        ORDER BY d.month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ), 2)                                            AS cumulative_cost_ytd
FROM fact_hospitalization h
JOIN dim_date d ON h.admission_date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;


-- Query 4: Patient segmentation by age group and insurance type
SELECT
    CASE
        WHEN p.age < 40 THEN '18-39'
        WHEN p.age BETWEEN 40 AND 59 THEN '40-59'
        ELSE '60+'
    END                                             AS age_group,
    p.insurance_type,
    COUNT(h.hospitalization_id)                     AS hospitalizations,
    ROUND(AVG(h.total_cost), 2)                     AS avg_cost,
    ROUND(AVG(h.satisfaction_score), 1)             AS avg_satisfaction
FROM fact_hospitalization h
JOIN dim_patient p ON h.patient_id = p.patient_id
GROUP BY age_group, p.insurance_type
ORDER BY age_group, p.insurance_type;


-- Query 5: Top 3 most expensive treatments per department
WITH ranked_treatments AS (
    SELECT
        doc.department,
        t.treatment_name,
        ROUND(AVG(h.total_cost), 2)                 AS avg_cost,
        COUNT(h.hospitalization_id)                 AS cases,
        RANK() OVER (
            PARTITION BY doc.department
            ORDER BY AVG(h.total_cost) DESC
        )                                           AS cost_rank
    FROM fact_hospitalization h
    JOIN dim_doctor doc  ON h.doctor_id    = doc.doctor_id
    JOIN dim_treatment t ON h.treatment_id = t.treatment_id
    GROUP BY doc.department, t.treatment_name
)
SELECT department, treatment_name, avg_cost, cases
FROM ranked_treatments
WHERE cost_rank <= 3
ORDER BY department, cost_rank;


-- Query 6: Patient satisfaction analysis — low scores alert
SELECT
    p.patient_id,
    p.age,
    p.region,
    doc.specialty,
    t.treatment_name,
    h.satisfaction_score,
    h.readmission,
    h.total_cost
FROM fact_hospitalization h
JOIN dim_patient   p   ON h.patient_id   = p.patient_id
JOIN dim_doctor    doc ON h.doctor_id    = doc.doctor_id
JOIN dim_treatment t   ON h.treatment_id = t.treatment_id
WHERE h.satisfaction_score <= 3
ORDER BY h.satisfaction_score, h.total_cost DESC;


-- Query 7: KPI summary dashboard
SELECT
    COUNT(h.hospitalization_id)                                 AS total_hospitalizations,
    COUNT(DISTINCT h.patient_id)                                AS unique_patients,
    ROUND(AVG(h.length_of_stay), 1)                            AS avg_length_of_stay_days,
    ROUND(AVG(h.total_cost), 2)                                AS avg_cost_per_stay,
    ROUND(SUM(h.total_cost), 2)                                AS total_revenue,
    ROUND(100.0 * SUM(CASE WHEN h.readmission THEN 1 ELSE 0 END)
        / COUNT(h.hospitalization_id), 1)                      AS global_readmission_rate_pct,
    ROUND(AVG(h.satisfaction_score), 2)                        AS avg_satisfaction_score
FROM fact_hospitalization h;
