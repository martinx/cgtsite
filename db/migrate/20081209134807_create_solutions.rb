class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.string :so_title
      t.text :so_content
      t.string :so_author
      t.integer :solution_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :solutions
  end
end
