
Rails.application.routes.draw do
  resources :task_lists
  root 'task_lists#index'
end
