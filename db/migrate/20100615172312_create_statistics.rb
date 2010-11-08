class CreateStatistics < ActiveRecord::Migration
  def self.up
    create_table :statistics do |t|
      t.date :date
      t.string :ip
      t.integer :count
      t.string :user_agent
    end
  end

  def self.down
    drop_table :statistics
  end
end
