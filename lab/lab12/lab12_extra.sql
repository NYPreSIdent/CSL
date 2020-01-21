.read lab12.sql

CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students GROUP BY smallest HAVING COUNT(*) = 1;

CREATE TABLE fa19favpets AS
  SELECT pet, COUNT(*) AS count FROM students GROUP BY a.pet
  ORDER BY count DESC LIMIT 10;


CREATE TABLE fa19dog AS
  SELECT pet AS dog, count FROM fa19favpets WHERE pet = 'dog';


CREATE TABLE obedienceimages AS
  SELECT seven, instructor, COUNT(*) AS count FROM students WHERE seven = "7"
  GROUP BY instructor ORDER BY instructor;
