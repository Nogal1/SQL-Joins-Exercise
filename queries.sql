-- write your queries here

-- Join the tables
SELECT o.id, o.first_name, o.last_name, c.id, c.make, c.model, c.year, c.price, c.owner_id
FROM owners o
LEFT JOIN vehicles c
ON o.id = c.owner_id
ORDER BY o.id, c.id;

-- Count the number of vehicles for each owner
SELECT o.first_name, o.last_name, COUNT(c.id) AS count
FROM owners o
LEFT JOIN vehicles c
ON o.id = c.owner_id
GROUP BY o.first_name, o.last_name
ORDER BY o.first_name ASC;

-- Count the number of cars and calculate the average price for each owner. 
SELECT o.first_name, o.last_name, AVG(c.price)::int AS average_price, COUNT(c.id) AS count
FROM owners o
LEFT JOIN vehicles c
ON o.id = c.owner_id
GROUP BY o.first_name, o.last_name
HAVING COUNT(c.id) > 1 AND AVG(c.price) > 10000
ORDER BY o.first_name DESC;

