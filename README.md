# Full Stack Nanodegree Tournament Results Project

## Description:
Database schema to store the game matches between players. The code queries this data and determines the winners of various games.

## Objective:
The game tournament will use the Swiss system for pairing up players in each round: players are not eliminated, and each player should be paired with another player with the same number of wins, or as close as possible. The one with the most wins, is the winner :)

## Running Instructions:

__Important System Requirements__
- VirtualBox
- Vagrant
- Python 2.7.x
- PostgreSQL 9.5.3
- psycopg2

__Summarized Instructions__
- Run vagrant from the appropriate folder ("vagrant up" and then "vagrant ssh")
- Start PostgreSQL and then create the database "tournament" ("CREATE DATABASE tournament;").
- Run tournament.sql which will input the SQL schema
- Run tournament_test.py from the tournament folder

### Detailed Setup:
#### Creating Your Database

1. Before you can run your code or create your tables, you'll need to use the __create database__ command in __psql__ to create the database. Use the name __tournament__ for your database. Navigate in the command line to the tournament directory, then open psql and enter `CREATE database tournament;` followed by `\c tournament` which connects you to the new database and creates your tables from the statements you've written in __tournament.sql__. You can do this in either of two ways:
By pasting each statement into __psql__ or by using the command __\i tournament.sql__ to import the whole file into __psql__ at once. Remember, if you get your database into a bad state you can always __drop__ tables or the whole database to clear it out. In this case, you can enter `\i tournament.sql` to get all the tables and views necessary.

2. Head back into the tournament directory, launch python, then pull in the tournament.py file with the following command: `from tournament import *`

	3.  If you want to test that the tournament works, simply run the follwing test with the command `python tournament_test.py`

	4.  In your python terminal, enter each player's name using: `registerPlayer("[player's name]")` For example: `registerPlayer("John Doe")`

## Playing the Tournament
- If you played before, as you set up a new tournament, and assuming there are new players, you will want to clear your records.

`deleteMatches()`
`deletePlayers()`

- Enter all the players with:

`registerPlayer(name)`

- After that, enter the following to get a list of all names and their IDs:

`playerStandings()`

- At the end of each round, enter each match with:

 `reportMatch(winner, loser)`


- Once you are done, call the following to get the list of matches for the following round:

`swissPairings()`

- Once all rounds are complete and all matches entered, call the following to ge the final results:

`playerStandings()`


## Functions List in tournament.py
__registerPlayer(name)__
Adds a player to the tournament by putting an entry in the database. The database should assign an ID number to the player. Different players may have the same names but will receive different ID numbers.

__countPlayers()__
Returns the number of currently registered players. This function should not use the Python len() function; it should have the database count the players.

__deletePlayers()__
Clear out all the player records from the database.

__reportMatch(winner, loser)__
Stores the outcome of a single match between two players in the database.

__deleteMatches()__
Clear out all the match records from the database.

__playerStandings()__
Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.

__swissPairings()__
Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players. For instance, if there are eight registered players, this function should return four pairings. This function should use playerStandings to find the ranking of players.
