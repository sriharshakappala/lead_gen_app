Rails.application.routes.draw do
  get 'choose_name' => 'lead_gen#choose_name'
  post 'lead_gen/take_decision' => 'lead_gen#take_decision'
end
