SELECT T.id
FROM Weather T
JOIN Weather Y
  ON T.recordDate = DATE_ADD(Y.recordDate, INTERVAL 1 DAY)
WHERE T.temperature > Y.temperature;
