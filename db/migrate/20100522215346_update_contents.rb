class UpdateContents < ActiveRecord::Migration
  def self.up
    add_column :contents, :uri, :string
  end

  def self.down
    remove_column :contents, :uri
  end
end
