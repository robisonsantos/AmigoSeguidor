class Whishlists < ActiveRecord::Base
  # relationship Whishlists X User
  belongs_to :user

  # relationship Wishlists X Wishitens
  has_many :whishitems, :dependent => :destroy
  accepts_nested_attributes_for :whishitems, :allow_destroy => true
end
