CREATE TABLE games (
    game_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    release_date TEXT,
    price REAL,
    copies_sold INTEGER,
    revenue INTEGER,
    early_access BOOLEAN,
    publisher TEXT,
    developer TEXT,
    class TEXT,
    steam_followers INTEGER
);
CREATE TABLE tags (
    tag_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tag_name TEXT,
    game_count INTEGER,
    percentage_of_games TEXT,
    revenue INTEGER,
    aa_count INTEGER,
    indie_count INTEGER,
    hobbyist_count INTEGER,
    free_to_play_count INTEGER,
    free_to_play_revenue INTEGER,
    aa_revenue INTEGER,
    indie_revenue INTEGER,
    hobbyist_revenue INTEGER,
    self_published_count INTEGER,
    self_published_revenue INTEGER,
    publisher_count INTEGER,
    publisher_revenue INTEGER
);
CREATE TABLE game_tags (
    game_id INTEGER,
    tag_id INTEGER,
    PRIMARY KEY (game_id, tag_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);
CREATE TABLE game_classes (
    class_name TEXT PRIMARY KEY,
    number_of_games INTEGER,
    games_over_1m INTEGER,
    total_revenue INTEGER,
    avg_revenue INTEGER,
    avg_price REAL
);
