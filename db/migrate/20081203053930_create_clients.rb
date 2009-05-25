class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :cl_name
      t.text :cl_desc
      
      t.string :content_type
      t.string :filename
      t.integer :size
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
