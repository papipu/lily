class UpdateCatalog < ActiveRecord::Migration
  def self.up
    add_column :complects, :composition, :string
    add_column :complects, :first_color, :string
    add_column :complects, :second_color, :string
    add_column :complects, :size, :string
  end

  def self.down
    remove_column :complects, :composition
    remove_column :complects, :first_color
    remove_column :complects, :second_color
    remove_column :complects, :size
  end
end
