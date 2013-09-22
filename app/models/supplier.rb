class Supplier < ActiveRecord::Base
  belongs_to :category
  validates :category, presence: {:message => 'must be a valid category'}
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, if: "email?"
end
