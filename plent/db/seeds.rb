# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tags = Tag.create([{ name: '세미나', category: '유형'}, { name: '취업/창업', category: '유형'}, { name: '공연/전시' , category: '유형'}, { name: '이벤트', category: '유형'}, { name: '봉사', category: '주제'}, { name: '어학', category: '주제'}, { name: '경제/금융', category: '주제'}, { name: '경영/컨설팅', category: '주제'}, { name: '정치/사회', category: '주제'}, { name: 'IT/기술', category: '주제'}, { name: '문화/예술', category: '주제'}  ])

event = Event.create([{title: '[HK평화학세미나]Northern Ireland Peace Under Threat', location: '79동 209호', text: '[HK평화학세미나]Northern Ireland Peace Under Threat', date: Date.parse('2019-07-01'), image: Rails.root.join("app/assets/images/peace.jpg").open }, {title: '[학술]재생산권 공동국제학술회의 "낙태죄 폐지 이후 성평등 재생산권 실현을 위한 법정책의 설계"', location: '서울대 법대 백주년기념관 소강당', text: '재생산권 공동국제학술회의 "낙태죄 폐지 이후 성평등 재생산권 실현을 위한 법정책의 설계"', date: Date.parse('2019-06-22'), image: Rails.root.join("app/assets/images/law.jpg").open }, {title: '[언어교육원]Free Conversation at lunch', location: '137-2동 202호', text: 'Free Conversation at lunch(무료 영어회화)', date: Date.parse('2019-06-20'), image: Rails.root.join("app/assets/images/conversation.jpg").open }, {title: '여름방학 IT 역량강화 워크숍: 데이터 분석 마스터(R프로그램실습)', location: '61동 3202호', text: 'R 프로그래밍 실습', date: Date.parse('2019-07-09'), image: Rails.root.join("app/assets/images/R.jpg").open } ])
user = User.create([{email: 'lone5144@naver.com', password: '123123'}])
User.first.events << Event.first(3)
