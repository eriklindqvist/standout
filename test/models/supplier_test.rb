require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  test "category_presence" do
    # Skapa en ny Supplier utan att sätta category_id,
    # och verifiera att valideringen inte går igenom, samt att
    # det är kategorin den protesterar på.
    supplier = Supplier.new
    assert !supplier.valid?
    assert_equal supplier.errors[:category], ["must be a valid category"]
  end

  test "email_valildation" do
    # Det måste finnas en Category med id 1
    assert Category.find 1
    
    # Skapa en supplier med category_id 1
    supplier = Supplier.new :category_id => 1
    
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
