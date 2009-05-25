class CreateAboutComms < ActiveRecord::Migration
  def self.up
    create_table :about_comms do |t|
      t.string :name
      t.text :content
      t.string :email
      t.string :author
      t.string :admin
      t.timestamps
    end
  end

  def self.down
    drop_table :about_comms
  end
end
