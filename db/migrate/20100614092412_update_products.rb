class UpdateProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :composition, :string
    add_column :products, :first_color, :string
    add_column :products, :second_color, :string
    add_column :products, :size, :string
  end

  def self.down
    remove_column :products, :composition
    remove_column :products, :first_color
    remove_column :products, :second_color
    remove_column :products, :size
  end
end
