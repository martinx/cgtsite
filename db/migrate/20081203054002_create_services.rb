class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :sl_title
      t.text :sl_content
      t.string :sl_author
      t.integer :sl_year
      t.integer :service_type_id
      t.integer :client_id

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
