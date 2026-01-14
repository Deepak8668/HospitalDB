DELETE FROM hive_metastore.sndbx_shsra.DANELLE d
WHERE NOT (
  d.DiagComment = 'First Pass'
  AND EXISTS (
    SELECT 1
    FROM hive_metastore.sndbx_shsra.DANELLE x
    WHERE x.MemberID = d.MemberID
      AND x.FileName = d.FileName
      AND upper(x.DiagComment) IN ('HCC VALID', 'UNLINKED MEDICATION')
  )
);