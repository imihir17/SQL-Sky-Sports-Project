create database skysports_project;

use skysports_project;

show tables;

#1.	Import both the .CSV files in Dbeaver under the database name Sky_Sports

show tables;

select * from group_stage_team_stats;
select * from overall_wc_stats;

#2. Write an sql query to show all the UNIQUE team names 

select distinct(team)from group_stage_team_stats;


#3.	Write an SQL query to show name of team which has rank 1 from group 7 

select * from group_stage_team_stats where `group`=7 and `rank`=1;


#4.	Write an sql query to show count of all teams 

select count(team) from group_stage_team_stats;


#5.	Write an SQL query to show matches_played by each team

select team , matches_played from group_stage_team_stats;


#6.	Write an SQL query to show team, percent of wins with respect to matches_played 
#by each team and name the resulting column as wins_percent

select team, 100.0*(wins/matches_played) as wins_percent 
from group_stage_team_stats;


#7.	Write an SQL query to show which team has maximum goals_scored and their count

select team , goals_scored from group_stage_team_stats gsts
where goals_scored =(select max(goals_scored) from group_stage_team_stats);


#8.Write an SQL query to show percent of draws with respect to matches_played round of to 2 digits by each team

select team, round(100.0*(draws/matches_played),2) from group_stage_team_stats;


#9. Write an SQL query to show which team has minimum goals_scored and their count

select team , goals_scored from group_stage_team_stats where goals_scored =
(select min(goals_scored) from group_stage_team_stats);


#10. Write an SQL query to show percent of losses with respect to matches_played
# by each team in ascending order by losses and name the resulting column as losses_percent

select * from group_stage_team_stats;

select team, 100.0*(losses/matches_played) as losses_percent 
from group_stage_team_stats gsts
order by losses_percent ;

#11.	Write an SQL query to show the average goal_difference 

select avg(goal_difference) from group_stage_team_stats;


#12.  Write an SQL query to show name of the team where points are 0 

select team , points from group_stage_team_stats gsts 
where points=0;


#13. Write a SQL query to show all data where expected_goal_scored is less than exp_goal_conceded

select *  from group_stage_team_stats gsts 
where expected_goal_scored<exp_goal_conceded;


#14. Write an SQL query to show data where exp_goal_difference is in between -0.5 and 0.5

select * from group_stage_team_stats gsts where exp_goal_difference between -0.5 and 0.5;


#15.	Write an SQL query to show all data in ascending order by exp_goal_difference_per_90

select * from group_stage_team_stats gsts
order by exp_goal_difference_per_90 asc;


#16. Write an SQL query to show team which has maximum number of players_used

select team ,players_used from overall_wc_stats where players_used =
(select max(players_used) from overall_wc_stats);


select team, max(players_used) from overall_wc_stats 
group by team 
order by max(players_used) desc limit 1;


#17. Write an SQL query to show each team name and avg_age in ascending order by avg_age

select team , avg_age from overall_wc_stats
order by avg_age;


#18. Write an sql query to show average possession of teams 

select avg(possession) from overall_wc_stats;


#19. Write a SQL query to show team which has played atleast 5 games

select team ,games from overall_wc_stats 
where games>=5;


#20. Write an SQL query to show all data for which minutes is greater than 600

select * from overall_wc_stats
where minutes>600;


#21. Write an SQL query to show team, goals, assists in ascending order by goals

select team, goals, assists from overall_wc_stats
order by goals;


#22. Write an SQL query to show team, pens_made, pens_att in descending order by pens_made

select team , pens_made , Pens_att from overall_wc_stats
order by pens_made desc;

#23. Write an SQL query to show team, cards_yellow, cards_red 
#where cards_red is equal to 1 in ascending order by cards_yellow 

select team , cards_yellow , cards_red from overall_wc_stats
where cards_red=1 
order by cards_yellow ;


#24.Write an SQL query to show team, goals_per90, assists_per90, goals_assists_per90 
#in descending order by goals_assists_per90 

select team, goals_per90, assists_per90, goals_assists_per90 from overall_wc_stats
order by goals_assists_per90;

#25. Write an SQL query to show team, goals_pens_per90, goals_assists_pens_per90 
#in ascending order by goals_assists_pens_per90 

select team, goals_pens_per90, goals_assists_pens_per90  from overall_wc_stats
order by goals_assists_pens_per90;


#26.Write an SQL query to show team, shots, shots_on_target, shots_on_target_pct 
#where shots_on_target_pct is less than 30 in ascending order by shots_on_target_pct 

select team, shots, shots_on_target, shots_on_target_pct from overall_wc_stats
where shots_on_target_pct<30 
order by shots_on_target_pct;


#27. Write an SQL query to show team, shots_per90, shots_on_target_per90 for team Belgium

select team, shots_per90, shots_on_target_per90 from overall_wc_stats
where team="Belgium";


#28. Write an SQL query to show team, goals_per_shot, goals_per_shot_on_target, average_shot_distance 
#in descending order by average_shot_distance 

select team, goals_per_shot, goals_per_shot_on_target, average_shot_distance from overall_wc_stats
order by average_shot_distance desc;


#29. Write an SQL query to show team, errors, touches for which errors is 0 and touches is less than 1500 

select team, errors, touches from overall_wc_stats
where errors=0 and touches<1500;


#30. Write an SQL query to show team, fouls which has maximum number of fouls

select team, fouls from overall_wc_stats where fouls=
(select max(fouls) from overall_wc_stats);
 

