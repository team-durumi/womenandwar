-- 보도자료 <= 공지/보도자료:분류:보도자료
SELECT
  c.`uid` AS 'id'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,c.`content`
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,c.`notice` AS 'pinned'
  ,c.`image`
  ,GROUP_CONCAT(a.`file_name` SEPARATOR '|') AS 'files_name'
  ,GROUP_CONCAT(a.`file_path` SEPARATOR '|') AS 'files_path'
  ,GROUP_CONCAT(a.`download_count` SEPARATOR '|') AS 'files_download_count'
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `kr_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '1'
  AND c.`category1` = '보도자료'
GROUP BY c.`uid`;
