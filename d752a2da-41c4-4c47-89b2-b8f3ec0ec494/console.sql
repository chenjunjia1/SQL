select fission_user.user_nickname,fission_user.user_id,avg(fission_user.children_num) as avg_children_num
from fission_user
group by user_nickname
having avg(children_num) >5
ORDER BY avg_children_num desc;

SELECT
    user_nickname,
    user_id,
    AVG(children_num) AS avg_children_num,
    SUM(AVG(children_num)) OVER () AS total_avg_children_num
FROM
    fission_user
GROUP BY
    user_nickname, user_id
HAVING
    AVG(children_num) > 5
ORDER BY
    avg_children_num DESC;
select count(id) from fission_user;