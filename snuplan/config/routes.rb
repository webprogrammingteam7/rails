Rails.application.routes.draw do
  get 'my_pages/edit'
  get 'my_pages/index'
  get 'my_pages/my_post'
  get 'my_pages/new'

  #로그인관련
  devise_for :users
  #

  post 'my_pages/index' => 'my_pages#index'
 
  get 'events/main'
  get 'events/index'
  get 'events/new'
  get 'events/show'
  get 'events/fullpage' => 'events#fullpage'
  post 'events/index' => 'events#index', defaults: {format: 'js'}
  post 'events/show' => 'events#show', defaults: {format: 'js'}

  root 'events#main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
	resources :comments 
end
  resources :my_pages

end
