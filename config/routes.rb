Rails.application.routes.draw do
    
    root  'sessions#new'

    # Groups
    get '/groups/new'      => 'groups#new',  :as => "groups_new"
    get '/groups/:id/edit' => 'groups#edit', :as => "groups_edit"

    get    '/groups'     => 'groups#index',   :as => "groups_index"
    post   '/groups'     => 'groups#create',  :as => "groups_create"
    get    '/groups/:id' => 'groups#show',    :as => "groups_show"
    patch  '/groups/:id' => 'groups#update',  :as => "groups_update"
    delete '/groups/:id' => 'groups#destroy', :as => "groups_destroy"

    get    '/groups/:id/:page' => 'groups#show',    :as => "groups_show_page"

    # Users
    get '/users/new'      => 'users#new',  :as => "users_new"
    get '/users/:id/edit' => 'users#edit', :as => "users_edit"

    post   '/users'     => 'users#create',  :as => "users_create"
    get    '/users/:id' => 'users#show',    :as => "users_show"
    patch  '/users/:id' => 'users#update',  :as => "users_update"
    delete '/users/:id' => 'users#destroy', :as => "users_destroy"

    # Sessions
    get  '/login'      => 'sessions#new',     :as => "sessions_new"
    post '/sessions'   => 'sessions#create',  :as => "sessions_create"
    delete '/sessions' => 'sessions#destroy', :as => "sessions_destroy"

end
