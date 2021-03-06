CREATE TABLE sheet_type (
  type_id INT PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR(30)
);

CREATE TABLE variants (
  variant_id INT PRIMARY KEY AUTO_INCREMENT,
  color_id VARCHAR(10),
  description VARCHAR(15),
  name VARCHAR(30),
  colorhex VARCHAR(6),
  type_id INT REFERENCES sheet_type(type_id)
);

CREATE TABLE cut_sizes (
  cut_id INT PRIMARY KEY AUTO_INCREMENT,
  width INT NOT NULL,  
  height INT NOT NULL,
  price DECIMAL,
  type_id INT REFERENCES sheet_type(type_id)
);

CREATE TABLE cutsize_children (
  childcut_id INT PRIMARY KEY AUTO_INCREMENT,
  parent_id INT REFERENCES CUT_SIZES(cut_id),  
  child_id INT REFERENCES CUT_SIZES(cut_id),
  amount INT
);

CREATE TABLE sheet_inventory (
  obj_id INT PRIMARY KEY AUTO_INCREMENT,
  trans_id INT,
  variant_id INT,
  cut_id INT
);

CREATE TABLE sheet_transaction (
  trans_id INT PRIMARY KEY AUTO_INCREMENT,
  staff_id VARCHAR(10),
  removed_date datetime
);

ALTER TABLE `acct_charge`
  ADD `sheet_trans_id` INT;