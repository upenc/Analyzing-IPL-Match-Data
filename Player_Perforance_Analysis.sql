/*Top 10 players with the most "Player of the Match" awards*/

select distinct "Player_of_Match" , count("Player_of_Match") as TotalWon 
from total_matches 
group by "Player_of_Match"
order by TotalWon desc limit 10;


/*all players who have been Player of the Match more than 5 time in a Single Season */

select "Player_of_Match","Season", COUNT(*) AS Awards FROM total_matches 
GROUP BY "Player_of_Match","Season" HAVING COUNT(*) >= 5 order by Awards desc;


/*Top 10 Batsman From 2008 to 2022*/
select "batter", sum("total_run") as RunScored from "Ball_by_Ball" group by "batter" 
order by Scored desc limit 10;


/*Top 10 wicket taker Bowler and OverBowled */
SELECT "bowler",SUM(CASE WHEN "isWicketDelivery" = 1 THEN 1 ELSE 0 END) AS WicketsTaken,
    COUNT(*)/6 AS OversBowled
FROM "Ball_by_Ball"
GROUP BY "bowler"
ORDER BY WicketsTaken DESC
LIMIT 10;


/*Players who have won the Player of the Match award in both batting and bowling categories 
*/

SELECT tm."Player_of_Match",tm."WinningTeam"
FROM total_matches tm JOIN "Ball_by_Ball" b ON tm."ID" = b."ID"
WHERE tm."Player_of_Match" = b."batter" or tm."Player_of_Match" = b."bowler" 
GROUP BY tm."Player_of_Match",tm."WinningTeam" 
HAVING 
    COUNT(DISTINCT CASE WHEN tm."Player_of_Match" = b."batter" THEN 'batter'
                        WHEN tm."Player_of_Match" = b."bowler" THEN 'bowler' END) = 2;
;
/*Player who have won player of match in the Final*/
select "Player_of_Match","Season" FROM total_matches where "MatchNumber"='Final'
GROUP BY "Player_of_Match","Season" order by "Season" desc ;


/*Player who have won player of match in the playoffs*/
select "Player_of_Match","Season" ,"MatchNumber" as PlayoffsMatches  FROM total_matches
WHERE "MatchNumber" IN ('Qualifier 1', 'Qualifier 2', 'Eliminator', 'Final')
GROUP BY "Player_of_Match","Season" ,"MatchNumber" order by "Season" desc ;


