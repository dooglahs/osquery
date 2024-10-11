--- Finding files by filename and/or file content.
--- Mangled from the 1Password Emergency Kit search

WITH
  _find_files AS (
    SELECT uid, f.path, f.btime AS file_created_epoch, datetime(f.btime, 'unixepoch') AS file_created
    FROM file AS f
      JOIN mdfind md ON md.path = f.path
      AND md.query = "kMDItemTextContent = '#!/bin/bash' && kMDItemFSName = 'test.sh'"
    WHERE
      f.path NOT LIKE '%/DriveFS/Logs/%.txt'
---   AND f.path NOT LIKE '%.js'
      AND f.path NOT LIKE '%.log%'
  )
SELECT unix_time, xyz.*,
  CASE
    WHEN path IS NULL THEN 'PASS'
    ELSE 'FAIL'
  END AS KOLIDE_CHECK_STATUS
FROM time LEFT JOIN _find_files xyz;

--- The md.query can use the logic of && or ||
--- ie.
--- md.query = "kMDItemFSName = 'health_check.sh' || kMDItemFSName = 'avE.js' || kMDItemFSName = 'pdApp.js' || kMDItemFSName = 'ubha.js'"