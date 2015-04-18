Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
  	get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	end
  resources :users

  get 'rate_stuff', :to => 'rate#facebook_photos', :as => :rate_facebook_photos
end
