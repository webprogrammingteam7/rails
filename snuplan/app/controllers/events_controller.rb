class EventsController < ApplicationController
	
  #일단 액션 세팅	
  def main #메인페이지
    @tags = Tag.all
  end

  def index #검색된 페이지. 태그에 맞는것들만 불러오기
     render plain: params[:tag]
  end

  def show # 상세페이지

  	#@event = Event.find(params[:id])
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
			params.require(:article).permit(:title, :text)
		end

end

