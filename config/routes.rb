BossaInRio::Application.routes.draw do
  namespace :admin do
    match '/' => redirect('/admin/pages')

    resources :pages, :only => [:index, :show] do
      collection do
        get :by_slug
      end
      resources :snippets, :only => [:edit, :update]
    end
  end

  # FIX: localized routes are not working properly, not using them for now...
  # localized(I18n.available_locales, :verbose => true) do
    scope "/:i18n_locale", :constraints => {:i18n_locale => /#{I18n.available_locales.join('|')}/i} do
      match '/' => 'pages#index', :as => :home
      match '/hostel' => 'pages#hostel', :as => :hostel
      match '/services' => 'pages#services', :as => :services
      match '/photos' => 'pages#photos', :as => :photos
    end
  # end

  root :to => 'pages#index'
end
