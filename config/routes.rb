Rails.application.routes.draw do
  root to: ->(env) { [404, {}, []] }

  scope '/posts/:post_id' do
    resources :comments, only: [:index, :new, :create]
  end
end
