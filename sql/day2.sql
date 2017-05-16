DROP TABLE db_1702.student;

CREATE TABLE db_1702.student(
  name VARCHAR(255),
  into TEXT,
  gender CHAR(2)
);

INSERT INTO db_1702.student VALUE ('Tom','yellow','M');

SELECT *
FROM db_1702.student;

SELECT name
FROM db_1702.student;