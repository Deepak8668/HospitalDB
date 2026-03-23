Hi Jeanine,

C2C (Corp-to-Corp) means I would work through my existing employer/vendor instead of being paid directly on W2. Your organization would contract with my employer, and they would handle my payroll.

This way, no sponsorship is required from your side.

Please let me know if this is something your team can consider—I’d be happy to provide more details.



SELECT 
  f1.`Chart ID`,
  f1.`OIG Sample Number`,
  f1.`Payment Year`,
  f1.`BENE SK`,
  f1.`Contract Number`,
  f1.`HIC Number`,
  f1.`MBI ID`,
  f1.`DOB`,
  f1.`Last Name`,
  f1.`First Name`,
  f1.`HCC`,
  f1.`HCC Description`
FROM whole_data f1

UNION ALL

SELECT DISTINCT
  f1.`Chart ID`,
  f1.`OIG Sample Number`,
  f1.`Payment Year`,
  f1.`BENE SK`,
  f1.`Contract Number`,
  f1.`HIC Number`,
  f1.`MBI ID`,
  f1.`DOB`,
  f1.`Last Name`,
  f1.`First Name`,
  f2.`CMS-HCC-V22` AS `HCC`,
  NULL AS `HCC Description`
FROM reveleer_data f2
JOIN whole_data f1
  ON f1.`OIG Sample Number` = f2.`Sample`
WHERE NOT EXISTS (
  SELECT 1
  FROM whole_data x
  WHERE x.`OIG Sample Number` = f2.`Sample`
    AND x.`HCC` = f2.`CMS-HCC-V22`
);