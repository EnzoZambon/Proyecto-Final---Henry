USE NBA_Henry

BULK INSERT team
FROM 'C:/Users/Enzo/OneDrive/Escritorio/Henry PF/team_listo.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos (en este caso, coma)
    ROWTERMINATOR = '\n',   -- Delimitador de filas (salto de línea)
    FIRSTROW = 2           -- Si el archivo CSV tiene encabezado, empieza desde la segunda fila
);

BULK INSERT players
FROM 'C:/Users/Enzo/OneDrive/Escritorio/Henry PF/draft_history_listo.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos (en este caso, coma)
    ROWTERMINATOR = '\n',   -- Delimitador de filas (salto de línea)
    FIRSTROW = 2           -- Si el archivo CSV tiene encabezado, empieza desde la segunda fila
);

BULK INSERT player_info
FROM 'C:/Users/Enzo/OneDrive/Escritorio/Henry PF/common_player_info_listo.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos (en este caso, coma)
    ROWTERMINATOR = '\n',   -- Delimitador de filas (salto de línea)
    FIRSTROW = 2           -- Si el archivo CSV tiene encabezado, empieza desde la segunda fila
);

BULK INSERT games
FROM 'C:/Users/Enzo/OneDrive/Escritorio/Henry PF/games_listo.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos (en este caso, coma)
    ROWTERMINATOR = '\n',   -- Delimitador de filas (salto de línea)
    FIRSTROW = 2           -- Si el archivo CSV tiene encabezado, empieza desde la segunda fila
);


BULK INSERT eventtype
FROM 'C:/Users/Enzo/OneDrive/Escritorio/Henry PF/eventtype_listo.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos (en este caso, coma)
    ROWTERMINATOR = '\n',   -- Delimitador de filas (salto de línea)
    FIRSTROW = 2           -- Si el archivo CSV tiene encabezado, empieza desde la segunda fila
);

BULK INSERT eventactiontype
FROM 'C:/Users/Enzo/OneDrive/Escritorio/Henry PF/eventactiontype_listo.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos (en este caso, coma)
    ROWTERMINATOR = '\n',   -- Delimitador de filas (salto de línea)
    FIRSTROW = 2           -- Si el archivo CSV tiene encabezado, empieza desde la segunda fila
);

BULK INSERT play_by_play
FROM 'C:/Users/Enzo/OneDrive/Escritorio/Henry PF/pbp_listo.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos (en este caso, coma)
    ROWTERMINATOR = '\n',   -- Delimitador de filas (salto de línea)
    FIRSTROW = 2           -- Si el archivo CSV tiene encabezado, empieza desde la segunda fila
);

BULK INSERT other_games_stats
FROM 'C:/Users/Enzo/OneDrive/Escritorio/Henry PF/other_stats_listo.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos (en este caso, coma)
    ROWTERMINATOR = '\n',   -- Delimitador de filas (salto de línea)
    FIRSTROW = 2           -- Si el archivo CSV tiene encabezado, empieza desde la segunda fila
);


BULK INSERT other_player_metrics
FROM 'C:/Users/Enzo/OneDrive/Escritorio/Henry PF/draft_stats_listo.csv'
WITH (
    FIELDTERMINATOR = ',',  -- Delimitador de campos (en este caso, coma)
    ROWTERMINATOR = '\n',   -- Delimitador de filas (salto de línea)
    FIRSTROW = 2           -- Si el archivo CSV tiene encabezado, empieza desde la segunda fila
);
