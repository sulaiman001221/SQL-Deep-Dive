#!/usr/bin/env bash
# Builds the database from schema.sql, then runs every .sql file in queries/
# and prints each result. Works locally and in a GitLab CI job.
set -euo pipefail

DB="${DB:-w3schools.db}"
rm -f "$DB"
sqlite3 "$DB" < schema.sql

for f in queries/*.sql; do
  echo "=============== $f ==============="
  sqlite3 -header -column "$DB" < "$f"
  echo
done
