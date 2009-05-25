class CreateServiceComments < ActiveRecord::Migration
  def self.up
    create_table :service_comments do |t|
      t.text :sc_desc

      t.timestamps
    end
  end

  def self.down
    drop_table :service_comments
  end
end
