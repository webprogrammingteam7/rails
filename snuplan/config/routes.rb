Rails.application.routes.draw do
  get 'events/main'
  get 'events/index'
  get 'events/new'
  get 'events/show'

  root 'events#main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
	resources :comments 
end

end
