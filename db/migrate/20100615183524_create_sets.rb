class CreateSets < ActiveRecord::Migration
  def self.up
    create_table :complects do |t|
      t.string :title
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :catalog_id
      t.text :description
      t.timestamps
    end
    remove_column :products, :catalog_id
    remove_column :products, :description
    remove_column :products, :image_file_name
    remove_column :products, :image_content_type
    remove_column :products, :image_file_size
    remove_column :products, :image_updated_at
    add_column :products, :complect_id, :integer
    remove_column :photos, :product_id
    add_column :photos, :complect_id, :integer
  end

  def self.down
    add_column :products, :catalog_id, :integer
    add_column :products, :description, :text
    add_column :products, :image_file_name, :string
    add_column :products, :image_content_type, :string
    add_column :products, :image_file_size, :integer
    add_column :products, :image_updated_at, :datetime
    remove_column :products, :complect_id
    add_column :photos, :product_id, :integer
    remove_column :photos, :complect_id
    drop_table :complects
  end
end
