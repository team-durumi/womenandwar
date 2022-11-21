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

#### 공지/보도자료 id:1

EMPTY	17
공지	177
문서	8
보도자료	246