select * from xplus_fission.fission_user where user_nickname= 0001;

select count(id) from xplus_fission.fission_user;

select user_nickname,children_num from xplus_fission.fission_user where id= 1699363227530694656;

select sum(stat_parent_revenue) from xplus_fission.mining_v2 order by stat_parent_revenue desc limit 100;

select user_id,state,amount,create_time from red_packet where state in (2,4);

SELECT 1070 + 1070 AS sum_result;

select * from xplus_fission.mining_v2 join xplus_fission.fission_user;

SELECT * FROM xplus_fission.mining_v2 a INNER JOIN xplus_fission.fission_user b ON a.id = b.id WHERE b.user_id = 1699664853154795520;
select a.id,a.user_id,a.user_nickname,b.user_id,b.stat_parent_revenue,b.mining_start_time from xplus_fission.fission_user a JOIN xplus_fission.mining_v2 b ON a.user_id=b.user_id WHERE a.user_id = 1699664853154795520;

SELECT a.id, a.user_id, a.user_nickname, a.children_num,b.stat_parent_revenue, b.mining_start_time
FROM xplus_fission.fission_user a
JOIN xplus_fission.mining_v2 b ON a.user_id = b.user_id
WHERE a.user_id = 1699664853154795520;

select fission_user.user_id,fission_user.user_nickname,mining_v2.user_id,mining_v2.stat_parent_revenue
from fission_user
right join mining_v2 on fission_user.user_id = mining_v2.user_id where mining_v2.user_id = 1719171254180777984;

select fission_user.user_nickname,fission_user.user_id,avg(fission_user.children_num) as avg_children_num
from fission_user
group by user_nickname
having avg(children_num) >5
ORDER BY avg_children_num desc;

select user_id,user_nickname,children_num
from fission_user
where children_num> (select avg(children_num) from fission_user where children_num =6)
order by children_num desc;

SELECT
    f.user_id,
    f.user_nickname,
    f.children_num,
    m.total_revenue,
    m.claim_time,
    m.state
FROM
    fission_user f
JOIN
    mining_v2 m ON f.user_id = m.user_id
WHERE
    m.claim_time BETWEEN '2023-10-10' AND '2023-12-19'
ORDER BY
    f.children_num DESC;

-- 根据用户usernam或社交媒体username查询用户的持有token
SELECT
        b.user_id,
        b.balance,
        b.available_balance,
        b.frozen_balance,
        c.token_symbol,
        d.network_name
FROM
        xplus_im.user_account AS a
        LEFT JOIN xplus_asset.account AS b ON a.user_id = b.user_id
        LEFT JOIN xplus_asset.chain_erc20_token AS c ON b.type_id = c.id
        LEFT JOIN xplus_asset.chain_network AS d ON c.chain_id = d.chain_id
WHERE
        a.account_uid = '0x85400572C08dba28b4596F16904735C72625c3aF'
        AND b.account_type = '2';

select count(id) from fission_user;


-- 根据username查询discord签到奖励到账或查询xcoin出入帐记录
SELECT
        a.id,
        a.username,
        c.record_type,
        c.amount,
        c.booking_time
FROM
        xplus_im.`user` as a
        LEFT JOIN xplus_asset.account as b on a.id = b.user_id
        LEFT JOIN xplus_asset.account_record as c on b.id = c.account_id
WHERE
        a.username = 'ko' AND c.record_type = '12';

select fission_user.user_id,fission_user.user_nickname,mining_v2.user_id,mining_v2.stat_parent_revenue
from fission_user
right join mining_v2 on fission_user.user_id = mining_v2.user_id
where fission_user.user_id = 1719171254180777984