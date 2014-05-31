json.array!(@game_lists) do |game_list|
  json.extract! game_list, :id, :name, :dev, :pub, :esrb, :crit, :yor
  json.url game_list_url(game_list, format: :json)
end
