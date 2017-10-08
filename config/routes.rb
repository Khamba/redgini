# == Route Map
#
#                   Prefix Verb   URI Pattern                             Controller#Action
#                     root GET    /                                       static_pages#home
#                 products GET    /products(.:format)                     products#index
#                          POST   /products(.:format)                     products#create
#              new_product GET    /products/new(.:format)                 products#new
#             edit_product GET    /products/:product_id/edit(.:format)    products#edit
#                  product PATCH  /products/:product_id(.:format)         products#update
#                          PUT    /products/:product_id(.:format)         products#update
#                          DELETE /products/:product_id(.:format)         products#destroy
#               categories GET    /categories(.:format)                   categories#index
#                          POST   /categories(.:format)                   categories#create
#             new_category GET    /categories/new(.:format)               categories#new
#            edit_category GET    /categories/:category_id/edit(.:format) categories#edit
#                 category PATCH  /categories/:category_id(.:format)      categories#update
#                          PUT    /categories/:category_id(.:format)      categories#update
#                          DELETE /categories/:category_id(.:format)      categories#destroy
#                     cart GET    /cart(.:format)                         cart#show
#              add_to_cart POST   /add_to_cart(.:format)                  cart#add
#         remove_from_cart GET    /remove_from_cart(.:format)             cart#remove
#                    login GET    /login(.:format)                        sessions#new
#                          GET    /auth/:provider/callback(.:format)      sessions#create
#                   logout GET    /logout(.:format)                       sessions#destroy
#            mobile_number GET    /mobile_number(.:format)                mobile_number#new
#   mobile_number_send_otp POST   /mobile_number/send_otp(.:format)       mobile_number#send_otp
# mobile_number_verify_otp POST   /mobile_number/verify_otp(.:format)     mobile_number#verify_otp
#                 checkout GET    /checkout(.:format)                     orders#new
#                thank_you GET    /thank_you(.:format)                    orders#show
#              place_order POST   /place_order(.:format)                  orders#create
# 

Rails.application.routes.draw do
  root 'static_pages#home'
  resources :products, except: :show, param: :product_id
  resources :categories, except: :show, param: :category_id

  get 'cart', to: 'cart#show'
  post :add_to_cart, to: 'cart#add'
  get :remove_from_cart, to: 'cart#remove'

  get 'login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'mobile_number', to: 'mobile_number#new'
  post 'mobile_number/send_otp', to: 'mobile_number#send_otp'
  post 'mobile_number/verify_otp', to: 'mobile_number#verify_otp'

  get 'checkout', to: 'orders#new'
  get 'thank_you', to: 'orders#show'
  post 'place_order', to: 'orders#create'
end
