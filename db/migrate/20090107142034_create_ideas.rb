class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.string :author
      t.string :title
      t.text :content
      t.integer :idea_type_id
      t.timestamps
    end
  end

  def self.down
    drop_table :ideas
  end
end
