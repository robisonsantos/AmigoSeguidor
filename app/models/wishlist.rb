class Wishlist < ActiveRecord::Base
  # relationship Whishlists X User
  belongs_to :user

  # relationship Wishlists X Wishitens
  has_many :wishitems, :dependent => :destroy
  accepts_nested_attributes_for :wishitems, :allow_destroy => true
end
