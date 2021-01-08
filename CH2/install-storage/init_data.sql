CREATE TABLE characters (
	    id SERIAL PRIMARY KEY,
	    name varchar(50),
	    nationality varchar(50)
);

INSERT INTO characters (name, nationality)
VALUES
    ('Wolfgang Amadeus Mozart', 'Prince-Archbishopric of Salzburg'),
    ('Ludwig van Beethoven', 'Bonn, Germany'),
    ('Johann Sebastian Bach', 'Eisenach, Germany'),
    ('José Pablo Moncayo', 'Guadalajara, México'),
    ('Niccolò Paganini', 'Genoa, Italy');
