Rails.application.routes.draw do
    
    root  'groups#index'

    get '/groups/new'      => 'groups#new',  :as => "groups_new"
    get '/groups/:id/edit' => 'groups#edit', :as => "groups_edit"

    get    '/groups'     => 'groups#index',   :as => "index"
    post   '/groups'     => 'groups#create',  :as => "groups_create"
    get    '/groups/:id' => 'groups#show',    :as => "groups_show"
    patch  '/groups/:id' => 'groups#update',  :as => "groups_update"
    delete '/groups/:id' => 'groups#destroy', :as => "groups_destroy"

end
