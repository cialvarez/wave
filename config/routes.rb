Rails.application.routes.draw do


  root 'home#index'
  get 'members/new/(:parent_id)', to:'members#new', as: :new_member
  resources :members, :only => [:index, :create, :delete, :edit, :update, :show]
end
