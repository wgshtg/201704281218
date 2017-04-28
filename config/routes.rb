Rails.application.routes.draw do
  resources :users
  resources :candidates do
    member do
      post :vote
    end
#     新增投票路由需要有id->member 用post
  end
end
