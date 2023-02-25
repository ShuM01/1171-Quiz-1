IF TABLE EXISTS DROP TABLE albums;
DROP TABLE albums CASCADE;
IF TABLE EXISTS DROP TABLE tracks;
DROP TABLE tracks CASCADE;

CREATE TABLE albums(
    album_id integer PRIMARY KEY,
    title text NOT NULL,
    artist text NOT NULL
);

CREATE TABLE tracks(
    track_id integer PRIMARY KEY,
    track text NOT NULL,
    artist text NOT NULL,
    length text NOT NULL

);

INSERT INTO albums(album_id, title, artist)
    VALUES 
    (001, 'Smithereens', 'Joji'),
    (002, 'SOS', 'SZA'),
    (003, 'Give or Take', 'Giveon'),
    (004, 'Industry Plant', 'Iann Dior'),
    (005, 'tickets to my downfall', 'Machine Gun Kelly'),
    (006, 'Gemini Rights', 'Steve Lacy'),
    (007, 'Wings', 'BTS'),
    (008, 'Goodbye and Good Riddance', 'Juice Wrld'),
    (009, 'ALL OUT', 'k/da'),
    (010, 'Nectar', 'Joji');
;
INSERT INTO tracks(track_id, track, artist, length)
    VALUES 
    (001, 'Die For You', 'Joji', '3:31'),
    (002, 'Kill Bill', 'SZA', '2:33'),
    (003, 'For Tonight', 'Giveon', '3:12'),
    (004, 'In Too Deep', 'Iann Dior', '2;42'),
    (005, 'bloody valentine', 'Machine Gun Kelly', '3:25'),
    (006, 'Bad Habit', 'Steve Lacy', '3:52'),
    (007, 'Blood Sweat & Tears', 'BTS', '3:37'),
    (008, 'Lucid Dreams', 'Juice Wrld', '4:00'),
    (009, 'MORE', 'k/da', '3:37'),
    (010, 'Sancturay', 'Joji','3:00');