Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		get '/health', to: "health#status"		
  		
      get '/recurring_availabilities', to: "recurring_availabilities#index"		
  		post '/recurring_availabilities', to: "recurring_availabilities#create"		
  		put '/recurring_availabilities/:id', to: "recurring_availabilities#update"		
  		delete '/recurring_availabilities/:id', to: "recurring_availabilities#destroy"		

      get '/exact_availabilities', to: "exact_availabilities#index"
      post '/exact_availabilities', to: "exact_availabilities#create"
      put '/exact_availabilities/:id', to: "exact_availabilities#update"    
      delete '/exact_availabilities/:id', to: "exact_availabilities#destroy"    

      get '/schedules', to: "schedules#index"
      post '/schedules', to: "schedules#create"
      put '/schedules/:id', to: "schedules#update"    
      delete '/schedules/:id', to: "schedules#destroy"    
  	end
  end
end
