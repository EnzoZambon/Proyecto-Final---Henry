CREATE DATABASE NBA_Henry
USE NBA_Henry

CREATE TABLE team (
    team_id INT PRIMARY KEY,
    full_name VARCHAR(255),
    abbreviation VARCHAR(10),
    city VARCHAR(100),
    state VARCHAR(100)
);


 CREATE TABLE players (
    person_id INT PRIMARY KEY,
	player_name VARCHAR(50), 
    fisrt_season INT,
    round_number INT,
    round_pick INT,
    overall_pick INT,
    draft_type VARCHAR(50),
    team_id INT,
    organization VARCHAR(100),
    organization_type VARCHAR(100),
    player_profile_flag INT,
    FOREIGN KEY (team_id) REFERENCES team(team_id)
);



CREATE TABLE player_info (
    person_id INT,
    birthdate DATETIME,
    school VARCHAR(255),
    country VARCHAR(100),
    height VARCHAR(50),
    weight FLOAT,
    season_exp INT,
    position VARCHAR(50),
    rosterstatus VARCHAR(50),
    games_played_current_season_flag VARCHAR(10),
	FOREIGN KEY (person_id) REFERENCES players (person_id),
);


CREATE TABLE games (
    game_id INT PRIMARY KEY,
    season_id INT,
    game_date DATE,
    home_team_id INT,
    away_team_id INT,
    home_points INT,
    away_points INT,
    season_type VARCHAR(50),
    FOREIGN KEY (home_team_id) REFERENCES team(team_id),
    FOREIGN KEY (away_team_id) REFERENCES team(team_id)
);


CREATE TABLE eventtype (
    eventmsgtype INT PRIMARY KEY,
    description VARCHAR(255)
);

CREATE TABLE eventactiontype (
    eventactiontype_id INT PRIMARY KEY,
    eventmsgtype INT,
    eventmsgactiontype INT,
    description VARCHAR(255),
    numb_events INT,
    score_points INT,
    FOREIGN KEY (eventmsgtype) REFERENCES eventtype(eventmsgtype)
);

CREATE TABLE play_by_play (
    game_id INT,
    eventnum INT,
    eventmsgtype INT,
    eventmsgactiontype INT,
    period INT,
    player1_id INT,
    player2_id INT,
    player3_id INT,
    PRIMARY KEY (game_id, eventnum, eventmsgtype),
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (eventmsgtype) REFERENCES eventtype(eventmsgtype),
    FOREIGN KEY (player1_id) REFERENCES players(person_id),
    FOREIGN KEY (player2_id) REFERENCES players(person_id),
    FOREIGN KEY (player3_id) REFERENCES players(person_id)
);


CREATE TABLE other_games_stats (
    game_id INT,
    team_id_home INT,
    team_city_home VARCHAR(100),
    pts_paint_home INT,
    pts_2nd_chance_home INT,
    pts_fb_home INT,
    largest_lead_home INT,
    lead_changes INT,
    times_tied INT,
    team_turnovers_home FLOAT,
    total_turnovers_home FLOAT,
    team_rebounds_home FLOAT,
    pts_off_to_home FLOAT,
	team_id_away INT,
	team_city_away VARCHAR(100),
    pts_paint_away INT,
    pts_2nd_chance_away INT,
    pts_fb_away INT,
    largest_lead_away INT,
    team_turnovers_away FLOAT,
    total_turnovers_away FLOAT,
    team_rebounds_away FLOAT,
    pts_off_to_away FLOAT,
    PRIMARY KEY (game_id, team_id_home),
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (team_id_home) REFERENCES team(team_id),
    FOREIGN KEY (team_id_away) REFERENCES team(team_id)
);


CREATE TABLE other_player_metrics (
    player_season INT NOT NULL,
    player_id INT NOT NULL,
    player_name VARCHAR(100) NOT NULL,
    position VARCHAR(10),
    weight FLOAT,
    standing_vertical_leap FLOAT,
    max_vertical_leap FLOAT,
    lane_agility_time FLOAT,
    three_quarter_sprint FLOAT,
    PRIMARY KEY (player_season, player_id),
    FOREIGN KEY (player_id) REFERENCES players(person_id)
);
