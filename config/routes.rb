Rails.application.routes.draw do
  namespace :api, :defaults => { :format => 'json' }, constraints: {format: 'json'} do
    namespace :v1 do
      resources :users, :skills, :endorsements
    end
  end
end
