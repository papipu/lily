class UpdateComplects < ActiveRecord::Migration
  def self.up
    add_column :complects, :price, :float
    add_column :complects, :on_main, :boolean
  end

  def self.down
    remove_column :complects, :price
    remove_column :complects, :on_main
  end
end
