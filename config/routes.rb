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
    get '/customers' => 'customers#index', as: 'customers'
    get '/customers/:id' => 'customers#show', as: 'customers_show'
    get '/customers/:id/edit' => 'customers#edit', as: 'customers_edit'
    patch '/customers/:id' => 'customers#update', as: 'update'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_details
  end

  scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
    get '/customers/my_page' => 'customers#show', as: 'my_page'
    get '/customers/information/edit' => 'customers#edit', as: 'edit_customer'
    get '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    patch '/customers/deleteprocess' => 'customers#deleteprocess', as: 'deleteprocess'
    patch '/customers/information' => 'customers#update', as: 'customer'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    post '/orders/confirmation' => 'orders#confirmation', as: 'confirmation'
    get '/orders/completion' => 'orders#completion', as: 'completion'
    resources :orders
    resources :items
    resources :cart_items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
