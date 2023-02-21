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
- find & replce
```
http://womenandwar.net/kr/wp-content/uploads/2022/01 => https://r2.womenandwar.net/2022/01
https://womenandwar.net/kr/wp-content/uploads//2022/10 => https://r2.womenandwar.net/2022/10
```

## files migration
- 6.239 GiB
```
rclone sync --progress wdrive:backup/kr/wp-content/uploads/ ww:homepage
rclone sync --progress {구글공유드라이브}:backup/kr/wp-content/uploads/ {정의연R2}:homepage
```

## R2
- media.womenandwar.net
| - 관련된 파일관리와 연결해서 홈페이지, 박물관, 함께사용
| - https://media.womenandwar.net/logo/womenandwar_logo.png
- 박물관 소장자료 및 item 파일들의 이동
| - https://r2.womenandwarmuseum.net/ 
- 홈페이지 워드프레스 파일 이동(워드프레스 포스트, kboard 첨부파일, 이미지)
| - https://r2.womenandwar.net/ 
- 관련된 요금 (cloudflare - 정의연 계정)

## R2 - New homepage
- 다년간 이런 방식으로 미디어 관리를 하고, 내부에서 생겨날 문제를 해결해야 함. 
- 22/1105/filename.jpg
- https://media.womenandwar.net/web/brand/womenandwar_logo.png
- 홈페이지에 쓰이는 모든 사진파일도, 박물관의 경험으로 미뤄보아 자료로 남아있는 items 혹은 새로 생성된 poster에서 나온 사진일 가능성이 많으므로 
```
rclone sync --progress /Users/woonjjang/durumi/womenandwar/media ww:media
```

## post | 1396 items
- wordpress xml 파일을 기준으로 마이그레이션
- wordpress to markdown
- Mixed content detected (5054개) replace http:// ->https://


## 메뉴 및 페이지 관련
https://docs.google.com/spreadsheets/d/1GDTYcoEUKJ_K4oJ8_enAcN0AOb9ZpG3jP0QKO7ax3Eo/edit#gid=0
