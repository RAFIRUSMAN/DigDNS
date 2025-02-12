Rails.application.routes.draw do
  root "dns#index"
  post "/lookup", to: "dns#lookup"
end
