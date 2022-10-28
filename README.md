# 정의기억연대 홈페이지

## stage
- stage.womenandwar.net
- 정의기억연대 cloudflare 연결 / 정의연 netlify 연결
- zwoo@womenandwar.net(계정)

## storage
- 정의기억연대 cloudflare R2로 내부 인프라를 모두 옮기는 작업
- 박물관, 홈페이지, 추후 아카이브도 R2를 사용하도록 연계
|- 박물관 : items, exhibition, shop 관련 원본 자료 연계
|- 홈페이지 : 계속적으로 늘어나는 미디어 파일 관리
|- 추후 공개하는 아카이브 : 공개 파일 관리 공간

## themes
```
imports:
- path: github.com/team-durumi/theme-wwm
```

## wordpress to hugo markdown
- from xml 1309 
- 공지사항 board류들 처리 이슈가 있음.


## post
- wordpress post type은 활동소개
- 활동소개에 categories로 분리 
- 국내연대
-- 나비기금, 전시성폭력재발방지는 해외연대 안에 나비기금


## 활동소개
- 피해자지원
-- 생존자복지쉼터소식
- 수요시위
-- 이번 주 수요시위
- 국내연대
-- 연대사업
- 해외연대
-- 나비기금, 전시성폭력재발방지는 해외연대 안에 나비기금
- 교육사업
-- 연구조사 / 교육연대사업 / 장학사업
- 평화비(평화비건립)
-- 기림사업
- 미디어자료 (메뉴 너무 많음)
--  동영상 

 (해당없음)모금소식 / 일본국상대소송

## 살림살이
- budget 게시판 형태로 구성