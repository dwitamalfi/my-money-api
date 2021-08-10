Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resource :user do
      post '/add' => 'user#add'
    end
    resource :auth do
      post '/login'=> 'auth#login'
    end
    resource :source_of_fund do 
      post '/add' => 'source_of_fund#add'
    end
    resource :income do
      post '/add' => 'income#add'
    end
end
