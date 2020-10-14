Rails.application.routes.draw do
  root to: 'posts#index'
  post 'posts', to: 'posts#create'
  # メモのidを取得できるようにルーティング 'posts/:id'pathパラメーター
  get 'posts/:id', to: 'posts#checked'
end