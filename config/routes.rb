Rails.application.routes.draw do
  
  devise_for :users,skip: :all
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session   
    delete 'destroy', to: 'devise/sessions#destroy',as: :current_user_destroy
  end

  
  root to: 'items#index'
  resources :signup ,only: [:index,:create] do
    collection do
      get 'registration'                               
      post 'registration',  to: 'signup#profile_validation' 
      get 'sms_authentication' 
      post 'sms_authentication',  to: 'signup#sms_validation'
      # get 'sms_confirmation'
      # post 'sms_confirmation', to: 'signup#sms_check' 
      get 'address' 
      post 'address', to: 'signup#address_validation' 
      get 'card' 
      get 'done' 
    end
  end  


  resources :users do
    collection do
      # get 'logout'
      get 'profile'
      get 'card_registration'
      get 'card_show'
      get 'mypage'
    end
  end

  get 'users/identification(/:id)', to: 'users#identification', as: :user_identification
  resources :items do
    collection do
      get 'category'
    end
  end

  get 'items/confirm(/:id)', to: 'items#confirm', as: :items_confirm
  resources :cards


  resources :brands, only: [:index]
  resources :categorys, only: [:index]

end 

