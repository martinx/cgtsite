class CreateAbouts < ActiveRecord::Migration
  def self.up
    create_table :abouts do |t|
      t.string :name
      t.text :content
      t.string :author
      t.string :admin
      t.timestamps
    end
  end

  def self.down
    drop_table :abouts
  end
end
