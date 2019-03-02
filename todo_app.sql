DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael
WITH PASSWORD "stonebreaker";

CREATE DATABASE todo_app;

\c todo_app;
CREATE TABLE tasks
(
    id SERIAL,
    title VARCHAR(255) NOT NULL,
    description text NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NULL,
    completed boolean NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks
    ADD PRIMARY KEY (id)
,
DROP COLUMN completed,
ADD COLUMN completed_at TIMESTAMP NULL DEFAULT NULL,
ALTER COLUMN updated_at
SET
NOT NULL,
ALTER COLUMN updated_at
SET
DEFAULT now
();

INSERT INTO tasks
VALUES
    (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
INSERT INTO tasks
VALUES
    (DEFAULT, 'Study PostgreSQL', 'Read all the documentation', DEFAULT, DEFAULT, DEFAULT);
SELECT
    *
FROM
    tasks
WHERE
    completed_at = NULL;

UPDATE
    tasks
SET
    completed_at = now()
WHERE
    title = 'Study SQL';

SELECT
    title description
FROM
    tasks
WHERE
    completed_at = NULL;

SELECT
    *
FROM
    tasks
ORDER BY
    created_at DESC;

INSERT INTO tasks
VALUES
    (DEFAULT, 'mistake1', 'a test entry', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO tasks
VALUES
    (DEFAULT, 'mistake2', 'another test entry', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO tasks
VALUES
    (DEFAULT, 'third mistake', 'another test entry', DEFAULT, DEFAULT, DEFAULT);
SELECT
    title
FROM
    tasks
WHERE
    title
~ 'mistake';

DELETE FROM tasks
WHERE title
= 'mistake1';

SELECT
    title description
FROM
    tasks
WHERE
    title
~ 'mistake';

DELETE FROM tasks WHERE title
~ 'mistake';

SELECT
    *
FROM
    tasks
ORDER BY
    title ASC;

