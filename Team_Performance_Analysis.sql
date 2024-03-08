/* Unique team name */

Select "Team1" as TeamName from total_matches
UNION
select "Team2" as TeamName from total_matches;

/*Winners of the finals for each season*/

SELECT "Season", "WinningTeam"
FROM total_matches
WHERE "MatchNumber" = 'Final'
ORDER BY "Season" desc;

/*Find the team with the most wins */ 
 
select "WinningTeam", COUNT(*) AS Wins FROM total_matches 
GROUP BY "WinningTeam" ORDER BY Wins DESC LIMIT 1;

/* Head to Head team records*/

SELECT "Team1","Team2",COUNT(*) AS Matches_Played,
    SUM(CASE WHEN "WinningTeam" = "Team1" THEN 1 ELSE 0 END) AS Team1_Wins,
    SUM(CASE WHEN "WinningTeam" = "Team2" THEN 1 ELSE 0 END) AS Team2_Wins,
    SUM(CASE WHEN "WinningTeam" IS NULL THEN 1 ELSE 0 END) AS Draws
FROM 
    total_matches
group by "Team1", "Team2" order by Matches_Played desc;

/* Team-wise wins, total matches played, and losses */

SELECT Team, total_played, wins, (total_played - wins) AS losses
FROM (
    SELECT Team, SUM(total_played) AS total_played, COALESCE(SUM(wins), 0) AS wins
    FROM (
        SELECT "Team1" AS Team, COUNT(*) AS total_played, 0 AS wins
        FROM total_matches
        GROUP BY "Team1"
        UNION ALL
        SELECT "Team2" AS Team, COUNT(*) AS total_played, 0 AS wins
        FROM total_matches
        GROUP BY "Team2"
        UNION ALL
        SELECT "WinningTeam" AS Team, 0 AS total_played, COUNT(*) AS wins
        FROM total_matches
        GROUP BY "WinningTeam"
    ) AS subquery
    GROUP BY Team
) AS final_data 
order by total_played desc ;


/* Team that won the most matches in each season and Team that won the final in that season*/

WITH season_wins AS (
    SELECT "Season", "WinningTeam", COUNT(*) AS Wins
    FROM total_matches
    GROUP BY "Season", "WinningTeam"
), season_most_wins AS (
    SELECT "Season", "WinningTeam"
    FROM (
        SELECT "Season", "WinningTeam", ROW_NUMBER() OVER (PARTITION BY "Season" ORDER BY Wins DESC) AS rn
        FROM season_wins
    ) t
    WHERE rn = 1
),
final_winners AS (
    SELECT "Season", "WinningTeam"
    FROM total_matches
    WHERE "MatchNumber" = 'Final'
)
SELECT smw."Season", smw."WinningTeam" AS MostWins, fw."WinningTeam" AS FinalWinner
FROM season_most_wins smw
LEFT JOIN final_winners fw ON smw."Season" = fw."Season" order by "Season" desc;

/*Number of times each team won the final*/

SELECT "WinningTeam", COUNT(*) AS Wins
FROM total_matches
WHERE "MatchNumber" = 'Final'
GROUP BY "WinningTeam" ORDER BY Wins DESC;   


/*Total toss Win by Teams*/

SELECT Team,COUNT(*) AS TossWins
FROM ( SELECT "Team1" AS Team
    FROM total_matches
    WHERE "TossWinner" = "Team1"
UNION ALL
SELECT "Team2" AS Team
    FROM total_matches
    WHERE "TossWinner" = "Team2"
) AS toss_data
group by Team order by TossWins desc;


/*Top 10 teams who has won with highest margin */

Select "WinningTeam" , "Margin" as WinByRun
from total_matches where "WonBy"='Runs'
order by "Margin" desc limit 10;
;
/*Teams which has won the Super Over Match */

select "Team1" , "Team2", "WinningTeam" from total_matches 
where "WonBy"='SuperOver';


/*When Team won the toss choose to bat and win the match*/
select count(*) from total_matches
where "TossWinner"="WinningTeam" and "TossDecision"='bat';

/*When Team won the toss choose to field and win the match*/
select count(*) from total_matches
where "TossWinner"="WinningTeam" and "TossDecision"='field';

/*Top 5 teams with the best success rate in Super Overs */
  
SELECT "WinningTeam", COUNT(*) AS SuperOverWins FROM total_matches
WHERE "SuperOver" = 'Y'
GROUP BY "WinningTeam"
ORDER BY SuperOverWins desc limit 5;















	
 








