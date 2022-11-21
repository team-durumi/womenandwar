-- 자료실 전체
-- 자료실 <= 공지/보도자료:분류:문서
SELECT
  c.`uid` AS 'id'
  ,'문서' AS 'category'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,c.`content`
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,c.`notice` AS 'pinned'
  ,c.`thumbnail_file` AS 'image'
  ,GROUP_CONCAT(a.`file_name` SEPARATOR '|') AS 'files_name'
  ,GROUP_CONCAT(a.`file_path` SEPARATOR '|') AS 'files_path'
  ,GROUP_CONCAT(a.`download_count` SEPARATOR '|') AS 'files_download_count'
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `kr_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '1'
  AND c.`category1` = '문서'
GROUP BY c.`uid`
UNION
-- 자료실 <= 자료실:제목:[수요시위 성명서]
SELECT
  c.`uid` AS 'id'
  ,'수요시위 성명서' AS 'category'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,c.`content`
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,c.`notice` AS 'pinned'
  ,c.`thumbnail_file` AS 'image'
  ,GROUP_CONCAT(a.`file_name` SEPARATOR '|') AS 'files_name'
  ,GROUP_CONCAT(a.`file_path` SEPARATOR '|') AS 'files_path'
  ,GROUP_CONCAT(a.`download_count` SEPARATOR '|') AS 'files_download_count'
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `kr_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '7'
  AND c.`title` LIKE ('[수요시위 성명서]%')
GROUP BY c.`uid`
UNION
-- 자료실 <= 자료실:제목:언론동향
SELECT
  c.`uid` AS 'id'
  ,'언론동향' AS 'category'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,c.`content`
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,c.`notice` AS 'pinned'
  ,c.`thumbnail_file` AS 'image'
  ,GROUP_CONCAT(a.`file_name` SEPARATOR '|') AS 'files_name'
  ,GROUP_CONCAT(a.`file_path` SEPARATOR '|') AS 'files_path'
  ,GROUP_CONCAT(a.`download_count` SEPARATOR '|') AS 'files_download_count'
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `kr_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '7'
  AND c.`title` LIKE ('%언론동향%')
GROUP BY c.`uid`
UNION
-- 자료실 <= 연대단체 활동소식
SELECT
  c.`uid` AS 'id'
  ,'연대단체 활동소식' AS 'category'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,c.`content`
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,c.`notice` AS 'pinned'
  ,c.`thumbnail_file` AS 'image'
  ,GROUP_CONCAT(a.`file_name` SEPARATOR '|') AS 'files_name'
  ,GROUP_CONCAT(a.`file_path` SEPARATOR '|') AS 'files_path'
  ,GROUP_CONCAT(a.`download_count` SEPARATOR '|') AS 'files_download_count'
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `kr_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '9'
GROUP BY c.`uid`
ORDER BY `id` ASC;