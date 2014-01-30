json.array!(@cards) do |card|
  json.extract! card, :id, :number, :name, :text
  json.url card_url(card, format: :json)
end
