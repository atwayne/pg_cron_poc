CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pg_cron;

SELECT cron.schedule('cron_insert_every_minute','* * * * *', $$INSERT INTO EVENTS(EVENT_TIME,EVENT_ID) VALUES (NOW(),UUID_GENERATE_V4())$$);
SELECT cron.schedule('cron_cleanup_every_minute','* * * * *', $$DELETE FROM events WHERE event_time < now() - interval '2 minutes'$$);

