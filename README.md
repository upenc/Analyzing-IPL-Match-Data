<h1 align="center"><font color=#ff6200> IPL (2008 to 2022) Analysis Using SQL</font></h1>
Explore the exciting world of Indian Premier League (IPL) through this data analysis project!


The Indian Premier League (IPL) is a professional Twenty20 cricket league in India, sanctioned by the Board of Control for Cricket in India (BCCI). It was founded in 2008 and has since become one of the most popular and lucrative cricket leagues globally.
IPL's combination of high-quality cricket, star power, entertainment, and commercial success has firmly established it as one of the premier sporting events globally, shaping the future of cricket and inspiring millions of fans worldwide.

<h2 align="center"><font color=#ff6200>Table of Contents:</font></h2>
    
* Step 1 | Introduction
* Step 2 | Dataset Overview
* Step 3 | Uploading Dataset into Postgres Database
* Step 4 | Data Cleaning & Transformation
* Step 5 | Match Overview AND TossEmpact
* Step 6 | Player Performance Analysis
* Step 7 | Team Performance Analysis

**Introduction to the dataset:** IPL match data spanning from 2008 to 2022.

* **Total_matches details:** The dataset contains information about cricket matches, including details such as the match ID, city, date, season, match number, teams involved, venue, toss winner, toss decision, whether a super over occurred, the winning team, win margin, player of the match, team players, and umpires.
   
* **ball-by-ball information:** The dataset contains detailed ball-by-ball information for cricket matches, including the ID of the delivery, innings, over and ball number, batter and bowler names, runs scored, extras, total runs for the delivery, whether it was a wicket delivery, the kind of dismissal, and the batting team.

**Data Exploration:** 
* Explored the dataset and uploaded it to the PostgreSQL database for further analysis using a Python script.

**Handling Null Values**

All null values in the dataset have been addressed:
* 'City' column: Filled with 'Dubai' for consistency.'SuperOver' column:
* Filled with 0 for clarity (mapped 'N' to 0).'Margin' column: Filled with 0.
* 'Season' column: No null values after conversion.
* 'Player_of_Match' column: Filled with 'None'.
* 'WinningTeam' column: Filled with 'None'.
* 'Method' column: Dropped to eliminate high null count.

## Match Overview
- Total number of matches : **950**
- Total Matches Played Each Season
- * MAX **76** in 2013.
  * MIN **57** in 2009.
    
**Toss Wins:**
- **Mumbai Indians** lead in winning tosses, showcasing a strategic advantage before matches.
- Highest number of toss wins: **Mumbai Indians (123)**
- Teams have primarily chosen to field after winning the toss in the majority of matches.
- * **599** matches where teams opted to field first.
  * **351** matches where teams opted to bat first.
-  Despite the higher frequency of teams choosing to field, the data reveals that teams opting to bat first have secured a notable number of wins (**159**) compared to teams fielding first (**269**).

**Venue Analysis:**
- The IPL matches have been played in various cities across **India** and **abroad**, totaling **32** cities in all.
- Teams exhibit venue-specific strengths, with **Mumbai Indians** excelling at Wankhede Stadium.
- Top 5 Venues By Match
- * "Kolkata"	"Eden Gardens"	**77**
- * "Mumbai"	"Wankhede Stadium"	**73**
- * "Bangalore"	"M Chinnaswamy Stadium" **65**
- * "Delhi"	"Feroz Shah Kotla"	**60**
- * "Hyderabad"	"Rajiv Gandhi International Stadium, Uppal"	**49**

**PlayOffs Analysis**
- the data demonstrates **Chennai Super Kings' exceptional performance in the playoffs, whether through batting or bowling**.
- Chennai Super Kings emerged victorious in the final match against Sunrisers Hyderabad, winning by 8 wickets.
- Gujarat Titans, Rajasthan Royals, and Kolkata Knight Riders also secured wins in playoff matches by 7 wickets each.
- Chennai Super Kings emerged victorious in the playoffs match against Delhi Daredevils, winning by 86 runs.
- Royal Challengers Bangalore (71 ),  Mumbai Indians (57 ) also secured wins in playoff matches , each by more than 50 runs.

**Margin Analysis**
- In the top 5 most margin wins, **Royal Challengers Bangalore** has three instances, emphasizing their dominance in high-margin victories.
- High margin wins ratio for specific teams:
  - **Chennai Super Kings (CSK)**: 20.37
  - **Lucknow Super Giants (LSG)**: 20.11
  - **Mumbai Indians (MI)**: 19.62
- In a closely contested match, **Lucknow Super Giants** managed to edge out Kolkata Knight Riders by a **narrow margin** of** 2 runs**.

## Player Performance:

 **AB de Villiers** (25) emerge as the top players, frequently earning the "Player of the Match" awards.
 - **CH Gayle**: 22 , **RG Sharma**: 18 ,  **MS Dhoni**: 17 , **V Kohli**: 14
  - Player With 5 or more "Player of the Match" in a one Season
  - * Chris Gayle demonstrated his dominance by securing the "Player of the Match" award **6 times** in the **2011** season and **5 times** in the** 2012** season.
    * **MEK Hussey**, **SE Marsh**, and **Virat Kohli** also attained the "Player of the Match" award 5 times each
 - **Virat Kohli** stands atop the list of IPL run-scorers with an impressive total of **6876** runs.
 - **DJ Bravo** leads the IPL's all-time wicket-takers list with an impressive tally of **207** wickets in **549** Overs.
   

## Team Performance:
- Total unique teams played in IPL: **18**.

Rising Pune Supergiants , Delhi Daredevils , Kings XI Punjab , Deccan Chargers , Kolkata Knight Riders , Lucknow Super Giants , Gujarat Titans , Rising Pune Supergiant , Chennai Super Kings , Kochi Tuskers Kerala , Punjab Kings , Gujarat Lions , Royal Challengers Bangalore , Delhi Capitals , Mumbai Indians , Pune Warriors , Rajasthan Royals , Sunrisers Hyderabad.

- **Mumbai Indians** stand out as the most successful team with the highest number of overall wins and final victories.
- **Kolkata Knight Riders** and **Chennai Super Kings** also have notable performance, consistently securing wins.
- In most IPL seasons, the team with the highest number of wins during the regular season also emerged as the final winner, indicating a consistent trend of regular-season dominance translating into playoff success.
- **Delhi Capitals** and **Kings XI Punjab** boast the best winning records in **super over** matches

## More Detailed SQL Queries and Analysis
For more detailed SQL queries and analysis, please refer to the [Player Performance Analysis](https://github.com/upenc/Analyzing-IPL-Match-Data/blob/main/Player_Perforance_Analysis.sql) , [Team Performance Analysis](https://github.com/upenc/Analyzing-IPL-Match-Data/blob/main/Team_Performance_Analysis.sql) , [Match Overview Analysis](https://github.com/upenc/Analyzing-IPL-Match-Data/blob/main/Match_Overview.sql) in this repository. The SQL file contains a comprehensive set of queries and analyses exploring various aspects of the IPL dataset.

## Contributions
Contributions are welcome! If you have any suggestions, improvements, or additional analyses to add, feel free to fork this repository, make your changes, and submit a pull request.

## Thank You
Thank you for visiting this repository and showing interest in the IPL dataset analysis. Your contributions help improve the quality and depth of the analyses provided here.


