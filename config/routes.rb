Rails.application.routes.draw do
  get 'toppages/index'

    root to: 'toppages#index'
    
    # toppage作成により下記をコメントアウト
    # root to: "tasks#index"
    resources :tasks
end
