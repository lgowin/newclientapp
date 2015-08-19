json.array!(@clients) do |client|
  json.extract! client, :id, :firstname, :lastname, :homephone, :cellphone, :email, :referral, :insurance, :inspay, :copay, :clientnotes, :active
  json.url client_url(client, format: :json)
end
