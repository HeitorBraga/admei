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
  resources :collaborators
  namespace :backoffice do
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
    resources :countries
    resources :cities
    resources :states do
      member do
        get :cities
      end
    end
    resources :companies
    resources :product_categories
    resources :products
    resources :fabrications
    resources :product_costs do
      resources :costs
    end
    resources :spendings do
      resources :sub_products
    end
    resources :sales do
      resources :product_solds
    end
    resources :pay_latters

    post '/paid_out' => 'pay_latters#paid_out'
    get '/settings' => 'misc#settings', as: :settings
    post '/set_profit' => 'dashboard#index'
    post '/settings/save' => 'misc#save_setting', as: :save_setting
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
