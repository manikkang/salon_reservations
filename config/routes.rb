Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, format: 'json' do
    namespace :v1 do
      get  '/salons'							  =>  'home#salons', as: :salons
      get  '/salons/:slug/services'   =>  'home#salon_services', as: :salon_services
      get  '/salon_service/:id/list_slots' => "home#list_slots", as: :list_slots
      post '/reservation' => 'home#reservation', as: :reservation
    end
  end    
end
