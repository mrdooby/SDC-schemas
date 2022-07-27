CREATE TABLE product (
  product_id INTEGER UNIQUE,
  meta_data INTEGER,
  reviews TEXT[][],
  PRIMARY KEY product_id
);

CREATE TABLE meta_data (
  id INTEGER SERIAL,
  product_id INTEGER,
  total_ratings INTEGER,
  total_recommended INTEGER,
  avg_characteristics INTEGER,
  PRIMARY KEY product_id REFERENCES product(product_id),
  FOREIGN KEY total_ratings REFERENCES total_ratings(id) WHERE product_id = total_ratings(product_id),
  FOREIGN KEY total_recommended REFERENCES total_recommended(id) WHERE product_id = total_recommended(product_id),
  FOREIGN KEY avg_characteristics REFERENCES avg_characteristics(id) WHERE product_id = avg_characteristics(product_id)
)

CREATE TABLE total_ratings (
  id INTEGER SERIAL,
  product_id INTEGER,
  five INTEGER,
  four INTEGER,
  three INTEGER,
  two INTEGER,
  one INTEGER,
  PRIMARY KEY id
)

CREATE TABLE total_recommended (
  id INTEGER SERIAL,
  product_id INTEGER,
  true BOOLEAN,
  false BOOLEAN
  PRIMARY KEY id
)

CREATE TABLE avg_characteristics (
  id INTEGER SERIAL,
  product_id INTEGER,
  fit DECIMAL(3, 2),
  _length DECIMAL(3, 2),
  comfort DECIMAL(3,2),
  quality DECIMAL (3,2),
  PRIMARY KEY id
)

CREATE TABLE reviews (
  review_id INTEGER UNIQUE SERIAL,
  product_id INTEGER,
  rating INTEGER,
  summary VARCHAR(60),
  body VARCHAR(1000),
  _date DATE,
  recommended BOOLEAN,
  characteristics INTEGER,
  helpfulness BOOLEAN,
  photos text[][]
  reviewer_name TEXT,
  email TEXT
  PRIMARY KEY review_id,
  FOREIGN KEY characteristics REFERENCES characteristics(id) WHERE review_id = characteristics(review_id)
)
-- will create index on reviews(ratings) to help sort by rating
-- will create index on reviews(product_id) to get easier access to the current product's reviews
CREATE TABLE characteristics (
  id INTEGER,
  review_id INTEGER,
  fit INTEGER,
  _length INTEGER,
  comfort INTEGER,
  quality INTEGER,
  PRIMARY KEY id
)