require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  test "email_valildation" do
    # Det måste finnas en Category med id 1
    assert Category.find 1
    
    # Skapa en supplier med category_id 1
    supplier = Supplier.new :category_ids => [1]
    
    # Sätt en felaktig emailadress och verifiera att valideringen protesterar
    # och att det är emailadressen den protesterar på
    supplier.email = "invalid"
    assert !supplier.valid?
    assert_equal supplier.errors[:email], ["is invalid"]
    
    supplier.email = "invalid@domain"
    assert !supplier.valid?
    assert_equal supplier.errors[:email], ["is invalid"]
    
    # Sätt en korrekt emailadress och verifiera att valideringen går igenom
    supplier.email = "valid@address.com"
    assert supplier.valid?
    
    # Sätt en tom emailadress
    supplier.email = ""
    assert supplier.valid?
    
    # Sätt en blank emailadress
    supplier.email = nil
    assert supplier.valid?
  end
end
