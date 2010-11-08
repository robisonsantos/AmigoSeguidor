class Wishitem < ActiveRecord::Base
  # relationship Wishitens X Whishlists
  belongs_to :wishlist
end
