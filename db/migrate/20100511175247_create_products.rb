class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :price
      t.integer :catalog_id
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end