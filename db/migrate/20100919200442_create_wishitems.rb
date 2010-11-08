class CreateWishitems < ActiveRecord::Migration
  def self.up
    create_table :wishitems do |t|
      t.integer :wishlist_id
      t.string :name
      t.text :description
      t.string :url
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :wishitems
  end
end
