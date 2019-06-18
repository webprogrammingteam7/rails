class MyPagesController < ApplicationController
  

  def index
  	@user_events = User.first.events
  end

  def new # 게시물 올리는 페이지
  	@event = Event.new # db 안넣은 빈 모델
  	@year = Time.now.year
  	@tags = Tag.all


  	if request.post?
        respond_to do |format|
        format.js { render 'new'}
         end
      end

  end

  def edit # 올린 사람이 편집하는 페이지
  	@event = Event.find(params[:id])
  end

  def update # edit 액션의 post request
  	@event = Event.find(params[:id])
 
  if @event.update(event_params)
    redirect_to action: "index"
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
  	params.require(:event).permit!
  end

  def tag_params
  	params.require(:event).permit(:tag)
  	
  end

end
