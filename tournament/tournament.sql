-- Table definitions for the tournament project.
-- Drop Database if it exists already
DROP DATABASE IF EXISTS tournament;

-- Create new Database
CREATE DATABASE tournament;

-- Connect to Database
\c tournament;

-- Create Table for Players
CREATE TABLE players (id serial primary key, name varchar);

-- Create Table for Matches
CREATE TABLE matches (match serial primary key, winner integer references
	players(id), loser integer references players(id));

-- Create View for Rankings
-- Winner gets one point and loser gets zero.
CREATE VIEW rankings AS SELECT id, name,
	COUNT(matches1.winner) AS wins,
	COUNT(matches2.winner + matches2.loser) AS matches FROM players
	LEFT JOIN matches as matches1 ON players.id = matches1.winner
	LEFT JOIN matches as matches2 ON players.id = matches2.loser
		OR players.id = matches2.winner
	GROUP BY players.id ORDER BY wins DESC;
