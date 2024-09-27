-- url exercise:https://leetcode.com/problems/get-highest-answer-rate-question/
-- Medium level
WITH calculated_column_answer_rate AS (
    SELECT *,
    COUNT(answer_id) AS counter_of_answered,
    COUNT(q_num) OVER(PARTITION BY q_num) AS counter_of_showed
    FROM SurveyLog
    GROUP BY question_id
),

new_column_answer_rate AS (SELECT *,
(counter_of_answered * counter_of_answered) AS answer_rate 
FROM calculated_column_answer_rate),

found_the_maximun_answered AS (SELECT *, 
MAX(answer_rate) AS maximum_answer
FROM new_column_answer_rate 
GROUP BY question_id
ORDER BY maximum_answer DESC, question_id ASC
LIMIT 1
)

SELECT question_id as survey_log
FROM found_the_maximun_answered