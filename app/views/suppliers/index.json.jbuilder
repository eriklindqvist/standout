json.array!(@suppliers) do |supplier|
  json.extract! supplier, :name, :address, :zip, :country, :email, :phone, :category_id
  json.url supplier_url(supplier, format: :json)
end
