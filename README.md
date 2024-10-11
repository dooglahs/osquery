# osquery Queries

Files in this repository are SQL queries designed for Kolide, an `osquery` based service. Following Kolide recommendations, each query is formatted as a Custom Check; I'll include a Live Query version if useful. Kolide has some rules around Custom Checks that should always be obeyed:

> All Kolide Checks must have a SQL query that meets these requirements:
> * When the query successfully runs it should always produce at least 1 row of data
> * Each row of data must have a column named "KOLIDE_CHECK_STATUS"
> * The KOLIDE_CHECK_STATUS contain "PASS", "FAIL", "UNKNOWN", or "ERROR"

Queries in this repository:

* `find_files_AND-OR_content.sql` allows you to search for files and/or file contents.
* `version_format_XdotYdotZ.sql` contains a Homebrew package search, gets the version with the format X.Y.Z and ensures the package is up to date.
