json.array!([@supplier]) do |supplier|
  json.extract! supplier, :name, :address, :zip, :country, :email, :phone, :category
  json.url supplier_url(supplier, format: :json)
end
