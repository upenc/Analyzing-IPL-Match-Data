select * from total_matches
select * from "Ball_by_Ball"

/* Total Team played so far */

Select "Team1" as TeamName from total_matches
UNION
select "Team2" as TeamName from total_matches;

/* total number of matches */
SELECT COUNT(*) AS Total_Matches FROM total_matches;

/* Total Matches Played Each Season */
select "Season", count("MatchNumber") total_match from total_matches 
group by "Season" 
order by "Season"


/* List all unique cities where matches have been played */ 

SELECT DISTINCT "City" FROM total_matches;


/* Matches by Venue and City */
select "City" ,"Venue", count("MatchNumber") total_match from total_matches 
group by "City","Venue" 
order by "total_match" desc


/* List matches where a Super Over was played */
SELECT * FROM total_matches WHERE "SuperOver" = 'Y';


/* Calculate the average first innings score for each city */

WITH FirstInningsScores AS (
      SELECT "City", 
             CASE WHEN "TossDecision" = 'bat' THEN "Team1" ELSE "Team2" END AS BattingTeam,
             "Margin"
      FROM total_matches
      WHERE "WonBy" = 'Runs'
    )
    SELECT "City", AVG("Margin") AS AverageScore
    FROM FirstInningsScores
    GROUP BY "City"
    ORDER BY AverageScore DESC;
	
/* Calculate Average Match Duration by Season, Venue  */

SELECT tm."Venue",b."innings",tm."Season", AVG(b."overs") AS Avg_Match_Duration
FROM total_matches tm join "Ball_by_Ball" b on tm."ID"=b."ID"  
GROUP BY tm."Season",tm."Venue",b."innings";

/* Identify Matches with High-Scoring Run Chases in Play offs */
SELECT 
    "MatchNumber", "Team1", "Team2", "WinningTeam","WonBy" , "Margin"
FROM 
    total_matches
WHERE "WonBy" = 'Wickets' AND "Margin" >= 7 
and "MatchNumber" IN ('Qualifier 1', 'Qualifier 2', 'Eliminator', 'Final') 
order by "Margin" desc;




/* Identify Matches with best defends in Play offs */

SELECT 
    "MatchNumber", "Team1", "Team2", "WinningTeam","WonBy" , "Margin"
FROM 
    total_matches
WHERE "WonBy" = 'Runs' AND "Margin" >=40 
	AND "MatchNumber" IN ('Qualifier 1', 'Qualifier 2', 'Eliminator', 'Final')
order by "Margin" desc;
	

/* Average Margin of Victory by Team */


SELECT "Team", AVG("Margin") AS AvgMargin
FROM 
    ( SELECT "Team1" AS "Team", "Margin"
        FROM total_matches
        WHERE "WonBy" = 'Runs'
        UNION ALL
        SELECT 
            "Team2" AS "Team","Margin"
        FROM total_matches
        WHERE "WonBy" = 'Runs'
    ) AS subquery
GROUP BY "Team" 
order by AvgMargin desc ;


/* Matches with Close Margins of Victory */

SELECT "MatchNumber", "Team1", "Team2", "WinningTeam", "Margin"
FROM total_matches
WHERE "WonBy" = 'Runs'AND "Margin" BETWEEN 1 AND 10; 


/*Toss Empact*/

/*the number of wins by toss decision (bat/field) across all seasons*/    

SELECT "TossDecision", "Season", COUNT(*) AS Wins FROM total_matches 
WHERE "WinningTeam" = "TossWinner" GROUP BY "Season", "TossDecision";


/*Top Teams who have won the most Toss*/
SELECT Team,SUM(CASE WHEN "TossWinner"= Team THEN 1 ELSE 0 END) AS TossWin
FROM (
    SELECT "Team1" AS Team, "TossWinner" FROM total_matches
    UNION ALL
    SELECT "Team2" AS Team, "TossWinner" FROM total_matches
) AS teams
GROUP BY Team
ORDER BY TossWin DESC limit 10;

/*teams win matches based on their toss decision (batting first or fielding first)*/
SELECT "TossDecision",COUNT(*) AS Matches,
    SUM(CASE WHEN "TossDecision" = 'bat' AND "WinningTeam" = "TossWinner" THEN 1
             WHEN "TossDecision" = 'field' AND "WinningTeam" != "TossWinner" THEN 1
             ELSE 0 END) AS Wins
FROM total_matches
GROUP BY "TossDecision";

/*The impact of the toss decision varies based on the venue*/
SELECT "Venue","TossDecision",COUNT(*) AS Matches,
    SUM(CASE WHEN "TossDecision" = 'bat' AND "WinningTeam" = "TossWinner" THEN 1
             WHEN "TossDecision" = 'field' AND "WinningTeam" != "TossWinner" THEN 1
             ELSE 0 END) AS Wins
FROM total_matches
GROUP BY "Venue", "TossDecision";







