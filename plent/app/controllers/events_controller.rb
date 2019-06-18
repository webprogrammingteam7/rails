  class EventsController < ApplicationController

    #일단 액션 세팅 

    #before_action :authenticate_user!, except: [:main, :index]
    def main #메인페이지
      @tags1 = Tag.where(category: '유형')
      @tags2 = Tag.where(category: '주제')
      @events = Event.all

      #@this_month = Time.now.month
      t = Time.now
      #이번달 범위 설정. 함수를 모델에 넣어 두는게 좋을까? 
      @month_range = t.beginning_of_month..t.end_of_month
      @month_events = Event.where(:date => @month_range)
      
    end

    def index #검색된 페이지. 태그에 맞는것들만 불러오기
      @tags = Tag.all

    ## Main에서 넘어온 애들 처리 + Index에서 태그 검색      
      @s = Array.new
    # strong params만 추가하면 된다!!
      if params[:id] == nil
    # 밑에 like 구문은 안전하지 못함. 나중에 스트롱하게 바꾸자
        if params[:event] 
          @s = Event.where("title LIKE '%#{params[:event]}%' OR title LIKE '%#{params[:event]}%'")
        else
          @s = Event.all
        end
      else
        params[:id].each do |f|
          if params[:event]    
            Tag.find_by_id(f).events.where("title LIKE '%#{params[:event]}%' OR title LIKE '%#{params[:event]}%'").each do |d|
            @s.push(d)
            end
          else
           Tag.find_by_id(f).events.each do |d|
             @s.push(d)
            end
          end
        end
      end

      if request.post?
        respond_to do |format|
        format.js { render partial: 'results'}
         end
      end
    end


    def show # 상세페이지
      @event = Event.find(params[:id])
      @tag = Tag.find(@event.tags.ids)
      respond_to do |format|
      format.js { render 'show' }
    
    end
      #@events = Array.new
      #if params[:id]

    #    @events.push(Event.find(params[:id]))
      #@events.push(@event)
    #elsif params[:ids]
     # params[:ids].each do |q|
      #  @events.push(Event.find(q))
     # end
    #end
    #respond_to do |format|
     # format.js { render 'show' }
    #end
  end

    def new # 게시물 올리는 페이지
      @event = Event.new # db 안넣은 빈 모델
      @year = Time.now.year
      @tags = Tag.all
    end

    def edit # 올린 사람이 편집하는 페이지
      @event = Event.find(params[:id])
    end

    def update # edit 액션의 post request
      @event = Event.find(params[:id])

      if @event.update(events_params)
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

    def destroy # 삭제 request . 관리자만의 기능으로 해야할듯
      @event = Event.find(params[:id])
      @event.destroy
    end

    private # Strong Params (보안)
    def events_params
     params.require(:event).permit!
   end

      #선택된 Tag id로 Tag db 찾는 함수. 아직 실패한 함수
      def selected_tags
        params[:tag].each do |t|
         @t = Tag.find_by(:id => "#{t}")
       end

     end

   end

