SELECT *
FROM users
ORDER BY created_at
LIMIT 5;


SELECT
   DAYNAME(created_at) AS Day,
   COUNT(*) AS Total
FROM users
GROUP BY Day
ORDER BY Total DESC
LIMIT 2;


SELECT username
FROM users
LEFT JOIN photos
       ON users.id = photos.user_id
WHERE photos.id IS NULL;


SELECT
      username,
      photos.id,
      photos.image_url,
      COUNT(*) AS Total 
FROM photos
INNER JOIN likes
        ON photos.id = likes.photo_id
INNER JOIN users
        ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY Total DESC
LIMIT 1;


SELECT
    (SELECT COUNT(*) FROM photos) /
    (SELECT COUNT(*) FROM users) AS avg_user;
    

SELECT
      tags.tag_name,
      COUNT(*) AS total
FROM photo_tags
JOIN tags
  ON photo_tags.tag_id = tags.id
 GROUP BY tags.id
 ORDER BY total
 LIMIT 5;
 
 
SELECT
      username,
      COUNT(*) AS num_likes
FROM users
INNER JOIN likes
        ON users.id = likes.user_id
GROUP By likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);