#31.Write an SQL query to show team, offisdes which has offsides less than 10 or greater than 20

select team ,offsides from overall_wc_stats 
where offsides<10 or offsides>20;


#32.Write an SQL query to show team, aerials_won, aerials_lost, aerials_won_pct 
#in descending order by aerials_won_pct 

select team, aerials_won, aerials_lost, aerials_won_pct from overall_wc_stats 
order by aerials_won_pct desc;


#33.Write an SQL query to show number of teams each group has!

select count(team) No_of_teams,`group` from group_stage_team_stats gsts 
group by `group`;


#34.Write a SQL query to show team names group 6 has

select team, `group` from group_stage_team_stats gsts  where `group`=6;


#35. Write an SQL query to show Australia belongs to which group 

select team, `group` from group_stage_team_stats gsts 
where  team="Australia";


#36. Write an SQL query to show group, average wins by each group 

select * from group_stage_team_stats gsts ;

select `group` , avg(wins) from group_stage_team_stats gsts
group by `group`;


#37. Write an SQL query to show group, maximum expected_goal_scored by each group
# in ascending order by expected_goal_scored

select `group`, max(expected_goal_scored) from group_stage_team_stats
group by `group`
order by max(expected_goal_scored);


#38. Write an SQL query to show group, minimum exp_goal_conceded by each group 
#in descending order by exp_goal_conceded 

select * from group_stage_team_stats;

select `group`, min(exp_goal_conceded) from group_stage_team_stats
group by `group`
order by  min(exp_goal_conceded) desc;


#39. Write an SQL query to show group, average exp_goal_difference_per_90 for each group 
#in ascending order by exp_goal_difference_per_90 

select `group` , avg(exp_goal_difference_per_90) from group_stage_team_stats
group by `group`
order by avg(exp_goal_difference_per_90);


#40. Write an SQL query to show which team has equal number of goals_scored and goals_against 

select team, goals_scored , goals_against from group_stage_team_stats
where goals_scored=goals_against;

select team, sum(goals_scored) , sum(goals_against) from group_stage_team_stats
where goals_scored=goals_against 
group by team;


#41. Write an SQL query to show which team has maximum players_used 

select team ,players_used from overall_wc_stats 
where players_used = (select max(players_used) from overall_wc_stats);


#42. Write an SQL query to show team, players_used, avg_age, games, minutes 
#where minutes lessthan 500 and greater than 200 

select team , players_used , avg_age, games, minutes from overall_wc_stats
where minutes<500 and minutes>200;


#43. Write an SQL query to show all data of group_stats in ascending order BY points

select * from group_stage_team_stats 
order by points;

select `group` from group_stage_team_stats
order by points;

#44. Write an SQL query to show ALL UNIQUE team in ascending order by team

select distinct(team) from group_stage_team_stats 
order by team;


#45. Write an SQL query to show average avg_age of each group and arrange it in descending order by avg_age. 

select gs.`group` , avg(ows.avg_age)
from overall_wc_stats as ows inner join group_stage_team_stats as gs
on ows.team=gs.team 
group by gs.`group`
order by avg(ows.avg_age);

select gs.`group` , avg(ows.avg_age)
from group_stage_team_stats as gs left join overall_wc_stats as ows
on gs.team=ows.team 
group by gs.`group`
order by avg(ows.avg_age);

select gs.`group` , avg(ows.avg_age)
from group_stage_team_stats as gs right join overall_wc_stats as ows
on gs.team=ows.team 
group by gs.`group`
order by avg(ows.avg_age);

#46. Write an SQL query to show sum of fouls for each group and arrange it in ascending order by fouls.

select gs.`group`, sum(ows.fouls)
from group_stage_team_stats as gs inner join overall_wc_stats as ows 
on gs.team=ows.team 
group by gs.`group`
order by sum(ows.fouls);

#47. Write an SQL query to show total number of games for each group and arrange 
#it in descending order by games.

select gs.`group` , sum(ows.games)
from group_stage_team_stats as gs inner join overall_wc_stats as ows
on gs.team=ows.team 
group by `group`
order by sum(ows.games) desc;


#48. Write an SQL query to show total number of players_used for each group and 
#arrange it in ascending order by players_used. 

select gs.`group` , sum(ows.players_used) as total_no_players_uese
from group_stage_team_stats as gs inner join overall_wc_stats as ows
on gs.team=ows.team 
group by `group`
order by sum(ows.players_used);


#49. Write an SQL query to show total number of offsides for each group and
# arrange it in ascending order by offsides.

select gs.`group` , sum(ows.offsides) as total_no_offsides
from group_stage_team_stats as gs inner join overall_wc_stats as ows
on gs.team=ows.team 
group by `group`
order by sum(ows.offsides);


#50. Write an SQL query to show average passes_pct for each group and
#arrange it in descending order by passes_pct.

select gs.`group` , avg(ows.passes_pct) as total_no_offsides
from group_stage_team_stats as gs inner join overall_wc_stats as ows
on gs.team=ows.team 
group by `group`
order by avg(ows.passes_pct);


#51. Write an SQL query to show average goals_per90 for each group and 
#arrange it in ascending order by goals_per90.

select gs.`group` , avg(ows.goals_per90) as total_no_offsides
from group_stage_team_stats as gs inner join overall_wc_stats as ows
on gs.team=ows.team 
group by `group`
order by avg(ows.goals_per90);






