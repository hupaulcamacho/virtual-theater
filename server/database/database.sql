DROP DATABASE IF EXISTS virtual_th;

CREATE DATABASE virtual_th;

\c virtual_th;

-- table creation
CREATE TABLE genres 
(
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE videos
(
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    description VARCHAR,
    rating INT,
    runtime VARCHAR,
    video_url VARCHAR,
    genre_id INT REFERENCES genres(id) ON DELETE CASCADE ON UPDATE CASCADE,
    img_url VARCHAR
);

CREATE TABLE showtimes
(
    id SERIAL PRIMARY KEY,
    video_id INT REFERENCES videos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    time VARCHAR
);

-- seeding database
INSERT INTO genres
    (name)
VALUES
    ('Action'), -- 1
    ('Adventure'), -- 2
    ('Comedy'),  -- 3
    ('Drama'), -- 4
    ('Horror'), -- 5
    ('Sci-fi'), -- 6
    ('Documentary'), -- 7
    ('Romance'), -- 8
    ('Family'); -- 9

INSERT INTO videos
    (title, genre_id, description, video_url, rating, img_url, runtime)
VALUES
    ('The Take Down', 1, 'When Jack, a hit man from London, gets given his life back and the opportunity to save his daughter, it becomes a race against time to kill or be killed.', 'SPNJKnFlJSg', 33, 'https://m.media-amazon.com/images/M/MV5BZTBlNDFkZmItYmUwMS00MzhhLTg4MDktNTk0NTIzN2IzNTA5XkEyXkFqcGdeQXVyNjgxMzY0MzA@._V1_UY268_CR1,0,182,268_AL_.jpg', '1:39:54'),
    ('Nine Deaths of the Ninja', 1, 'Two anti-terrorist agents are assigned to free a busload of American schoolchildren in the Philippines who are taken hostage by terrorists.', 'eFp_WKsCjpA', 45, 'https://m.media-amazon.com/images/M/MV5BOWNmYTlmZjItNGZiNS00NDQ5LTk2NDUtZTI3NTM2MjhhMzQxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:33:38'),
    ('Beta Test', 1, 'Champion gamer Max Troy discovers events in a new video game are being mirrored in the real world, and must join forces with the game''s protagonist, Orson Creed, to unravel the conspiracy before the game''s sinister plot overwhelms the city.', 'roB7oEMk168', 80, 'https://m.media-amazon.com/images/M/MV5BODdlMjU0MDYtMWQ1NC00YjFjLTgxMDQtNDYxNTg2ZjJjZDFiXkEyXkFqcGdeQXVyMTU2NTcxNDg@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:27:56'),

    ('Active Stealth', 2, 'After Captain Murphy lost some of his men on his last mission to Mexico to bring back a US Senator, he has been plagued with unhappiness and bad dreams. When Murphy is given orders to go back to Mexico to help Mexican people slaving for Salvatore, a rich drug dealer, he must use a new technology plane to get there. The plane is technically advanced with a new protection luxury called ''Active Stealth''. Murphy and his men get aboard the ''Active Stealth'', piloted by Hollywood who dreams of being an actor and embark to Mexico. The action never stops from then on when Salvatore sends his men in to block them from getting through.', '-LzefjIA86M', 34, 'https://m.media-amazon.com/images/M/MV5BMTUxNDg0OTI4OF5BMl5BanBnXkFtZTcwMjU5NjkyMQ@@._V1_UY268_CR3,0,182,268_AL_.jpg', '1:39:15'),
    ('Day of Wrath', 2, 'Set in the 16th century, a sheriff working on a series of murders has to choose between his conscience and protecting his family when he''s tied to the crimes.', 'qdoCFJhWSwk', 55, 'https://m.media-amazon.com/images/M/MV5BNTg2MDI2MDczOF5BMl5BanBnXkFtZTgwMzc4NzgwMzE@._V1_UY268_CR5,0,182,268_AL_.jpg', '1:39:22'),
    ('Six Gun Savior', 2, 'The road to hell is paved with good intentions.', 'X4VWJ8wla5A', 32, 'https://m.media-amazon.com/images/M/MV5BMTgzMDQwMDA3Nl5BMl5BanBnXkFtZTgwODA3ODU1MDE@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:41:36'),

    ('Bad Parents', 3, 'A suburban mom relives her season with the soccer obsessed sports parents whose outrageous "win at all costs" behavior spirals out of control.', 'E7exSFt4Opo', 35, 'https://m.media-amazon.com/images/M/MV5BMTQ5ODk3NTY5M15BMl5BanBnXkFtZTcwOTEyMDcxNw@@._V1_UY268_CR2,0,182,268_AL_.jpg', '1:31:57'),
    ('Henrys Crime', 3, 'Released from prison for a crime he didn''t commit, an ex-con targets the same bank he was sent away for robbing.', 'Doo3UivJhtc', 60, 'https://m.media-amazon.com/images/M/MV5BMjI4MzM4OTY3MF5BMl5BanBnXkFtZTcwOTMzMjI3NA@@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:47:48'),

    ('Fatal Crossing', 4, 'High-flying tech entrepreneur Carson drinks to cope with the weight of expectation for his new company and the burden of providing for his sick father. When he wakes up in blackout with blood all over his car on the same morning a fatal hit-and- run is reported, his world spirals as he tries to build a relationship with June, the girlfriend of the victim who suspects that he might be the killer.', 'xVC1uhVeIdA', 40, 'https://m.media-amazon.com/images/M/MV5BOTRjZmE1MWEtMTk3NS00NzhlLTljNzEtZGU2NWUxMGZhOGQ5XkEyXkFqcGdeQXVyMzc0MTkyNDE@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:33:14'),
    ('Detatchment', 4, 'A substitute teacher who drifts from classroom to classroom finds a connection to the students and teachers during his latest assignment.', '1WHakpvHF6k', 70, 'https://m.media-amazon.com/images/M/MV5BMTM3NzQzMDA5Ml5BMl5BanBnXkFtZTcwODA5NTcyNw@@._V1_UY268_CR1,0,182,268_AL_.jpg', '1:37:58'),
    ('Shelter', 4, 'Hannah and Tahir fall in love while homeless on the streets of New York. Shelter explores how they got there, and as we learn about their pasts we realize they need each other to build a future.', '3PKoit52Sls', 74, 'https://m.media-amazon.com/images/M/MV5BMzEwNTc2NjIwNV5BMl5BanBnXkFtZTgwMjYyMTk4NjE@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:34:47'),
    ('Honeydripper', 4, '1950. Rural Alabama. Cotton harvest. It''s a make-or-break weekend for the Honeydripper Lounge and its owner, piano player Tyrone "Pine Top"" Purvis. Deep in debt to the liquor man, the chicken man, and the landlord, Tyrone is desperate to lure the young cotton pickers and local Army base recruits into his juke joint, away from Touissant''s, the rival joint across the way. His plan to hire a guitar legend go awry and Tyrone is forced to take drastic action in a final scheme to save the club.', 'blwiQYfQBYU', 66, 'https://m.media-amazon.com/images/M/MV5BMTI3NTU5MDM4NF5BMl5BanBnXkFtZTcwMTAxNzg3Mg@@._V1_UY268_CR4,0,182,268_AL_.jpg', '2:03:58'),

    ('Temple', 5, 'Three American tourists follow a mysterious map deep into the jungles of Japan searching for an ancient temple. When spirits entrap them, their adventure quickly becomes a horrific nightmare.', 'wBgFbp6LKCs', 36, 'https://m.media-amazon.com/images/M/MV5BNmVhNTMyZTUtOTkwYS00NzU3LTg1NDEtMTQ5ZGNiNWE1YWYyXkEyXkFqcGdeQXVyMTM2MzgyOTU@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:18:05'),
    ('Retina', 5, 'A young woman participates in a medical study. After a series of nightmares and unusual side effects, the line between dreams and reality is blurred. She finds herself on the run from those involved, desperate to uncover the truth.', '2h6cLbbduag', 55, 'https://m.media-amazon.com/images/M/MV5BNDk3NTEzOTEyN15BMl5BanBnXkFtZTgwMDM2NjM4MzE@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:27:24'),
    ('Girl In Woods', 5, 'After a tragic accident Grace is lost and alone in the Smoky Mountains. Grace''s struggle for survival is made more complicated by her troubled past. Battling the demons in her mind may be the only way to come out alive.', 'kBUBXcgj1d4', 33, 'https://m.media-amazon.com/images/M/MV5BODQ3Nzk1OTM1MV5BMl5BanBnXkFtZTcwODcxNDg4OA@@._V1_UY268_CR12,0,182,268_AL_.jpg', '1:26:45'),

    ('The Last Starship', 6, 'Conflict and tension looms heavily across the broken remains of a distant, post-apocalyptic world. Controlled by a race of oppressive genetically-enhanced humans, the last natural-born humans have no choice but to bow down to their rule. The only alternative is to wander the vast wastelands surrounding the last habitable city, whilst relentlessly hunted by roaming pack of mutated monsters. Meanwhile, outside the towering walls of the citadel, aboard a massive hulking army tank, an uprising occurs among the natural-born crew. Their hope lies in the legend of the Republic of EZO: said to return aboard the last star ship ...', 'Zo_OTYlLxhY', 80, 'https://m.media-amazon.com/images/M/MV5BMjEzODQ2MjExMF5BMl5BanBnXkFtZTgwMjU2MTIzMDI@._V1_UY268_CR9,0,182,268_AL_.jpg', '1:51:23'),
    ('Silver Hawk', 6, 'Lulu Wong lives a double life - part urban social butterfly, part vigilante superhero.', '9WYFUg5pyYo', 51, 'https://m.media-amazon.com/images/M/MV5BNjVkZGYyNDAtYzhmMC00MTRjLWE2ZWItYjU4NjcxY2ZhYjMxXkEyXkFqcGdeQXVyMjQwMjk0NjI@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:39:29'),
    ('Beyond The Trek', 6, 'A deep space mining vessel has been adrift for two years. It is suspected the crew brutally killed each other, but the reason for the bloodbath is unknown. A rescue crew is sent to find if there are any survivors, what happened and why.', '2xL-zwKVr80', 44, 'https://m.media-amazon.com/images/M/MV5BZDc2M2MyZDMtMDhjNi00Njk4LThjODktZDUxY2ZjOTQxODMyXkEyXkFqcGdeQXVyMjg1MDczNg@@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:30:07'),

    ('Team Khan', 7, 'Fly-on-the-wall documentary about professional boxer Amir Khan. Filmed over two years, it follows Amir and his team in their quest to fight the best boxer on the planet, the unbeaten Floyd Mayweather Jr.', 'CxbzpeODs3Q', 90, 'https://m.media-amazon.com/images/M/MV5BNWFjZjFiYjYtY2EzNC00YjNhLWJjNmEtZmE4ZTE3ZTAxZWQ1XkEyXkFqcGdeQXVyNjI2MTA0Mw@@._V1_UX182_CR0,0,182,268_AL_.jpg', '1:37:47'),
    ('United We Fan', 7, 'Fans, stars, creators, and more come together to explore the dynamic history and evolution of save-our-show television fan campaigns from the letter-writing and product mail-in campaigns of yesterday to the social media and crowdfunding campaigns of today.', 'Om28iS-n1ts', 73, 'https://m.media-amazon.com/images/M/MV5BZmNiZmE5ZmUtM2VhNi00OGE5LTk4NDYtZjhlNGQ1OTQ0MDFkXkEyXkFqcGdeQXVyMzQ0MDg4Mw@@._V1_UY268_CR0,0,182,268_AL_.jpg', '1:37:26'),

    ('Runaway Romance', 8, 'A reality TV star leaves Hollywood and finds herself in Amish country where she must decide between staying in her newfound reality or returning to her old one.', 'D-KWNUesPvI', 61, 'https://m.media-amazon.com/images/M/MV5BYjQ0OTAzMTUtOTQ3Ni00OTg1LThmMWQtODY5NjA4OGJkMDhmXkEyXkFqcGdeQXVyMjAzNjAzMQ@@._V1_UY268_CR4,0,182,268_AL_.jpg', '1:30:14'),

    ('MeeShee: The Water Giant', 9, 'A young boy is devastated when the planned vacation with his father is cancelled due to an emergency salvage mission at a remote Canadian lake. But when he discovers the lake is known as the home of a mythical creature, Mac makes it his mission prove there''s more to the myth than just legend.', 'e9lbbfi8v10', 55, 'https://m.media-amazon.com/images/M/MV5BMTcxMTQ1MjgxNV5BMl5BanBnXkFtZTcwMzE2ODMzMQ@@._V1_UY268_CR3,0,182,268_AL_.jpg', '1:34:09');


INSERT INTO showtimes
    (video_id, time)
VALUES
    (1, '3:00:00 AM'),
    (1, '7:00:00 AM'),
    (1, '9:00:00 AM'),
    (1, '1:00:00 PM'),
    (1, '3:00:00 PM'),
    (1, '6:00:00 PM'),
    (1, '8:00:00 PM'),

    (2, '5:00:00 AM'),
    (2, '8:00:00 AM'),
    (2, '10:00:00 AM'),
    (2, '4:45:00 PM'),
    (2, '7:00:00 PM'),
    (2, '9:00:00 PM'),
    (2, '11:00:00 PM'),

    (3, '4:00:00 AM'),
    (3, '5:00:00 AM'),
    (3, '8:00:00 AM'),
    (3, '11:30:00 AM'),
    (3, '1:00:00 PM'),
    (3, '4:15:00 PM'),
    (3, '7:00:00 PM'),
    (3, '10:00:00 PM'),

    (4, '2:00:00 AM'),
    (4, '5:00:00 AM'),
    (4, '9:00:00 AM'),
    (4, '12:00:00 PM'),
    (4, '3:00:00 PM'),
    (4, '6:00:00 PM'),
    (4, '9:00:00 PM'),

    (5, '2:00:00 AM'),
    (5, '5:00:00 AM'),
    (5, '9:00:00 AM'),
    (5, '12:00:00 PM'),
    (5, '3:00:00 PM'),
    (5, '6:00:00 PM'),
    (5, '9:00:00 PM'),

    (6, '4:00:00 AM'),
    (6, '5:00:00 AM'),
    (6, '8:00:00 AM'),
    (6, '1:00:00 PM'),
    (6, '4:00:00 PM'),
    (6, '7:00:00 PM'),
    (6, '10:00:00 PM'),

    (7, '3:00:00 AM'),
    (7, '7:00:00 AM'),
    (7, '9:00:00 AM'),
    (7, '1:00:00 PM'),
    (7, '3:00:00 PM'),
    (7, '6:00:00 PM'),
    (7, '8:00:00 PM'),

    (8, '5:00:00 AM'),
    (8, '8:00:00 AM'),
    (8, '11:00:00 AM'),
    (8, '3:00:00 PM'),
    (8, '5:00:00 PM'),
    (8, '9:00:00 PM'),
    (8, '11:00:00 PM'),
    
    (9, '2:00:00 AM'),
    (9, '5:00:00 AM'),
    (9, '9:00:00 AM'),
    (9, '12:00:00 PM'),
    (9, '4:00:00 PM'),
    (9, '7:00:00 PM'),
    (9, '11:00:00 PM'),

    (10, '5:00:00 AM'),
    (10, '9:00:00 AM'),
    (10, '12:00:00 PM'),
    (10, '3:00:00 PM'),
    (10, '5:00:00 PM'),
    (10, '8:00:00 PM'),
    (10, '10:00:00 PM'),

    (11, '1:00:00 AM'),
    (11, '4:00:00 AM'),
    (11, '7:00:00 AM'),
    (11, '11:15:00 AM'),
    (11, '2:00:00 PM'),
    (11, '5:00:00 PM'),
    (11, '8:00:00 PM'),
    (11, '11:00:00 PM'),


    (12, '3:00:00 AM'),
    (12, '7:00:00 AM'),
    (12, '9:00:00 AM'),
    (12, '1:00:00 PM'),
    (12, '3:00:00 PM'),
    (12, '6:00:00 PM'),
    (12, '8:00:00 PM'),

    (13, '4:00:00 AM'),
    (13, '5:00:00 AM'),
    (13, '8:00:00 AM'),
    (13, '1:00:00 PM'),
    (13, '4:00:00 PM'),
    (13, '7:00:00 PM'),
    (13, '10:00:00 PM'),

    (14, '5:00:00 AM'),
    (14, '8:00:00 AM'),
    (14, '12:00:00 PM'),
    (14, '3:00:00 PM'),
    (14, '5:00:00 PM'),
    (14, '8:00:00 PM'),
    (14, '11:00:00 PM'),

    (15, '3:00:00 AM'),
    (15, '6:00:00 AM'),
    (15, '10:00:00 AM'),
    (15, '1:00:00 PM'),
    (15, '4:00:00 PM'),
    (15, '7:00:00 PM'),
    (15, '10:00:00 PM'),

    (16, '4:00:00 AM'),
    (16, '5:00:00 AM'),
    (16, '8:00:00 AM'),
    (16, '11:45:00 AM'),
    (16, '1:00:00 PM'),
    (16, '4:50:00 PM'),
    (16, '7:00:00 PM'),
    (16, '10:00:00 PM'),

    (17, '3:00:00 AM'),
    (17, '7:00:00 AM'),
    (17, '9:00:00 AM'),
    (17, '1:00:00 PM'),
    (17, '3:00:00 PM'),
    (17, '6:00:00 PM'),
    (17, '8:00:00 PM'),

    (18, '5:00:00 AM'),
    (18, '9:00:00 AM'),
    (18, '12:00:00 PM'),
    (18, '3:00:00 PM'),
    (18, '5:00:00 PM'),
    (18, '8:00:00 PM'),
    (18, '10:00:00 PM'),

    (19, '2:00:00 AM'),
    (19, '5:00:00 AM'),
    (19, '8:00:00 AM'),
    (19, '12:30:00 PM'),
    (19, '3:00:00 PM'),
    (19, '6:00:00 PM'),
    (19, '9:00:00 PM'),

    (20, '3:00:00 AM'),
    (20, '7:00:00 AM'),
    (20, '9:00:00 AM'),
    (20, '1:00:00 PM'),
    (20, '3:00:00 PM'),
    (20, '6:00:00 PM'),
    (20, '8:00:00 PM'),

    (21, '2:00:00 AM'),
    (21, '5:00:00 AM'),
    (21, '9:00:00 AM'),
    (21, '12:00:00 PM'),
    (21, '3:00:00 PM'),
    (21, '6:00:00 PM'),
    (21, '9:00:00 PM'),

    (22, '4:00:00 AM'),
    (22, '5:00:00 AM'),
    (22, '8:00:00 AM'),
    (22, '1:00:00 PM'),
    (22, '4:00:00 PM'),
    (22, '7:00:00 PM'),
    (22, '10:00:00 PM');