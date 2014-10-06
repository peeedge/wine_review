WineReview::Application.routes.draw do
  resources :logentries

resources :wines do
  get 'page/:page', :action => :index, :on => :collection
end
root 'wines#index'
end