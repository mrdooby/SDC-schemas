-- reviews.csv
-- id,product_id,rating,date,summary,body,recommend,reported,reviewer_name,reviewer_email,response,helpfulness
-- 1,1,5,1596080481467,"This product was great!","I really did or did not like this product based on whether it was sustainably sourced.  Then I found out that its made from nothing at all.",true,false,"funtime","first.last@gmail.com",null,8
-- 2,1,4,1610178433963,"This product was ok!","I really did not like this product solely because I am tiny and do not fit into it.",false,false,"mymainstreammother","first.last@gmail.com",null,2

-- characteristics_reviews.csv
-- id,characteristic_id,review_id,value
-- 1,1,1,4
-- 2,2,1,3
-- 3,3,1,5

-- reviews_photos.csv
-- id,review_id,url
-- 1,5,"https://images.unsplash.com/photo-1560570803-7474c0f9af99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80"
-- 2,5,"https://images.unsplash.com/photo-1561693532-9ff59442a7db?ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80"

-- characteristics.csv
-- id,product_id,name
-- 1,1,"Fit"
-- 2,1,"Length"
-- 3,1,"Comfort"
-- 4,1,"Quality"
CREATE TABLE product (
  product_id INTEGER UNIQUE,
  meta_data INTEGER,
  reviews TEXT[][],
  PRIMARY KEY product_id
);

-- avg and totals will be calculated based on review table
CREATE TABLE meta_data (
  id INTEGER SERIAL,
  product_id INTEGER,
  total_ratings INTEGER,
  total_recommended INTEGER,
  avg_characteristics INTEGER,
  PRIMARY KEY product_id REFERENCES product(product_id),
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
  reported BOOLEAN,
  photos text[][]
  reviewer_name TEXT,
  reviewer_email TEXT,
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