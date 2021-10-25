Rails.application.routes.draw do
  resources :ads
  resources :resumes
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "resumes#index"
end
