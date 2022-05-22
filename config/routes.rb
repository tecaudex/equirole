Rails.application.routes.draw do

  devise_for :users
  resources :ads
  resources :resumes
  resources :roles
  resources :admin do
    get :users, on: :collection
    delete :del_user, on: :member
  end

  get "generate_pdf" , :to => "resumes#generate_pdf"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  unauthenticated :user do
    root :to => 'home#index'
  end

  get "about_us" , :to => "home#about_us"
  get "contact_us" , :to => "home#contact_us"
  get "resumes/approve/:id" , :to => "resumes#approve"

  authenticated :user do
    root :to => "resumes#index", :as => "authenticated_root"
  end
end
