CREATE SCHEMA IF NOT EXISTS geo_test;
	
CREATE TABLE geo_test.test_point (
	id INTEGER NOT NULL,
	task INTEGER,
	x DOUBLE PRECISION,
	y DOUBLE PRECISION,
	z DOUBLE PRECISION
);
CREATE TABLE geo_test.task (
	id INTEGER NOT NULL PRIMARY KEY,
	name TEXT
);

CREATE INDEX test_point_task_id_index
	ON geo_test.test_point(task, id);

ALTER TABLE geo_test.test_point
	ADD PRIMARY KEY (id);

ALTER TABLE geo_test.test_point
   ADD CONSTRAINT fk_task_id
   FOREIGN KEY (task) 
   REFERENCES geo_test.task(id);
   
INSERT INTO geo_test.task
	VALUES(1, 'task1');   
INSERT INTO geo_test.test_point 
	VALUES(1, 1, 1, 0, 0);
INSERT INTO geo_test.test_point
	VALUES(2, 1, 0, 1, 0);
INSERT INTO geo_test.test_point
	VALUES(3, 1, 0, 0, 1);

SELECT * FROM geo_test.test_point WHERE id = 2;