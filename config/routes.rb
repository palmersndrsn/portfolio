Rails.application.routes.draw do

  match "*path", to: "site#index", via: "get"
  get 'site/index'
  root 'site#index'

end
