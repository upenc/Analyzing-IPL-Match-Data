# IPL-2008-to-2022-Analysis-Using-SQL
Explore the exciting world of Indian Premier League (IPL) through this data analysis project!


<h3>Title: Analyzing IPL Match Data: Insights and Trends from 2008 to 2021<h3>

The Indian Premier League (IPL) is a professional Twenty20 cricket league in India, sanctioned by the Board of Control for Cricket in India (BCCI). It was founded in 2008 and has since become one of the most popular and lucrative cricket leagues globally.
IPL's combination of high-quality cricket, star power, entertainment, and commercial success has firmly established it as one of the premier sporting events globally, shaping the future of cricket and inspiring millions of fans worldwide.

<a id="contents_tabel"></a>    
<div style="border-radius:10px; padding: 15px; background-color: #ffeacc; font-size:130%; text-align:left">

<h2 align="left"><font color=#ff6200>Table of Contents:</font></h2>
    
* [Step 1 | Introduction]
* [Step 2 | Initial Data Analysis] 
    - [Step 2.1 | Dataset Overview] 
    - [Step 2.2 | Uploading Dataset into Postgres Database ]
* [Step 3 | Data Cleaning & Transformation](#Data_cleaning.sql)
    - [Step 3.1 | Handling Missing Values]
    - [Step 3.2 | Handling Duplicates]
* [Step 4 | Match Overview AND TossEmpact](#Match_Overview.sql)
* [Step 5 | Player Performance Analysis](#Player_Performance_Analysis.sql)
* [Step 6 | Team Performance Analysis](#Team_Performance_Analysis.sql)

Introduction to the dataset: IPL match data spanning from 2008 to 2021.
 Total_matches details: The dataset contains information about cricket matches, including details such as the match ID, city, date, season, match number, teams involved, venue, toss winner, toss decision, whether a super over occurred, the winning team, win margin, player of the match, team players, and umpires. 
 ball-by-ball information:The dataset contains detailed ball-by-ball information for cricket matches, including the ID of the delivery, innings, over and ball number, batter and bowler names, runs scored, extras, total runs for the delivery, whether it was a wicket delivery, the kind of dismissal, and the batting team.

Data Exploration:
Handling Null Values:
All null values in the dataset have been addressed:

⦁	'City' column: Filled with 'Dubai' for consistency.
⦁	'SuperOver' column: Filled with 0 for clarity (mapped 'N' to 0).
⦁	'Margin' column: Filled with 0.
⦁	'Season' column: No null values after conversion.
⦁	'Player_of_Match' column: Filled with 'None'.
⦁	'WinningTeam' column: Filled with 'None'.
⦁	'Method' column: Dropped to eliminate high null count.

Match Overview 


Toss Decision Trends:

Standings in Each Season:
