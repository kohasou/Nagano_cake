Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to: "homes#top"
    #get '/' => 'homes#top', as: 'top'
    get '/customers' => 'customers#index', as: 'customers'
    get '/customers/:id' => 'customers#show', as: 'customers_show'
    get '/customers/:id/edit' => 'customers#edit', as: 'customers_edit'
    patch '/customers/:id' => 'customers#update', as: 'update'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
    get '/customers/my_page' => 'customers#show', as: 'my_page'
    get '/customers/information/edit' => 'customers#edit', as: 'edit_customer'
    get '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    patch '/customers/deleteprocess' => 'customers#deleteprocess', as: 'deleteprocess'
    patch '/customers/information' => 'customers#update', as: 'customer'
    resources :orders
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
