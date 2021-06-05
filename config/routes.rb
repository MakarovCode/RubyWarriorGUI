Codiges::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'


  get "publics/index"
  get "publics/faq"
  get "publics/about_us"


  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :tutorials, only: [:index, :show, :update]

  resources :comments, only: [:create, :update]

  resources :users do
    member do
      # put "update"
    end
  end

  # resources :assessment_post do
  #   collection do
  #     post "evaluate"
  #   end
  # end

  resources :publics do
    collection do
      get "contact"
      post "create_contact"

    end
    member do
      # put "update"
    end

  end

  resources :ruby_warrior do
  end

  namespace :rubywarrior do
    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        resources :game do
          collection do
            post "run"
          end
        end
      end
    end

    resources :warriors do
      resources :levels
    end
  end

  resources :posts_helper do
    member do
      post "evaluate_sum"
      post "evaluate_substraction"
    end
  end

  # namespace :decorators do
  #   namespace :controllers do
  #     namespace :forem do
  #       resources :post_controller_decorator do
  #         collection do
  #           post "evaluate"
  #         end
  #       end
  #     end
  #   end
  # end

end
