--- Query where version is in format x.y.z
--- This query is specific to finding Homebrew installations of the xz and liblzma packages
--- to determine if there are any vulnerable installs.

--- OSQuery has a version_compare(left, right) function with the following results:
--- left < right = -1
--- left = right = 0
--- left > right = 1

--- Live Query version:

SELECT name, version,
  CASE
    WHEN version_compare(version, '5.6.1') < 1 THEN "Vulnerable"
    ELSE "NOT vulnerable"
  END "status"
FROM homebrew_packages
WHERE name = 'xz' OR name = 'liblzma';

--- Check version:

SELECT name, version,
  CASE
    WHEN version_compare(version, '5.6.1') = 1 THEN 'PASS'
    WHEN version_compare(version, '5.6.1') < 1 THEN 'FAIL'
    ELSE 'UNKNOWN'
  END AS KOLIDE_CHECK_STATUS
FROM homebrew_packages
WHERE name = 'xz' OR name = 'liblzma';