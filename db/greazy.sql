DROP TABLE deals;
DROP TABLE burgers;
DROP TABLE eateries;

CREATE TABLE eateries (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  contact VARCHAR(255),
  logo VARCHAR(255)
);

CREATE TABLE burgers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  price INT2,
  logo VARCHAR(255)
);

CREATE TABLE deals (
  id SERIAL4  PRIMARY KEY,
  name VARCHAR(255),
  discount FLOAT(2),
  day VARCHAR(255),
  eatery_id INT4 REFERENCES eateries(id) ON DELETE CASCADE,
  burger_id INT4 REFERENCES burgers(id) ON DELETE CASCADE
);
