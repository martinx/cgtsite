class CreatePartners < ActiveRecord::Migration
  def self.up
    create_table :partners do |t|
      t.string :pa_name
      t.text :pa_desc
      t.string :pa_url
      
      t.string :content_type
      t.string :filename
      t.integer :size
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end

  def self.down
    drop_table :partners
  end
end
