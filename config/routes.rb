FamilyRoom::Application.routes.draw do

  get '/about' => "pages#about", as: 'about'

  get '/invite_members' => 'members#invite_members'
  post '/create_invite_members' => 'members#create_invite_members'

  # Routes for the Message resource:
  # CREATE
  get '/messages/new', controller: 'messages', action: 'new', as: 'new_message'
  post '/messages', controller: 'messages', action: 'create', as: 'messages'

  # READ
  # get '/messages', controller: 'messages', action: 'index'
  get '/messages/:id', controller: 'messages', action: 'show', as: 'message'

  # UPDATE
  get '/messages/:id/edit', controller: 'messages', action: 'edit', as: 'edit_message'
  patch '/messages/:id', controller: 'messages', action: 'update'

  # DELETE
  delete '/messages/:id', controller: 'messages', action: 'destroy'
  #------------------------------

  # Routes for the Family resource:
  # CREATE
  get '/families/new', controller: 'families', action: 'new', as: 'new_family'
  post '/families', controller: 'families', action: 'create', as: 'families'

  # READ
  get '/families', controller: 'families', action: 'index'
  get '/families/:id', controller: 'families', action: 'show', as: 'family'

  # UPDATE
  get '/families/:id/edit', controller: 'families', action: 'edit', as: 'edit_family'
  patch '/families/:id', controller: 'families', action: 'update'

  # DELETE
  delete '/families/:id', controller: 'families', action: 'destroy'
  #------------------------------

  # Routes for the Member resource:
  # CREATE
  get "/login" => 'sessions#new'
  get "/logout" => 'sessions#destroy'
  post "/sessions" => 'sessions#create'

  get '/' => 'pages#homepage', :as => 'home'
  root to: 'pages#homepage'

  # root to: 'sessions#new'

  get '/members/new', controller: 'members', action: 'new', as: 'new_member'
  post '/members', controller: 'members', action: 'create', as: 'members'

  # READ
  get '/members', controller: 'members', action: 'index'
  get '/members/:id', controller: 'members', action: 'show', as: 'member'

  # UPDATE
  get '/members/:id/edit', controller: 'members', action: 'edit', as: 'edit_member'
  patch '/members/:id', controller: 'members', action: 'update'

  # DELETE
  delete '/members/:id', controller: 'members', action: 'destroy'

  #------------------------------

end
