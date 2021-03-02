# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  #resources :complexities, only: :show do
  #
  #end
  get "/complexity-of-need/offender-no/:offender_no" => "complexities#show"
end