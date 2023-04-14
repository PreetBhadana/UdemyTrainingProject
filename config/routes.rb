Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "home#home"
  root "pages#home"
  ### Employees ###
  # get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'employees/:id', to: 'pages#show_employee'
  post 'employees', to: 'pages#create_employee'
  get 'employees_new', to: 'pages#new_employee'
  get 'employee_edit/:id', to: 'pages#edit_employee'
  patch 'employee_update/:id', to: 'pages#update_employee'
  delete 'employee_destroy/:id', to: 'pages#destroy_employee'
  ### Departments ###
  get 'departments', to: 'pages#departments'
  get '/department/new', to: 'pages#new_department'
  post 'department_create', to: 'pages#create_department'
  get 'departments/:id', to: 'pages#show_department'
  get 'department_edit/:id', to: 'pages#edit_department'
  patch 'department_update/:id', to: 'pages#update_department'
  delete 'department_destroy/:id', to: 'pages#destroy_department'
  ### Projects ###
  resources :projects
  ### Current user ###
  get 'edit_current_user', to: 'current_user#edit_current_user'
  patch 'update_current_user', to: 'current_user#update_current_user'

  ### APIS => api/v1 ###
  namespace :api do
    namespace :v1 do
      get '/index', to: 'user#index'
      post '/user', to: 'user#user_info'
    end
  end

end
