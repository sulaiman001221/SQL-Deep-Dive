# SQL practice (W3Schools-style tables)

A small SQLite database with the same table names as the W3Schools SQL tutorial:
Customers, Employees, Shippers, Categories, Suppliers, Products, Orders, OrderDetails.

## Option 1: Run locally

```bash
sudo apt install sqlite3        # macOS: brew install sqlite
bash run.sh                     # builds w3schools.db and prints every query in queries/
sqlite3 w3schools.db            # open an interactive shell
```

Inside the shell, try things like:

```sql
.headers on
.mode column
SELECT * FROM Products WHERE Price > 20;
```

Type `.quit` to exit.

## Option 2: See results in GitLab

1. Create a new GitLab project and push these files to it.
2. Each push starts a pipeline. Open the `run-sql` job log to see each query's output.
3. To add an exercise, create a new file in `queries/` (e.g. `02_joins.sql`). The next pipeline runs it too.

## Adding your own experiments

Put scratch queries in `queries/` or run them in the interactive shell.
Changing `schema.sql` or the sample rows and re-running `run.sh` rebuilds the database from scratch.

## Note on the data

The rows here are a small stand-in dataset, not the full W3Schools Northwind data.
Table and column names match W3Schools, so the tutorial queries should work.
