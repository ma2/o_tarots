json.array!(@tarots) do |tarot|
  json.extract! tarot, :id, :name, :author, :pw
  json.url tarot_url(tarot, format: :json)
end
