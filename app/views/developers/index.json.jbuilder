json.array!(@developers) do |developer|
  json.extract! developer, :id, :name, :isIndie
  json.url developer_url(developer, format: :json)
end
