WineReview::Application.routes.draw do
resources :wines do
  get 'page/:page', :action => :index, :on => :collection
end
root 'wines#index'
end