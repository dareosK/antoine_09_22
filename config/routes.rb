Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :writings, except: [ :new, :index ]
  resources :projects, except: [ :new, :index ]
  get 'dashboard', to: "pages#dashboard", as: :dashboard
  get 'works', to: "pages#works", as: :works
  get 'about', to: "pages#about", as: :about
  get 'contact', to: "pages#contact", as: :contact
end
