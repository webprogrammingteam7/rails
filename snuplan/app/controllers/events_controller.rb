class EventsController < ApplicationController
	
  #일단 액션 세팅	
  def main #메인페이지
    @tags = Tag.all
  end

  def fullpage
    @this_month = Time.now.month
    #month_events = Event.where(title: "두번쨰 행사")
    t = Time.now
    @month_range = t.beginning_of_month..t.end_of_month
    @month_events = Event.where(:date => @month_range)
    #@month_events = Event.where(:date.month => (Time.now.month))
    #@month_events = Event.where('extract(month from date) = ?', @this_month)
    
   # @month_events = Event.where("cast(strftime('%m', date) as int) = ?", @this_month)
 end
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





  def show # 상세페이지.. 현재 무한루프에 빠지는 상태 ㅠㅠ 파일 이름 탓인거 같은데 ;;;

  	@event = Event.find(params[:id])
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

    #선택된 Tag id로 Tag db 찾는 함수
    def selected_tags
      params[:tag].each do |t|
       @t = Tag.find_by(:id => "#{t}")
     end

   end

 end

