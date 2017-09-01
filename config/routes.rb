# == Route Map
#
#        Prefix Verb   URI Pattern                             Controller#Action
#          root GET    /                                       static_pages#home
#      products GET    /products(.:format)                     products#index
#               POST   /products(.:format)                     products#create
#   new_product GET    /products/new(.:format)                 products#new
#  edit_product GET    /products/:product_id/edit(.:format)    products#edit
#       product PATCH  /products/:product_id(.:format)         products#update
#               PUT    /products/:product_id(.:format)         products#update
#               DELETE /products/:product_id(.:format)         products#destroy
#    categories GET    /categories(.:format)                   categories#index
#               POST   /categories(.:format)                   categories#create
#  new_category GET    /categories/new(.:format)               categories#new
# edit_category GET    /categories/:category_id/edit(.:format) categories#edit
#      category PATCH  /categories/:category_id(.:format)      categories#update
#               PUT    /categories/:category_id(.:format)      categories#update
#               DELETE /categories/:category_id(.:format)      categories#destroy
# 

Rails.application.routes.draw do
  root 'static_pages#home'
  resources :products, except: :show, param: :product_id
  resources :categories, except: :show, param: :category_id
  
  post :add_to_cart, to: 'cart#add'
  
end
