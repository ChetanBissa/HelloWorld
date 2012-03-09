Ajaxjquery::Application.routes.draw do
  resources :emps do
    collection do
      post 'delete_all'
    end
    member do
      post 'edit_col'
    end
  end
  root :to => "emps#index"
end
