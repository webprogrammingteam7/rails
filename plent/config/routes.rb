Rails.application.routes.draw do

  get 'my_pages/new'
  get 'my_pages/edit'
  get 'my_pages/index'
  post 'my_pages/new' => 'my_pages/new', defaults: {format: 'js'}
  #로그인관련
  devise_for :users
  # 
  get 'events/main'
  get 'events/index'
  get 'events/new'
  get 'events/show'
  post 'events/index' => 'events#index', defaults: {format: 'js'}
  post 'events/show' => 'events#show', defaults: {format: 'js'}
  post 'events/search' => 'events#search', defaults: {format: 'js'}

  root 'events#main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :my_pages do
	resources :comments 
end

end
