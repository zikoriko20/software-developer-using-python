
SELECT c.email
FROM customer c
    INNER JOIN rental r
    ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14';

SELECT c.email
FROM customer c
    INNER JOIN rental r
    ON c.customer_id = r.customer_id
WHERE date(r.rental_date) <> '2005-06-14';

/* It's good practice to run a select command on the data to be deleted prior */
/* to running the delete so you can see exactly what is being deleted */
SELECT * FROM rental
WHERE year(rental_date) = 2004;

DELETE FROM rental
WHERE year(rental_date) = 2004;

/* sqlite does not have a year function. Use the following queries instead */
/* Note that this function returns the value as a string and must be compared */
/* as such. */
SELECT * FROM rental
WHERE strftime('%Y', rental_date) = '2004';

DELETE FROM rental
WHERE strftime('%Y', rental_date) = '2004';

SELECT customer_id, rental_date
FROM rental
WHERE rental_date < '2005-05-25';

SELECT customer_id, rental_date
FROM rental
WHERE rental_date <= '2005-06-16'
AND rental_date >= '2005-06-14';

SELECT customer_id, rental_date
FROM rental
WHERE rental_date BETWEEN '2005-06-14' AND '2005-06-16';

SELECT customer_id, rental_date
FROM rental
WHERE rental_date BETWEEN '2005-06-16' AND '2005-06-14';

SELECT customer_id, payment_date, amount
FROM payment
WHERE amount BETWEEN 10.0 AND 11.99;

SELECT last_name, first_name
FROM customer
WHERE last_name BETWEEN 'FA' AND 'FR';

SELECT last_name, first_name
FROM customer
WHERE last_name BETWEEN 'FA' AND 'FRB';

SELECT title, rating
FROM film
WHERE rating = 'G' OR rating = 'PG';

SELECT title, rating
FROM film
WHERE rating IN ('G','PG');

SELECT title, rating
FROM film
WHERE rating IN (SELECT rating FROM film WHERE title LIKE '%PET%');

SELECT title, rating
FROM film
WHERE rating NOT IN ('PG-13','R', 'NC-17');

SELECT last_name, first_name
FROM customer
WHERE left(last_name, 1) = 'Q';

/* sqlite does not support the left function. */
/* You can use the substr (substring) function in it's place. */
SELECT last_name, first_name
FROM customer
WHERE substr(last_name, 1, 1) = 'Q';

SELECT last_name, first_name
FROM customer
WHERE last_name LIKE '_A_T%S';

SELECT last_name, first_name
FROM customer
WHERE last_name LIKE 'Q%' OR last_name LIKE 'Y%';

SELECT last_name, first_name
FROM customer
WHERE last_name REGEXP '^[QY]';

SELECT rental_id, customer_id
FROM rental
WHERE return_date IS NULL;

SELECT rental_id, customer_id, return_date
FROM rental
WHERE return_date IS NOT NULL;

SELECT rental_id, customer_id, return_date
FROM rental
WHERE return_date NOT BETWEEN '2005-05-01' AND '2005-09-01';

SELECT rental_id, customer_id, return_date
FROM rental
WHERE return_date IS NULL
OR return_date NOT BETWEEN '2005-05-01' AND '2005-09-01';