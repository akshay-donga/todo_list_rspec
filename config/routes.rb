Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: 'sign-in' }
    
    resources :posts
    resources :users, only: :show
    resources :todo_lists, path: 'todos' do
      resources :todo_list_items, path: 'todo-items'
    end
  end
  root to: 'home#index'
end
