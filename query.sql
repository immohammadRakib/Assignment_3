
-- LOGICAL QUERIES

-- Query 1: Champions League & Available matches
SELECT
    match_id,
    fixture,
    base_ticket_price
FROM Matches
WHERE
    tournament_category = 'Champions League'
    AND match_status = 'Available';

-- Query 2: Search by Name 'Tanvir' or 'Haque'
SELECT user_id, full_name, email
FROM Users
WHERE
    full_name LIKE 'Tanvir%'
    OR full_name ILIKE '%Haque%';

-- Query 3: NULL handling in payment status
SELECT
    booking_id,
    user_id,
    match_id,
    COALESCE(
        payment_status,
        'Action Required'
    ) AS systematic_status
FROM Bookings
WHERE
    payment_status IS NULL;

-- Query 4: INNER JOIN for booking details
SELECT b.booking_id, u.full_name, m.fixture, b.total_cost
FROM
    Bookings b
    INNER JOIN Users u ON b.user_id = u.user_id
    INNER JOIN Matches m ON b.match_id = m.match_id;

-- Query 5: LEFT JOIN for all users
SELECT u.user_id, u.full_name, b.booking_id
FROM Users u
    LEFT JOIN Bookings b ON u.user_id = b.user_id
ORDER BY u.user_id;

-- Query 6: Bookings higher than average cost
SELECT booking_id, match_id, total_cost
FROM Bookings
WHERE
    total_cost > (
        SELECT AVG(total_cost)
        FROM Bookings
    );

-- Query 7: Top 2 expensive matches skipping the highest one
SELECT
    match_id,
    fixture,
    base_ticket_price
FROM Matches
ORDER BY base_ticket_price DESC
LIMIT 2 OFFSET 1;