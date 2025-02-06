CREATE TABLE corporation
 (corp_id SMALLINT,
  name VARCHAR(30),
  CONSTRAINT pk_corporation PRIMARY KEY (corp_id)
 );

INSERT INTO corporation (corp_id, name)
VALUES (27, 'Acme Paper Corporation');

SELECT name
FROM corporation
WHERE corp_id = 27;

/* For demo purposes only. This data was not created in the database */
SELECT t.txn_id, t.txn_type_cd, t.txn_date, t.amount
FROM individual i
  INNER JOIN account a ON i.cust_id = a.cust_id
  INNER JOIN product p ON p.product_cd = a.product_cd
  INNER JOIN transaction t ON t.account_id = a.account_id
WHERE i.fname = 'George' AND i.lname = 'Blake'
  AND p.name = 'checking account';

/* For demo purposes only. This data was not created in the database */
SELECT t.txn_id, t.txn_type_cd, t.txn_date, t.amount
FROM account a
  INNER JOIN transaction t ON t.account_id = a.account_id
WHERE a.cust_id = 8 AND a.product_cd = 'CHK';

/* For demo purposes only. This data was not created in the database */
SELECT cust_id, fname
FROM individual
WHERE lname = 'Smith';

/* For demo purposes only. This data was not created in the database */
INSERT INTO product (product_cd, name)
VALUES ('CD', 'Certificate of Depysit')

/* For demo purposes only. This data was not created in the database */
UPDATE product
SET name = 'Certificate of Deposit'
WHERE product_cd = 'CD';