Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
# 親のresourcesで指定したコントローラ名に、子のresourcesで指定したコントローラ名が続くURLが生成されるのが確認できます。
# このような親子関係を、「ネストする」と言います。
# 必要ではないけど、「ある投稿画像に関連付けられたコメント」と認識できるURLのほうが、ユーザにとってわかりやすいです。
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
