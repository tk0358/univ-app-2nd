Rails.application.routes.draw do
  root 'courses#index'
  resources :courses
  get 'about', to: 'pages#about'
  resources :students, except: [:destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'student_course', to: 'student_courses#create'
  delete 'student_course', to: 'student_courses#destroy'
  resources :teachers, only: [:new, :create, :edit, :update, :show]
  get '/teachers/:id/my_courses', to: 'teachers#my_courses', as: 'teacher_courses'
  get '/teachers/:id/my_students', to: 'teachers#my_students', as: 'teacher_students'
  get 'teacher_login', to: 'teacher_sessions#new'
  post 'teacher_login', to: 'teacher_sessions#create'
  delete 'teacher_logout', to: 'teacher_sessions#destroy'
end
