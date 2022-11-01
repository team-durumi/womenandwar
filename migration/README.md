## 마이그레이션

- <https://github.com/team-durumi/womenandwar/issues/9>
- https://docs.google.com/spreadsheets/d/1j1u0yy4UG0dcWfCJgX8Zibf-xvGF7j-AJ39kEP5nOs4/edit#gid=0

```
도착지 <= 출발지

공지사항 <= 공지/보도자료:분류:공지
보도자료 <= 공지/보도자료:분류:보도자료
자료실 <=
  * 공지/보도자료:분류:문서
  * 자료실:제목:[수요시위 성명서]
  * 자료실:제목:언론동향
  * 연대단체 활동소식
자료실 분류추가:
  * 본국상대소송
  * 역사부정론 반박
```

### 출발지 `kr_kboard_board_setting`

- 공지/보도자료 id:1
- 자료실 id:7
- 연대단체 활동소식 id:9

```sql
-- 공지사항 <= 공지/보도자료:분류:공지 -- 174
SELECT
  c.`uid` AS 'id'
  ,c.`category1` AS 'category'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,c.`content`
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,a.`file_name`
  ,a.`file_path`
  ,a.`download_count`
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `jt_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '1'
  AND c.`category1` = '공지';

-- 보도자료 <= 공지/보도자료:분류:보도자료 -- 239
SELECT
  c.`uid` AS 'id'
  ,c.`category1` AS 'category'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,SUBSTRING(c.`content`, 1, 255)
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,a.`file_name`
  ,a.`file_path`
  ,a.`download_count`
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `jt_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '1'
  AND c.`category1` = '보도자료';

-- 자료실 <= 공지/보도자료:분류:문서 -- 9
SELECT
  `uid` AS 'id'
  ,`category1` AS 'category'
  ,`member_uid` AS 'uid'
  ,`member_display` AS 'author_name'
  ,`title`
  ,`content`
  ,`date` AS 'created'
  ,`update` AS 'updated'
FROM
  `kr_kboard_board_content`
WHERE
  `status` != 'trash'
  AND `board_id` = '1'
  AND `category1` = '문서';

-- 자료실 <= 자료실:제목:[수요시위 성명서] -- 144
SELECT
  `uid` AS 'id'
  ,`category1` AS 'category'
  ,`member_uid` AS 'uid'
  ,`member_display` AS 'author_name'
  ,`title`
  ,`content`
  ,`date` AS 'created'
  ,`update` AS 'updated'
FROM
  `kr_kboard_board_content`
WHERE
  `status` != 'trash'
  AND `board_id` = '7'
  AND `title` LIKE ('[수요시위 성명서]%');

-- 자료실 <= 자료실:제목:언론동향 -- 31
SELECT
  `uid` AS 'id'
  ,`category1` AS 'category'
  ,`member_uid` AS 'uid'
  ,`member_display` AS 'author_name'
  ,`title`
  ,`content`
  ,`date` AS 'created'
  ,`update` AS 'updated'
FROM
  `kr_kboard_board_content`
WHERE
  `status` != 'trash'
  AND `board_id` = '7'
  AND `title` LIKE ('%언론동향%');

-- 자료실 <= 연대단체 활동소식 -- 13
SELECT
  `uid` AS 'id'
  ,`category1` AS 'category'
  ,`member_uid` AS 'uid'
  ,`member_display` AS 'author_name'
  ,`title`
  ,`content`
  ,`date` AS 'created'
  ,`update` AS 'updated'
FROM
  `kr_kboard_board_content`
WHERE
  `status` != 'trash'
  AND `board_id` = '9';

-- 자료실 전체
SELECT
  c.`uid` AS 'id'
  ,c.`category1` AS 'category'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,c.`content`
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,a.`file_name`
  ,a.`file_path`
  ,a.`download_count`
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `jt_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '1'
  AND c.`category1` = '문서'
UNION
SELECT
  c.`uid` AS 'id'
  ,c.`category1` AS 'category'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,c.`content`
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,a.`file_name`
  ,a.`file_path`
  ,a.`download_count`
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `jt_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '7'
  AND c.`title` LIKE ('[수요시위 성명서]%')
UNION
SELECT
  c.`uid` AS 'id'
  ,c.`category1` AS 'category'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,c.`content`
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,a.`file_name`
  ,a.`file_path`
  ,a.`download_count`
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `jt_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '7'
  AND c.`title` LIKE ('%언론동향%')
UNION
SELECT
  c.`uid` AS 'id'
  ,c.`category1` AS 'category'
  ,c.`member_uid` AS 'uid'
  ,c.`member_display` AS 'author_name'
  ,c.`title`
  ,c.`content`
  ,c.`date` AS 'created'
  ,c.`update` AS 'updated'
  ,a.`file_name`
  ,a.`file_path`
  ,a.`download_count`
FROM
  `kr_kboard_board_content` c
  LEFT OUTER JOIN `jt_kboard_board_attached` a ON c.`uid` = a.`content_uid`
WHERE
  c.`status` != 'trash'
  AND c.`board_id` = '9'
ORDER BY `id` ASC;
```
