json.array!(@black_lists) do |black_list|
  json.extract! black_list, :id, :name
  json.url black_list_url(black_list, format: :json)
end
