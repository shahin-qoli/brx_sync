Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :attribute_mappings do
      collection do
        post 'retrieve_attributes'
        post 'create_mapping'
      end 
    end
    resources :documents do
      member do
        get 'get_attributes'
      end
    end
    resources :equivalents do 
      member do
        get 'get_attributes'
      end  
    end
    resources :raw_documents_requests
    
  end

end
