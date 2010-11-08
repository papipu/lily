class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.text :text
      t.string :author
      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
