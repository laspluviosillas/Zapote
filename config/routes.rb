EnglishQuiz::Application.routes.draw do
  devise_for :users, :controllers =>{ :sessions => "users/sessions" }

  resources :quizzes do
    resources :questions
    resources :text_questions
    resources :dictation_questions
    resources :multiple_choice_questions    
  end
  
  resources :users do
    resources :statistics
    resources :practice_entries
  end
  
  resources :tags
  
  root :to => "home#index"
  match '/quizzes/tags/:tag' => "quizzes#index", :as => :quiz_tag
  match '/quizzes/:id/reassign' => "quizzes#reassign", :as => :reassign_question
  match '/questions/:id/edit' => "questions#edit", :as => :edit_question  
  match "/multiple_choice_questions/:id" => "multiple_choice_questions#show", :as => :multiple_choice_question, :via => :get
  match "/multiple_choice_questions/:id" => "multiple_choice_questions#update", :via => :put
  match 'statistics' => "statistics#create"
  match '/quizzes/:id/take' => "quizzes#take", :as => :take
  match "/quizzes/:quiz_id/questions/new" => "patients#show"
  match "/images/uploads/*path" => "gridfs#serve"
  
  resources :practice_entries
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
