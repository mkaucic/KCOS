Rails.application.routes.draw do

  devise_for :admins
  get 'dogadjanja/sva-dogadjanja', to: 'events#all', as: :all_events
  resources :events, path: :dogadjanja
  get 'novosti/sve-novosti', to: 'news_articles#all', as: :all_news_articles
  resources :news_articles, path: :novosti
  resources :about_us, path: :o_nama
  resources :public_procurements, path: :javna_nabava
  resources :documents, path: :dokumenti
  resources :links, path: :poveznice,                   only: [:index]

  root "pages#home"
  get "/tag/:name", to:"tags#hashtags", as: "tag"
  get "kontakt", to: "pages#contact", as: "kontakt"
  post "/tinymce_assets", to: "tinymce_assets#create"
  get "cookies", to: "pages#cookies", as: "cookies"
  get "toolkit", to: "toolkit#index"
  get "gdpr", to: "pages#gdpr"
  get "impresum", to: "pages#impresum"
  get "pravila_privatnosti", to:"pages#privacy_policy", as: "pravila_privatnosti"
  get "pravne_stranice", to:"pages#legal_pages", as: "legal_pages"


  resources :contact_messages, only: :create do
    collection { post :validate }
  end
  
  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
  
  namespace :admin do
    root "action_logs#index"
    get "toolkit", to: "toolkit#index"
    resources :admins
    resources :admin_accounts,              only: [:edit, :update]
    resources :contact_infos,               only: [:index, :create, :edit, :update]
    resources :contact_messages,            only: [:index, :show]
    resources :action_logs,                 only: [:index, :show]          
    resources :events, path: :dogadjanja do
        resources :event_images, path: :galerija, only: [:index, :create, :destroy] do
          patch :sort, on: :collection
        end
    end
    put "event_toggle_starred", to: "events#toggle_starred", as: "event_toggle_starred"
    put "news_article_toggle_starred", to: "news_articles#toggle_starred", as: "news_article_toggle_starred"
    put "tag_toggle_starred", to: "tags#toggle_starred", as: "tag_toggle_starred"


    resources :news_articles, path: :novosti do
        resources :news_article_images, path: :galerija, only: [:index, :create, :destroy] do
          patch :sort, on: :collection
        end
    end
    resource :about_us, path: :o_nama 
    resource :home_static_texts, path: :pocetni_tekst
    resources :teams do      
      resources :team_images, path: :galerija, only: [:index, :create, :destroy] do
        patch :sort, on: :collection
      end
    end
    resources :public_procurements, path: :javna_nabava
    resources :documents, path: :dokumenti
    resources :links, path: :poveznice
    resources :venues, path: :prostori do
      collection do
        patch :sort 
      end
      resources :venue_images, path: :galerija, only: [:index, :create, :destroy] do
        patch :sort, on: :collection
      end
      resources :capacity_venues, path: :kapacitet
    end
    
    get "prostori/:id/edit_capacities", to: "venues#edit_capacities", as: "edit_capacities"
    resources :tags, path: :tagovi
    resources :post_categories, path: :kategorije
    get "legal", to: "legals#edit"
    patch 'legal', controller: 'legals', action: :update
    resources :social_networks, path: :drustvene_mreze
  end

end
