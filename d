SELECT
    Location_Name,
    ROOM_NAME,
    DOW,
    Start_Date,
    End_Date,
    PrimeTime_Start_Time,
    PrimeTime_End_Time,
    PT_START,
    PT_END,
    TIMESTART,
    TIMEEND,
    IS_PRIME_DAY,
    IS_PRIME_TIME,
    PRIME_TIME_MIN,
    Staffed_Available_Minutes
FROM dev.clinical_periop_dp.periop_primetime_or
LIMIT 20;



SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT PRIME_TIME_MIN) AS distinct_prime_time_values,
    COUNT(DISTINCT Staffed_Available_Minutes) AS distinct_staffed_minutes
FROM dev.clinical_periop_dp.periop_primetime_or;



SELECT
    Location_Name,
    ROOM_NAME,
    CASE_SURGERY_DATE,
    Staffed_Available_Minutes,
    SUM(PRIME_TIME_MIN) AS total_prime_time_min,
    COUNT(*) AS row_count
FROM dev.clinical_periop_dp.periop_primetime_or
WHERE CASE_SURGERY_DATE IS NOT NULL
GROUP BY
    Location_Name,
    ROOM_NAME,
    CASE_SURGERY_DATE,
    Staffed_Available_Minutes
ORDER BY
    CASE_SURGERY_DATE,
    Location_Name,
    ROOM_NAME
LIMIT 20;