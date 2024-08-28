-- url exercise:https://leetcode.com/problems/queries-quality-and-percentage

SELECT query_name, ROUND((AVG(rating / position)),2) AS quality, ROUND(AVG(IF(rating < 3,1, 0))*100, 2) AS poor_query_percentage FROM Queries
GROUP BY query_name 
HAVING query_name is not null;