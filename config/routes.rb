Rails.application.routes.draw do
  get 'choose_name' => 'lead_gen#choose_name'
  resources :black_lists
  post 'blacklist_word_imports' => 'black_lists#blacklist_word_imports'
  post 'lead_gen/take_decision' => 'lead_gen#take_decision'
end
