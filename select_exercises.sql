USE albums_db;
SHOW tables;
SELECT * FROM albums;
# 3. Explore the structure of the albums table.
# a. Albums has 31 rows
SELECT id FROM albums;
# b. How many unique artist names are in the albums table?
SELECT COUNT(DISTINCT (artist)) FROM albums;
# There are 23 of them
# c. What is the primary key for the albums table?
SHOW CREATE TABLE albums;
/* 'CREATE TABLE `albums` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `artist` varchar(240) DEFAULT NULL,
  `name` varchar(240) NOT NULL,
  `release_date` int DEFAULT NULL,
  `sales` float DEFAULT NULL,
  `genre` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1' */
# The primary key for the albums table is the ID column
# d. What is the oldest release date for any album in the albums table? What is the most recent release date?
SELECT MAX(release_date) FROM albums;
# 2011
SELECT MIN(release_date) FROM albums;
# 1967
# 4. Write queries to find the following information:
# a. The name of all albums by Pink Floyd
SELECT artist FROM albums WHERE artist = "Pink Floyd";
# b. The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
# 1967
# c. The genre for the album Nevermind
SELECT genre FROM albums WHERE name = "Nevermind";
# Grunge, Alternative Rock
# d. Which albums were released in the 1990s
SELECT name, release_date FROM albums WHERE release_date LIKE "199_";
# 11 Albums where released in the 90s:
#'The Bodyguard'
#'Jagged Little Pill'
#'Come On Over'
#'Falling into You'
#'Let\'s Talk About Love'
#'Dangerous'
#'The Immaculate Collection'
#'Titanic: Music from the Motion Picture'
#'Metallica'
#'Nevermind'
#'Supernatural'

# e. Which albums had less than 20 million certified sales
SELECT sales, name FROM albums WHERE sales < 20.0;
# '14.4','Grease: The Original Soundtrack from the Motion Picture'
# '19.3','Bad'
# '13.1','Sgt. Pepper\'s Lonely Hearts Club Band'
# '17.9','Dirty Dancing'
# '19.3','Let\'s Talk About Love'
# '16.3','Dangerous'
# '19.4','The Immaculate Collection'
# '14.4','Abbey Road'
# '19.6','Born in the U.S.A.'
# '17.7','Brothers in Arms'
# '18.1','Titanic: Music from the Motion Picture'
# '16.7','Nevermind'
# '17.6','The Wall'

# f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT genre, name FROM albums WHERE genre LIKE "ROCK";
# There is 5 of them:
# 'Rock','Sgt. Pepper\'s Lonely Hearts Club Band'
# 'Rock','1'
# 'Rock','Abbey Road'
# 'Rock','Born in the U.S.A.'
# 'Rock','Supernatural'
