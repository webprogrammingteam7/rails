
# Ruby on Rails로 SNUPLAN 작업 세팅

# CSS 파일
- app/assets/stylesheets/에 있는 scss 파일들로 css 작업(SASS도 가능해요)
- events.scss는 view/events 에 있는 html.erb 파일에 모두 적용됩니다. html 파이렝 stylesheet 불러오기 따로 설정하지 않아도 됩니다.
(events에 포함되는 페이지 : 메인(main) / 검색(index) / 글쓰기(new) 페이지)
- stylesheets 폴더에 사용할 이미지, 폰트 저장 가능합니다.

# HTML 파일
- app/views/events (혹은 comments / mypages. controller 단위로 html 폴더도 나뉩니다
- main.html.erb : 메인 페이지
- show.html.erb : 상세 페이지
- index.html.erb : 검색 페이지
*각 html 파일은 공통되지 않는 몸통 부분만 작성합니다!
- _form.html.erb : 공통되는 요소 빼놓은 것. layout은 자동적용인 반면 요녀석은 <%= render 'form' %>

- app/views/layouts/application.html.erb
: 이 파일은 모든 html 페이지에 공통되는 요소들 모아둔 겁니다. <head> <body> <header> <footer> 등
