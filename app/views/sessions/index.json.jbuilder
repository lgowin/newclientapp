json.array!(@sessions) do |session|
  json.extract! session, :id, :dateservice, :copayowed, :copayd, :claimsubmit, :claimrecvd, :claimowed, :claimpd, :cptcode, :sessionnotes, :client_id
  json.url session_url(session, format: :json)
end
