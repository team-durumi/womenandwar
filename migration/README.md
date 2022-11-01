## 마이그레이션

<https://github.com/team-durumi/womenandwar/issues/9>

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
  *
FROM
  `kr_kboard_board_content`
WHERE
  `status` != 'trash'
  AND `board_id` = '1'
  AND `category1` = '공지';

-- 보도자료 <= 공지/보도자료:분류:보도자료 -- 239
SELECT
  *
FROM
  `kr_kboard_board_content`
WHERE
  `status` != 'trash'
  AND `board_id` = '1'
  AND `category1` = '보도자료';

-- 자료실 <= 공지/보도자료:분류:문서 -- 9
SELECT
  *
FROM
  `kr_kboard_board_content`
WHERE
  `status` != 'trash'
  AND `board_id` = '1'
  AND `category1` = '문서';

-- 자료실 <= 자료실:제목:[수요시위 성명서] -- 144
SELECT
  *
FROM
  `kr_kboard_board_content`
WHERE
  `status` != 'trash'
  AND `board_id` = '7'
  AND `title` LIKE ('[수요시위 성명서]%');

-- 자료실 <= 자료실:제목:언론동향 -- 31
SELECT
  *
FROM
  `kr_kboard_board_content`
WHERE
  `status` != 'trash'
  AND `board_id` = '7'
  AND `title` LIKE ('%언론동향%');

-- 자료실 <= 연대단체 활동소식 -- 13
SELECT
  *
FROM
  `kr_kboard_board_content`
WHERE
  `status` != 'trash'
  AND `board_id` = '9';
```
