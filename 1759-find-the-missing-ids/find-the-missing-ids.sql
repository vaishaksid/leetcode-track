WITH RECURSIVE all_numbers AS (
    -- Step 1: Start from 1
    SELECT 1 AS id

    UNION ALL

    -- Step 2: Add 1 each time until max customer_id
    SELECT id + 1
    FROM all_numbers
    WHERE id + 1 <= (SELECT MAX(customer_id) FROM Customers)
)

-- Step 3: Find which ids are not in Customers table
SELECT id AS ids
FROM all_numbers
WHERE id NOT IN (SELECT customer_id FROM Customers);
