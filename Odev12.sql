--1)film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT length, (SELECT ROUND(AVG(length), 3) FROM film)
from film
WHERE length > 
(
SELECT AVG(length) FROM film
)
--2)film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT rental_rate, COUNT(*) FROM film
GROUP BY rental_rate
ORDER BY rental_rate DESC
LIMIT  1 ;
--3)film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
--SELECT MIN(rental_rate), (SELECT MIN(replacement_cost) FROM film) FROM film
--WHERE title = ANY
--(
--SELECT title FROM film
--)
SELECT
	replacement_cost,
	title,
	rental_rate
FROM
	film
WHERE
	rental_rate < 1 AND replacement_cost < 10

--4)payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız
SELECT amount ,customer.first_name, payment.customer_id, customer.customer_id FROM customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
WHERE amount = (
	SELECT MAX(amount) FROM payment
);