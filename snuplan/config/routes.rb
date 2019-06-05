Rails.application.routes.draw do
  get 'my_pages/edit'
  get 'my_pages/index'
  get 'my_pages/my_post'
  get 'my_pages/new'
  post 'my_pages/index' => 'my_pages#index'
 
  get 'events/main'
  get 'events/index'
  get 'events/new'
  get 'events/show'


  root 'events#main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
	resources :comments 
end
  resources :my_pages

end
