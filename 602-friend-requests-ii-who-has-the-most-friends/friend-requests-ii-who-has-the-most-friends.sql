WITH Friendships AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id FROM RequestAccepted
),
FriendCounts AS (
    SELECT id, COUNT(*) AS num
    FROM Friendships
    GROUP BY id
),
MaxFriends AS (
    SELECT MAX(num) AS max_num
    FROM FriendCounts
)
SELECT f.id, f.num
FROM FriendCounts f
JOIN MaxFriends mf ON f.num = mf.max_num
