WineReview::Application.routes.draw do
  resources :logentries

resources :wines do
  resources :logentries
  get 'page/:page', :action => :index, :on => :collection
end
root 'wines#index'
end