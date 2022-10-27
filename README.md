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