require 'sidekiq/web'
require 'sidekiq/cron/web'

class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class ApiSubdomainPresent
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == 'api'
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  namespace :backoffice do
    resources :contracts
  end

  constraints(SubdomainPresent) do
    root 'dashboard#index', as: :internal_root

    namespace :api do
      namespace :v1 do
        get '/common/ncms' => 'common#ncms', as: :common_ncms
        get '/common/cests' => 'common#cests', as: :common_cests
        get '/common/:ncm_id/cests' => 'common#cests_for_ncm', as: :common_cests_for_ncm
        get '/common/cfops' => 'common#cfops', as: :common_cfops
      end
    end

    namespace :accountant do
      root 'dashboard#index'

      resources :dashboard, only: [:index] do
        member do
          get :xml_files
          get :download_xml_files
        end
      end
    end

    devise_for :users

      resources :units do
        end
    resources :products do
      collection do
        get :price_form
      end

      member do
        get :duplicate
      end
    end
    resources :ncms do
      collection do
        get :search
      end
    end
    resources :cests do
      collection do
        get :search
      end
    end
      resources :countries
    resources :cities
            resources :apps
    resources :banks
      resources :finance_categories do
        end
        resources :payment_acquirers do
        end
      resources :states do
      member do
        get :cities
      end
    end
    resources :companies
    resources :traders do
      collection do
        get :search
      end
    end
        resources :state_tax_configurations do
      member do
        get :add_ncm
      end
    end

    get '/settings' => 'misc#settings', as: :settings
    post '/settings/save' => 'misc#save_setting', as: :save_setting

    namespace :pos do
      namespace :food_service do
        root 'home#index'

        resources :orders do
          resources :order_items

          member do
            patch :set_customer
          end

          collection do
            get :products
            get :toggle_favorite_product
          end
        end

        resources :customer_search, only: [:index] do
          collection do
            get :search
          end
        end
      end
    end
  end

  constraints(SubdomainBlank) do
    root 'site/home#index'
  end

  constraints(ApiSubdomainPresent) do
    namespace :api do
      namespace :v1 do
      end
    end
  end

  mount ActionCable.server => '/cable'

  if Rails.env.production?
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username),
                                                  ::Digest::SHA256.hexdigest('bfscordeiro')) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password),
                                                  ::Digest::SHA256.hexdigest('Pirul3&te'))
    end
  end

  mount Sidekiq::Web => '/sidekiq'
  match '*path', via: [:options], to: lambda { |_| [204, { 'Content-Type' => 'text/plain' }, []] }
end
