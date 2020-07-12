Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		get '/health', to: "health#status"		
  		
      get '/recurring_availabilities', to: "recurring_availabilities#index"		
  		post '/recurring_availabilities', to: "recurring_availabilities#create"		
  		delete '/recurring_availabilities/:id', to: "recurring_availabilities#destroy"		
  		put '/recurring_availabilities/:id', to: "recurring_availabilities#update"		

      get '/exact_availabilities', to: "exact_availabilities#index"
      post '/exact_availabilities', to: "exact_availabilities#create"
      delete '/exact_availabilities/:id', to: "exact_availabilities#destroy"    
      put '/exact_availabilities/:id', to: "exact_availabilities#update"    
  	end
  end
end
