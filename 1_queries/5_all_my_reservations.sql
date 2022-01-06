SELECT p.*, reservations.*,
AVG(rating) AS average_rating
FROM reservations
JOIN properties p ON p.id = property_id
JOIN property_reviews ON p.id = property_reviews.property_id
WHERE reservations.guest_id = 1 AND end_date < now()::date
GROUP BY p.id, reservations.id
ORDER BY start_date
LIMIT 10;