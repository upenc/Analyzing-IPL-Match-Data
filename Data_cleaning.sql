/* Data Exploration and Data cleaning*/
/* Table : total_matches */
select * from total_matches order by "Season" desc

SELECT *
FROM total_matches
WHERE "City" IS NULL;

UPDATE total_matches
SET "City"= COALESCE("City", 'Dubai');

SELECT *
FROM total_matches
WHERE "WinningTeam" IS NULL;

UPDATE total_matches
SET "WinningTeam" = 'None'
WHERE "WinningTeam" IS NULL;


UPDATE total_matches
SET "Player_of_Match" = 'None'
WHERE "Player_of_Match" IS NULL;

UPDATE total_matches
SET "SuperOver" = 'N'
WHERE "SuperOver" IS NULL;

SELECT *
FROM total_matches
WHERE "Margin" IS NULL;

UPDATE total_matches
SET "Margin" = '0'
WHERE "Margin" IS NULL;

/* Table : Ball_by_Ball*/

select * from "Ball_by_Ball"

ALTER TABLE "Ball_by_Ball"
DROP COLUMN "extra_type",
DROP COLUMN "player_out",
DROP COLUMN "kind",
DROP COLUMN "fielders_involved";





