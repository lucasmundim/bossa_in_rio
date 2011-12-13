BossaInRio::Application.routes.draw do
  namespace :admin do
    match '/' => redirect('/admin/pages')

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
      end

      resources :photos, :only => [:new, :edit, :create, :update, :destroy] do
        post :reorder, :on => :collection
      end
    end
  end

  # FIX: localized routes are not working properly, not using them for now...
  # localized(I18n.available_locales, :verbose => true) do
    scope "/:i18n_locale", :constraints => {:i18n_locale => /#{I18n.available_locales.join('|')}/i} do
      match '/' => 'pages#index', :as => :home
      match '/hostel' => 'pages#hostel', :as => :hostel
      match '/hostel/services' => 'pages#services', :as => :services
      match '/hostel/facilities' => 'pages#facilities', :as => :facilities
      match '/rooms' => 'pages#rooms', :as => :rooms
      match '/rooms/dorms' => 'pages#dorms', :as => :dorms
      match '/photos' => 'pages#photos', :as => :photos
      match '/location' => 'pages#location', :as => :location
      match '/location/santa' => 'pages#santa', :as => :santa
      match '/reservation' => 'pages#reservation', :as => :reservation
      match '/contact' => 'pages#contact', :as => :contact
    end
  # end

  resources :messages, :only => [:create]

  resources :reservations, :only => [:create]

  root :to => 'pages#index'
end
