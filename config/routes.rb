BossaInRio::Application.routes.draw do
  namespace :admin do
    get '/' => redirect('/admin/pages')

    resources :messages

    resources :reservations

    resources :pages, :only => [:index, :show] do
      collection do
        get :by_slug
      end

      resources :snippets, :only => [:edit, :update] do
        resources :photos, :only => [:new, :edit, :create, :update, :destroy] do
          post :reorder, :on => :collection
        end
        put :update_status
        post :reorder, :on => :collection
      end

      resources :photos, :only => [:new, :edit, :create, :update, :destroy] do
        post :reorder, :on => :collection
      end
    end
  end

  # FIX: localized routes are not working properly, not using them for now...
  # localized(I18n.available_locales, :verbose => true) do
    scope "/:i18n_locale", :constraints => {:i18n_locale => /#{I18n.available_locales.join('|')}/i} do
      get '/' => 'pages#index', :as => :home
      get '/hostel' => 'pages#hostel', :as => :hostel
      get '/hostel/services' => 'pages#services', :as => :services
      get '/hostel/facilities' => 'pages#facilities', :as => :facilities
      get '/rooms' => 'pages#rooms', :as => :rooms
      get '/rooms/dorms' => 'pages#dorms', :as => :dorms
      get '/photos' => 'pages#photos', :as => :photos
      get '/location' => 'pages#location', :as => :location
      get '/location/santa' => 'pages#santa', :as => :santa
      get '/reviews' => 'pages#reviews', :as => :reviews
      get '/media' => 'pages#media', :as => :media
      get '/reservation' => 'pages#reservation', :as => :reservation
      get '/contact' => 'pages#contact', :as => :contact
    end
  # end

  resources :messages, :only => [:create]

  resources :reservations, :only => [:create]

  root :to => 'pages#index'
end
