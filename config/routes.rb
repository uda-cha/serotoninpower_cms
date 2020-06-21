Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: ->(env) { [404, {}, []] }

  scope '/posts/:post_id' do
    resources :comments, only: [:index, :new, :create]
    namespace :comments do
      get :wrapper
    end
  end

  namespace :v1, format: :json do
    scope '/posts/:post_id' do
      resources :comments, only: [:index, :create]
    end
  end
end
