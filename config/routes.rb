Rails.application.routes.draw do

  devise_for :users
  resources :ads
  resources :resumes

  get "generate_pdf" , :to => "resumes#generate_pdf"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "resumes#index"
end
