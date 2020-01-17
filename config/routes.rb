Rails.application.routes.draw do
  scope '/posts/:post_id' do
    resources :comments, only: [:index, :new, :create]
  end
end
