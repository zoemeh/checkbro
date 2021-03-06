Rails.application.routes.draw do
  get 'home/index'
  resources :checklist_items
  resources :checklists do
    post "add_item", to: "checklists#add_item"
    get "edit_title", to: "checklists#edit_title"
    patch "edit_title", to: "checklists#update_title"
    patch "reset", to: "checklists#reset_checklist"
  end
  root to: "home#index"

  get "/sidebar", to: "home#sidebar"
  get "/sidebar/checklist/new", to: "home#sidebar_new_checklist"
  post "/sidebar/checklist/new", to: "home#sidebar_create_checklist"

  scope controller: :pages do
    get :up
  end

  # Sidekiq has a web dashboard which you can enable below. It's turned off by
  # default because you very likely wouldn't want this to be available to
  # everyone in production.
  #
  # Uncomment the 2 lines below to enable the dashboard WITHOUT authentication,
  # but be careful because even anonymous web visitors will be able to see it!
  # require "sidekiq/web"
  # mount Sidekiq::Web => "/sidekiq"
  #
  # If you add Devise to this project and happen to have an admin? attribute
  # on your user you can uncomment the 4 lines below to only allow access to
  # the dashboard if you're an admin. Feel free to adjust things as needed.
  # require "sidekiq/web"
  # authenticate :user, lambda { |u| u.admin? } do
  #   mount Sidekiq::Web => "/sidekiq"
  # end

  # Learn more about this file at: https://guides.rubyonrails.org/routing.html
end
