Rails.application.routes.draw do
  get 'welcome/index'
  get 'index' => "articles#index"

  resources :articles, :comments, param: :slug do
    resources :comments  
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
