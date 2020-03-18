Rails.application.routes.draw do
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  get 'about', to: 'pages#about'
  resources :students, except: [:destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'student_course', to: 'student_courses#create'
  delete 'student_course', to: 'student_courses#destroy'
end
