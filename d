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