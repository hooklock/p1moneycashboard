DROP TABLE purchases;
DROP TABLE categories;
DROP TABLE merchants;
DROP TABLE accounts;


CREATE TABLE accounts(
  id SERIAL4 PRIMARY KEY,
  acc_num INT4,
  acc_name VARCHAR(255),
  balance NUMERIC(15,2)
);

CREATE TABLE merchants(
  id SERIAL4 PRIMARY KEY,
  mer_name VARCHAR(255)
);

CREATE TABLE categories(
  id SERIAL4 PRIMARY KEY,
  cat_name VARCHAR(255),
  budget NUMERIC(15,2)
);

CREATE TABLE purchases(
  id serial4 PRIMARY KEY,
  pur_date DATE,
  pur_amount NUMERIC(15,2),
  description VARCHAR(255),
  mer_id INT4 references merchants(id) ON DELETE CASCADE,
  acc_id INT4 references accounts(id) ON DELETE CASCADE,
  cat_id INT4 references categories(id) ON DELETE CASCADE
);
 