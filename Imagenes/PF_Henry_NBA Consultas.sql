USE NBA_Henry


--------------ESTADISTICAS DE SAN ANTONIO TEMPORADA REGULAR 2022---------------
SELECT 
    t.full_name AS team_name,
    SUM(ogs.pts_paint_home + ogs.pts_paint_away) AS total_pts_paint,
    SUM(ogs.pts_2nd_chance_home + ogs.pts_2nd_chance_away) AS total_pts_2nd_chance,
    SUM(ogs.pts_fb_home + ogs.pts_fb_away) AS total_pts_fb,
    SUM(ogs.team_rebounds_home + ogs.team_rebounds_away) AS total_team_rebounds,
    SUM(ogs.team_turnovers_home + ogs.team_turnovers_away) AS total_team_turnovers
FROM 
    other_games_stats ogs
JOIN 
    games g ON ogs.game_id = g.game_id
JOIN 
    team t ON ogs.team_id_home = t.team_id OR ogs.team_id_away = t.team_id
WHERE 
    t.full_name = 'San Antonio Spurs'
    AND g.season_id = 22022
GROUP BY 
    t.full_name;




------------------------------- PUNTOS, VICTORIAS Y DERROTAS DE LOCAL Y VISITANTE-----------------------------
SELECT 
    t.full_name AS team_name,
    
    -- Total de puntos (local y visitante)
    SUM(CASE 
            WHEN g.home_team_id = t.team_id THEN g.home_points 
            ELSE g.away_points 
        END) AS total_points,

    -- Total de victorias
    SUM(CASE 
            WHEN (g.home_team_id = t.team_id AND g.home_points > g.away_points) OR 
                 (g.away_team_id = t.team_id AND g.away_points > g.home_points) 
            THEN 1 ELSE 0 
        END) AS total_wins,

    -- Total de derrotas
    SUM(CASE 
            WHEN (g.home_team_id = t.team_id AND g.home_points < g.away_points) OR 
                 (g.away_team_id = t.team_id AND g.away_points < g.home_points) 
            THEN 1 ELSE 0 
        END) AS total_losses,

    -- Total de puntos como local
    SUM(CASE WHEN g.home_team_id = t.team_id THEN g.home_points ELSE 0 END) AS total_home_points,

    -- Total de puntos como visitante
    SUM(CASE WHEN g.away_team_id = t.team_id THEN g.away_points ELSE 0 END) AS total_away_points

FROM 
    games g
JOIN 
    team t ON g.home_team_id = t.team_id OR g.away_team_id = t.team_id
WHERE 
    t.full_name = 'San Antonio Spurs'
    AND g.season_id = 22022
GROUP BY 
    t.full_name;




------------------------------- JUGADORES CON MAS INTENTOS HECHOS----------------------------

	SELECT 
    p.player_name,
    COUNT(pb.eventnum) AS shots_made
FROM 
    play_by_play pb
JOIN 
    games g ON pb.game_id = g.game_id
JOIN 
    players p ON pb.player1_id = p.person_id
JOIN 
    team t ON p.team_id = t.team_id
WHERE 
    t.full_name = 'San Antonio Spurs'
    AND g.season_id = 22022
    AND pb.eventmsgtype = 1
GROUP BY 
    p.player_name
ORDER BY 
    shots_made DESC;


------------------------------- JUGADORES CON MAS FALTAS COMETIDAS----------------------------

SELECT 
    p.player_name,
    COUNT(pb.eventnum) AS fouls_committed
FROM 
    play_by_play pb
JOIN 
    games g ON pb.game_id = g.game_id
JOIN 
    players p ON pb.player1_id = p.person_id
JOIN 
    team t ON p.team_id = t.team_id
WHERE 
    t.full_name = 'San Antonio Spurs'
    AND g.season_id = 22022
    AND pb.eventmsgtype = 6 
GROUP BY 
    p.player_name
ORDER BY 
    fouls_committed DESC;