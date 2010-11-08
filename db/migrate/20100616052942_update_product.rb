class UpdateProduct < ActiveRecord::Migration
  def self.up
    change_column :products, :price, :float
  end

  def self.down
    change_column :products, :price, :integer
  end
end
