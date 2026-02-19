SELECT t.*
FROM your_table t
WHERE
    -- Return only these payer types in output
    (
        t.payer = 'Revilier'
        OR (
            t.payer IN ('USDHP', 'both Revilier and USD')
            AND t.dos_from IS NOT NULL AND TRIM(CAST(t.dos_from AS STRING)) <> ''
            AND t.dos_to   IS NOT NULL AND TRIM(CAST(t.dos_to   AS STRING)) <> ''
        )
    )
    -- Patient must qualify:
    AND EXISTS (
        SELECT 1
        FROM your_table x
        WHERE x.member_id = t.member_id
          AND x.payer = 'Revilier'
    )
    AND EXISTS (
        SELECT 1
        FROM your_table y
        WHERE y.member_id = t.member_id
          AND y.payer IN ('USDHP', 'both Revilier and USD')
          AND y.dos_from IS NOT NULL AND TRIM(CAST(y.dos_from AS STRING)) <> ''
          AND y.dos_to   IS NOT NULL AND TRIM(CAST(y.dos_to   AS STRING)) <> ''
    );