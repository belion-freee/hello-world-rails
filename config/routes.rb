Rails.application.routes.draw do
  # root page
  root "hello_worlds#index"

  # devise
  devise_for :users

  # CRUD page with RESTful
  resources :hello_worlds

  # static page
  scope module: :statics do
    %i[about sample_form ghibli].each {|action| get action }
  end
end
