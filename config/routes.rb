Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resource :user do
      post '/add' => 'user#add'
    end
    resource :auth do
      post '/login'=> 'auth#login'
    end
end
