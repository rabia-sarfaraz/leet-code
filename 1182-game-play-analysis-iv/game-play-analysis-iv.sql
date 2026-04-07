SELECT 
    ROUND(
        COUNT(DISTINCT a.player_id)::decimal /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
    2) AS fraction
FROM Activity a
WHERE (a.player_id, a.event_date) IN (
    SELECT player_id, MIN(event_date) + INTERVAL '1 day'
    FROM Activity
    GROUP BY player_id
);