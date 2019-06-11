class EventsController < ApplicationController
	
  #일단 액션 세팅	

  before_action :authenticate_user!, except: [:main, :index]
  def main #메인페이지
    @tags1 = Tag.first(4)
    @tags2 = Tag.last(7)
    @events = Event.all

   @this_month = Time.now.month
    t = Time.now
    #이번달 범위 설정
    @month_range = t.beginning_of_month..t.end_of_month
    @month_events = Event.where(:date => @month_range)
  end

  ##def fullpage
   # @this_month = Time.now.month
    #month_events = Event.where(title: "두번쨰 행사")
   # t = Time.now
   # @month_range = t.beginning_of_month..t.end_of_month
   # @month_events = Event.where(:date => @month_range)
    #@month_events = Event.where(:date.month => (Time.now.month))
    #@month_events = Event.where('extract(month from date) = ?', @this_month)
    
   # @month_events = Event.where("cast(strftime('%m', date) as int) = ?", @this_month)
 #end


  def index #검색된 페이지. 태그에 맞는것들만 불러오기

   @a = Array.new
 # 태그검색 함수!! strong params만 추가하면 된다!!
 if params[:tag] == nil
  @a = Event.all
else
  params[:tag].each do |f|
   Tag.find_by_id(f).events.each do |d|
    @a.push(d)
  end

end
end

##테스트중
@tags = Tag.all
@s = Array.new

#if params[:id]
# respond_to do |format|
 #   format.js { render partial: 'show'}
 # end
 # @event = Event.find(params[:id])
 if params[:search] 
  params[:search].each do |f|
   Tag.find_by_id(f).events.each do |d|
     @s.push(d)
   end
 end 

 respond_to do |format|
  format.js { render partial: 'results'}
end

else
  @s = Event.all
end



end
  




  def show # 상세페이지
    @events = Array.new
    if params[:id]

  	@events.push(Event.find(params[:id]))
    #@events.push(@event)
  elsif params[:ids]
    params[:ids].each do |q|
      @events.push(Event.find(q))
    end
  end
    respond_to do |format|
      format.js { render 'show' }
    end
  end

  def new # 게시물 올리는 페이지
  end

  def edit # 올린 사람이 편집하는 페이지
  	
  end

  def update # edit 액션의 post request
  	
  end

  def create # new 액션의 post request
  	
  end

  def destroy # 삭제 request . 관리자만의 기능으로 해야할듯
  	
  end

  private # Strong Params (보안)
  def events_params
   params.require(:event).permit(:title, :text)
 end

    #선택된 Tag id로 Tag db 찾는 함수. 아직 실패한 함수
    def selected_tags
      params[:tag].each do |t|
       @t = Tag.find_by(:id => "#{t}")
     end

   end

 end

