-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament


CREATE TABLE players (id SERIAL PRIMARY KEY,
                      name TEXT NOT NULL,
                      date timestamp default current_timestamp );

CREATE TABLE matches (match_id SERIAL PRIMARY KEY,
                      winner_id INTEGER,
                      loser_id INTEGER,
                      FOREIGN KEY (winner_id) REFERENCES players(id),
                      FOREIGN KEY (loser_id) REFERENCES players(id) );


CREATE VIEW standings as
SELECT players.id, players.name, count(matches_won.match_id) as wins, count(played_matches.match_id) as played
FROM players
  LEFT JOIN matches as matches_won
    on players.id = matches_won.winner_id
  LEFT JOIN matches as played_matches
    on players.id = played_matches.winner_id or players.id = played_matches.loser_id
GROUP BY players.id, players.name
ORDER BY wins DESC;
