class MyPagesController < ApplicationController
   def index #내가 좋아요한 event id값으로 불러오기
  	#좋아요에서 삭제 기능도 넣어야

    #좋아요한 이벤트 변수
    @like_events = Event.all
  	
  end

  def my_post #내가 게시한 event 목록
  	
  	
  end

  def show # 상세페이지

  	#@event = Event.find(params[:id])
  end

  def new # 게시물 올리는 페이지
  	@event = Event.new # db 안넣은 빈 모델
  	@year = Time.now.year
  	@tags = Tag.all
  end

  def edit # 올린 사람이 편집하는 페이지
  	
  end

  def update # edit 액션의 post request
  	@event = Event.find(params[:id])
 
  if @event.update(event_params)
    redirect_to @event
  else
    render 'edit'
  end
  	
  end

  def create # new 액션의 post request
  	@event = Event.new(event_params)
  	if @event.save #model validation 통과해서 만들어치면 true
  		#redirect_to @event #my_post로 가도록 재설정해야
  		redirect_to action: "index"
  	else
  		render 'new'	
  	end

  	
  end

  def destroy # 삭제 request . 올린사람만 할수있게 해야할듯
  	@event = Event.find(params[:id])
  	@event.destroy
  end

  private # Strong Params (보안) 함수가 원라인이면 return 생략 가능한 루비
  def event_params # 아직 이미지 열은 안만들었음
  	params.require(:event).permit(:title, :date, :location, :text)
  end
end 