BossaInRio::Application.routes.draw do
  localized(I18n.available_locales, :verbose => true) do
    scope "/:i18n_locale", :constraints => {:i18n_locale => /#{I18n.available_locales.join('|')}/} do
      resources :pages
    end
  end

  root :to => 'pages#index'

  match 'fotos' => 'pages#photos', :as => :photos
end
