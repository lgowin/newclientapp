json.array!(@financials) do |financial|
  json.extract! financial, :id
  json.url financial_url(financial, format: :json)
end
