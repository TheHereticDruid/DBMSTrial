json.array!(@sales) do |sale|
  json.extract! sale, :id, :gid, :price, :pub, :sold, :stocked, :hardcopy
  json.url sale_url(sale, format: :json)
end
