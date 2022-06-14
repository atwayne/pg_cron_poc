## Introduction

This is a PoC regarding how to run `pg_cron` based cron jobs within a postgres container.


## Get started

```bash
# Build a new docker image, based on the offical postgres image, with 
docker build -t atwayne/pgcron_poc .

# start a postgres instance
docker run --name local-pgcron-poc -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d atwayne/pgcron_poc
```


## Example
1. Create a new table `events` with `create-table.sql`  
2. Create cron jobs with `add-cron-jobs.sql`

With the example scripts above, there will be a table `events` with two columns:

|Column|Type|  
|-|-|
|event_time|timestamp with time zone|
|event_id |uuid|

Two cron jobs have been created, the first one will insert a random row with the current timestamp, meanwhile the second one will delete all rows that were created two minutes ago.

Give it a few minutes and check the table with
```sql
SELECT * FROM events
```

It's expected that there will be 2-3 rows in the table created in the last 3 minutes.


To stop the example scheduling jobs
```sql
SELECT cron.unschedule('cron_insert_every_minute');
SELECT cron.unschedule('cron_cleanup_every_minute');
```
## Links

1. pg_cron
https://github.com/citusdata/pg_cron

2. crontab.guru
https://crontab.guru/


3. Credit to a StackOverflow answer
https://stackoverflow.com/a/69495449/553073
