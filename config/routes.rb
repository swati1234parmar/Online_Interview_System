Rails.application.routes.draw do
  get "/score/test/:id" => "tests#score" ,as: :score
  get "/test/:id/result" => "tests#result", as: :result
  
  resources :answers
  resources :tests 
  resources :test_questions
  get 'home/index'
  root to: "home#index"

 get "users/results" => "admin/tests#user", as: :users
 get "user/:id/result" => "admin/tests#user_result", as: :user_result
  devise_for :users
  
  get "test/:id" => "tests#paper", as: :paper
  get "start_test/:id" => "tests#start_test", as: :start_test
  post "test/:id" => "tests#submit", as: :submit
  namespace :admin do
    resources :tests
    resources :questions
  end
  get "/*args"=>"tests#undef"
end
