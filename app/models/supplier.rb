class Supplier < ActiveRecord::Base
  has_and_belongs_to_many :categories
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, if: "email?"
end
